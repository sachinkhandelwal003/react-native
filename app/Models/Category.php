<?php

namespace App\Models;

use App\Traits\CustomScopes;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class Category extends Model
{
    use HasFactory, SoftDeletes, CustomScopes;

    protected $fillable = [
        'name',
        'slug',
        'status',
        'image',
        'meta_keywords',
        'meta_descriptions',
        'status',
        'is_feature',
        'serial',
        'parent_id'
    ];

    public function parent()
{
    return $this->belongsTo(Category::class, 'parent_id');
}

public function children()
{
    // return $this->hasMany(Category::class, 'parent_id');
    return $this->hasMany(Category::class, 'parent_id');
}
    // public function products()
    // {
    //     return $this->hasMany(Product::class);
    // }
    // // Category Model
    // public function subcategories()
    // {
    //     return $this->hasMany(Subcategory::class);
    // }
}
