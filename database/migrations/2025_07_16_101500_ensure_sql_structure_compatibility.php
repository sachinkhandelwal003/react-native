<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     * This migration ensures all tables match the exact SQL structure provided
     */
    public function up(): void
    {
        // Update users table to match SQL structure exactly
        if (Schema::hasTable('users')) {
            Schema::table('users', function (Blueprint $table) {
                // Check if userId column exists, if not add it
                if (!Schema::hasColumn('users', 'userId')) {
                    $table->string('userId')->nullable()->after('id');
                }
            });
        }
        
        // Update orders table to ensure all fields match SQL structure
        if (Schema::hasTable('orders')) {
            Schema::table('orders', function (Blueprint $table) {
                // Ensure all order fields are present with correct types
                if (!Schema::hasColumn('orders', 'firstname')) {
                    $table->string('firstname')->after('razorpay_payment_id');
                }
                if (!Schema::hasColumn('orders', 'lastname')) {
                    $table->string('lastname')->after('firstname');
                }
                if (!Schema::hasColumn('orders', 'mobile_number')) {
                    $table->string('mobile_number')->after('email');
                }
                if (!Schema::hasColumn('orders', 'country')) {
                    $table->string('country')->after('mobile_number');
                }
                if (!Schema::hasColumn('orders', 'street')) {
                    $table->string('street')->after('city');
                }
                if (!Schema::hasColumn('orders', 'postal_code')) {
                    $table->string('postal_code')->after('street');
                }
                if (!Schema::hasColumn('orders', 'notes')) {
                    $table->text('notes')->nullable()->after('postal_code');
                }
            });
        }
        
        // Update order_items table to match SQL structure
        if (Schema::hasTable('order_items')) {
            Schema::table('order_items', function (Blueprint $table) {
                if (!Schema::hasColumn('order_items', 'name')) {
                    $table->string('name')->after('product_id');
                }
                if (!Schema::hasColumn('order_items', 'price')) {
                    $table->decimal('price', 8, 2)->after('name');
                }
                if (!Schema::hasColumn('order_items', 'subtotal')) {
                    $table->decimal('subtotal', 8, 2)->after('quantity');
                }
                if (!Schema::hasColumn('order_items', 'size')) {
                    $table->string('size')->nullable()->after('subtotal');
                }
                if (!Schema::hasColumn('order_items', 'color')) {
                    $table->string('color')->nullable()->after('size');
                }
            });
        }
        
        // Update blogs table to ensure short_description exists
        if (Schema::hasTable('blogs')) {
            Schema::table('blogs', function (Blueprint $table) {
                if (!Schema::hasColumn('blogs', 'short_description')) {
                    $table->string('short_description', 255)->nullable()->after('status');
                }
            });
        }
        
        // Update banners table to ensure all fields exist
        if (Schema::hasTable('banners')) {
            Schema::table('banners', function (Blueprint $table) {
                if (!Schema::hasColumn('banners', 'title')) {
                    $table->string('title')->nullable()->after('image');
                }
                if (!Schema::hasColumn('banners', 'subtitle')) {
                    $table->string('subtitle')->nullable()->after('title');
                }
                if (!Schema::hasColumn('banners', 'short_description')) {
                    $table->text('short_description')->nullable()->after('subtitle');
                }
                if (!Schema::hasColumn('banners', 'button_text')) {
                    $table->string('button_text')->nullable()->after('short_description');
                }
                if (!Schema::hasColumn('banners', 'button_link')) {
                    $table->string('button_link')->nullable()->after('button_text');
                }
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            if (Schema::hasColumn('users', 'userId')) {
                $table->dropColumn('userId');
            }
        });
        
        Schema::table('orders', function (Blueprint $table) {
            $columnsToCheck = ['firstname', 'lastname', 'mobile_number', 'country', 'street', 'postal_code', 'notes'];
            foreach ($columnsToCheck as $column) {
                if (Schema::hasColumn('orders', $column)) {
                    $table->dropColumn($column);
                }
            }
        });
        
        Schema::table('order_items', function (Blueprint $table) {
            $columnsToCheck = ['name', 'price', 'subtotal', 'size', 'color'];
            foreach ($columnsToCheck as $column) {
                if (Schema::hasColumn('order_items', $column)) {
                    $table->dropColumn($column);
                }
            }
        });
        
        Schema::table('blogs', function (Blueprint $table) {
            if (Schema::hasColumn('blogs', 'short_description')) {
                $table->dropColumn('short_description');
            }
        });
        
        Schema::table('banners', function (Blueprint $table) {
            $columnsToCheck = ['title', 'subtitle', 'short_description', 'button_text', 'button_link'];
            foreach ($columnsToCheck as $column) {
                if (Schema::hasColumn('banners', $column)) {
                    $table->dropColumn($column);
                }
            }
        });
    }
};
