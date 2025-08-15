<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\CustomScopes;
use Illuminate\Support\Str;


class Product extends Model
{
    use HasFactory, SoftDeletes, CustomScopes;

    protected $fillable = [
        'category_id',
        'subcategory_id',
        'name',
        'slug',
        'sku',
        'tags',
        'video',
        'sort_details',
        'specification_name',
        'specification_description',
        'is_specification',
        'details',
        'photo',
        'back_photo',
        'sale_price',
        'reguler_price',
        'stock',
        'meta_keywords',
        'meta_description',
        'status',
        'is_type',
        'date',
        'link',
        'galleries',
    ];

        public function gallery()
    {
        return $this->hasMany(Gallery::class);
    }


    public function variants()
    {
        return $this->hasMany(ProductVariant::class);
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

	public function wishlistedBy()
	{
		return $this->hasMany(Wishlist::class);
	}

    /**
     * Generate a unique slug based on the product name
     */
    public static function generateUniqueSlug($name, $excludeId = null)
    {
        $slug = Str::slug($name);
        $originalSlug = $slug;
        $counter = 1;

        // Check if slug exists, if yes, append number
        while (self::slugExists($slug, $excludeId)) {
            $slug = $originalSlug . '-' . $counter;
            $counter++;
        }

        return $slug;
    }

    /**
     * Check if slug exists in database
     */
    private static function slugExists($slug, $excludeId = null)
    {
        $query = self::where('slug', $slug);
        
        if ($excludeId) {
            $query->where('id', '!=', $excludeId);
        }
        
        return $query->exists();
    }

}
