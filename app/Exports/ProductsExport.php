<?php

namespace App\Exports;

use App\Models\Product;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class ProductsExport implements FromCollection, WithHeadings
{
    public function collection()
    {
        return Product::select(
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
            'galleries'
        )->get();
    }

    public function headings(): array
    {
        return [
            'Category ID',
            'Subcategory ID',
            'Name',
            'Slug',
            'SKU',
            'Tags',
            'Video',
            'Sort Details',
            'Specification Name',
            'Specification Description',
            'Is Specification',
            'Details',
            'Photo',
            'Back Photo',
            'Sale Price',
            'Regular Price',
            'Stock',
            'Meta Keywords',
            'Meta Description',
            'Status',
            'Type',
            'Date',
            'Link',
            'Galleries',
        ];
    }
}