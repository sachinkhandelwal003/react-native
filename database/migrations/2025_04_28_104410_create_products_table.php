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
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('category_id')->nullable();
            $table->unsignedBigInteger('subcategory_id')->nullable();
            $table->string('name');
            $table->string('slug')->unique();
            $table->string('sku')->nullable();
            $table->string('tags')->nullable();
            $table->string('video')->nullable();
            $table->text('sort_details')->nullable();
            $table->string('specification_name')->nullable();
            $table->text('specification_description')->nullable();
            $table->boolean('is_specification')->default(false);
            $table->longText('details')->nullable();
            $table->string('photo')->nullable();
            $table->string('back_photo')->nullable();
            $table->decimal('sale_price', 10, 2)->nullable();
            $table->decimal('reguler_price', 10, 2)->nullable();
            $table->integer('stock')->nullable();
            $table->text('meta_keywords')->nullable();
            $table->text('meta_description')->nullable();
            $table->boolean('status')->default(1);
            $table->string('is_type')->nullable();
            $table->date('date')->nullable();
            $table->string('link')->nullable();
            $table->softDeletes(); // for deleted_at
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
