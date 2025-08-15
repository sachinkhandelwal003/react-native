<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Clean up invalid data before adding foreign key constraints
        
        // Remove galleries with invalid product_id references
        DB::table('galleries')->whereNotIn('product_id', DB::table('products')->pluck('id'))->delete();
        
        // Remove blogs with invalid category_id references
        DB::table('blogs')->whereNotIn('category_id', DB::table('blog_categories')->pluck('id'))->delete();
        
        // Add foreign key constraints that match the SQL structure
        
        // Note: Some foreign keys may already exist, so we'll check and add only if needed
        
        // Check if blogs table has category_id foreign key
        if (!$this->foreignKeyExists('blogs', 'blogs_category_id_foreign')) {
            Schema::table('blogs', function (Blueprint $table) {
                $table->foreign('category_id', 'blogs_category_id_foreign')
                      ->references('id')->on('blog_categories');
            });
        }
        
        // Check if products table has category relationships - these should be nullable foreign keys
        if (!$this->foreignKeyExists('products', 'products_category_id_foreign')) {
            Schema::table('products', function (Blueprint $table) {
                $table->foreign('category_id', 'products_category_id_foreign')
                      ->references('id')->on('categories')
                      ->onDelete('set null');
            });
        }
        
        if (!$this->foreignKeyExists('products', 'products_subcategory_id_foreign')) {
            Schema::table('products', function (Blueprint $table) {
                $table->foreign('subcategory_id', 'products_subcategory_id_foreign')
                      ->references('id')->on('subcategories')
                      ->onDelete('set null');
            });
        }
        
        // Check if galleries table has product_id foreign key
        if (!$this->foreignKeyExists('galleries', 'galleries_product_id_foreign')) {
            Schema::table('galleries', function (Blueprint $table) {
                $table->foreign('product_id', 'galleries_product_id_foreign')
                      ->references('id')->on('products')
                      ->onDelete('cascade');
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('blogs', function (Blueprint $table) {
            $table->dropForeign('blogs_category_id_foreign');
        });
        
        Schema::table('products', function (Blueprint $table) {
            $table->dropForeign('products_category_id_foreign');
            $table->dropForeign('products_subcategory_id_foreign');
        });
        
        Schema::table('galleries', function (Blueprint $table) {
            $table->dropForeign('galleries_product_id_foreign');
        });
    }
    
    /**
     * Check if a foreign key exists
     */
    private function foreignKeyExists($table, $foreignKey): bool
    {
        $connection = Schema::getConnection();
        $databaseName = $connection->getDatabaseName();
        
        $result = $connection->select(
            "SELECT COUNT(*) as count FROM information_schema.KEY_COLUMN_USAGE 
             WHERE TABLE_SCHEMA = ? AND TABLE_NAME = ? AND CONSTRAINT_NAME = ?",
            [$databaseName, $table, $foreignKey]
        );
        
        return $result[0]->count > 0;
    }
};
