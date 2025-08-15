<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('orders', function (Blueprint $table) {
			$table->id();
			$table->foreignId('user_id')->nullable()->constrained()->nullOnDelete();
			$table->string('order_number')->unique();
			$table->decimal('total_amount', 10, 2);
			$table->decimal('discount_amount', 10, 2)->default(0);
			$table->string('status')->default('pending');
			$table->string('payment_status')->default('pending');
			$table->string('razorpay_order_id')->nullable();
			$table->string('razorpay_payment_id')->nullable();
			$table->string('firstname');
			$table->string('lastname');
			$table->string('email');
			$table->string('mobile_number');
			$table->string('country');
			$table->string('state')->nullable();
			$table->string('city');
			$table->string('street');
			$table->string('postal_code');
			$table->text('notes')->nullable();
			$table->string('coupon_code')->nullable();
			$table->timestamps();
		});
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
