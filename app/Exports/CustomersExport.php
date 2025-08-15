<?php

namespace App\Exports;

use App\Models\AppUser;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class CustomersExport implements FromCollection, WithHeadings
{
    public function collection()
    {
        return AppUser::select('first_name', 'last_name', 'email', 'phone_number', 'status', 'created_at')->get();
    }

    public function headings(): array
    {
        return ['First Name', 'Last Name', 'Email', 'Phone Number', 'Status', 'Created At'];
    }
}
