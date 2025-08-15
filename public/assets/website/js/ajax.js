$(document).ready(function () {
    
    
// Add to Cart (updated with better error handling)
$(document).on('click', '.add-to-cart-btn', function (e) {
    e.preventDefault();
    e.stopPropagation(); // Prevent modal from opening
    
    let productId = $(this).data('product-id');
    let quantity = $(this).data('quantity') || 1;

    // Validate data
    if (!productId) {
        alert('Product ID is missing');
        return;
    }

    // Show loading state
    let originalText = $(this).text();
    $(this).text('Adding...').prop('disabled', true);

    $.ajax({
        url: window.LaravelRoutes.cartAdd,
        method: 'POST',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        contentType: 'application/json',
        data: JSON.stringify({
            product_id: productId,
            quantity: quantity
        }),
        success: function (res) {
            console.log('Cart add response:', res); // Debug log
            if (res.success) {
                // Update cart count in header
                $('#header-cart-count').text(res.cart_count);
                
                // Update mini cart content
                $('#mini-cart').html(res.mini_cart_html);
                
                // Calculate and update subtotal for popup modal
                updateCartSubtotal();
                
                // Show cart modal immediately
                $("#shoppingCart").modal("show");
                
                // Force refresh of cart data if needed
                setTimeout(function() {
                    refreshCartData();
                }, 500);
            } else {
                alert('Error: ' + res.message);
            }
        },
        error: function (xhr, status, error) {
            console.error('Cart add error:', xhr.responseText);
            let errorMessage = 'Error adding item to cart.';
            if (xhr.responseJSON && xhr.responseJSON.message) {
                errorMessage = xhr.responseJSON.message;
            } else if (xhr.status === 419) {
                errorMessage = 'Session expired. Please refresh the page and try again.';
            }
            alert(errorMessage);
        },
        complete: function() {
            // Restore button state
            $('.add-to-cart-btn').text(originalText).prop('disabled', false);
        }
    });
});

// Initialize cart when document is ready
$(document).ready(function() {
    // Update cart subtotal on page load
    setTimeout(updateCartSubtotal, 500); // Delay to ensure DOM is fully loaded
    
    // Update cart when modal is shown
    $('#shoppingCart').on('shown.bs.modal', function () {
        updateCartSubtotal();
    });
    
    // Also trigger update when page loads
    $(window).on('load', function() {
        updateCartSubtotal();
    });
});

// Function to refresh cart data from server
function refreshCartData() {
    $.ajax({
        url: window.LaravelRoutes.cartData || '/api/cart',
        method: 'GET',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        success: function(res) {
            if (res.success) {
                $('#header-cart-count').text(res.cart_count);
                $('#mini-cart').html(res.mini_cart_html);
                updateCartSubtotal();
            }
        },
        error: function() {
            console.log('Failed to refresh cart data');
        }
    });
}

// Function to update cart subtotal
function updateCartSubtotal() {
    let total = 0;
    $('.tf-mini-cart-item').each(function() {
        let priceText = $(this).find('.text-button').last().text();
        let priceMatch = priceText.match(/=\s*₹([0-9,]+\.?[0-9]*)/);
        if (priceMatch) {
            total += parseFloat(priceMatch[1].replace(',', ''));
        }
    });
    $('.tf-totals-total-value').text('₹' + total.toFixed(2));
}

// ✅ Remove from Cart (with delegated event binding)
$(document).on('click', '.remove-cart-btn', function (e) {
    e.preventDefault();
    e.stopPropagation();
    e.stopImmediatePropagation();

    // Prevent double-clicking
    if ($(this).hasClass('removing')) {
        return false;
    }
    $(this).addClass('removing');

    let productId = $(this).data('product-id');
    let $button = $(this);

    if (!productId) {
        console.error('Product ID not found');
        $button.removeClass('removing');
        return false;
    }

    $.ajax({
        url: window.LaravelRoutes.cartRemove,
        method: 'DELETE',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        contentType: 'application/json',
        data: JSON.stringify({ product_id: productId }),
        success: function (res) {
            if (res.success) {
                // Update cart count with animation
                $('#header-cart-count').fadeOut(100, function () {
                    $(this).text(res.cart_count).fadeIn(100);
                });

                // Update mini cart content
                $('#mini-cart').html(res.mini_cart_html);
                
                // Update subtotal
                updateCartSubtotal();
                
                // Force a complete cart refresh for session users
                if (res.cart_count === 0) {
                    // Clear any cached cart data
                    sessionStorage.removeItem('cart_data');
                    localStorage.removeItem('cart_data');
                }
                
                console.log('Item removed successfully from cart');
            } else {
                console.error('Failed to remove item:', res.message);
            }
        },
        error: function (xhr, status, error) {
            console.error('AJAX error removing item:', error);
            alert('Failed to remove item from cart.');
        },
        complete: function() {
            // Always remove the 'removing' class to prevent single-click issues
            $button.removeClass('removing');
        }
    });
});


	


	$('.toggle-wishlist').click(function () {
		const productId = $(this).data('product_id');

		$.ajax({
			url: window.LaravelRoutes.wishlistAdd,
			type: 'POST',
			data: {
				product_id: productId,
				_token: $('meta[name="csrf-token"]').attr('content')
			},
			success: function (res) {
				alert('Wishlist: ' + res.status);
				
			},
			error: function (xhr, status, error) {
				console.error('Error toggling wishlist:', error);
			}
		});
	});

	
	
});