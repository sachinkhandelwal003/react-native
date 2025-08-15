<?php

namespace App\Imports;

use App\Models\AppUser;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithValidation;
class CustomersImport implements ToModel, WithHeadingRow
{
    public function model(array $row)
    {
        return new AppUser([
            'first_name' => $row['first_name'],
            'last_name' => $row['last_name'],
            'email' => $row['email'],
            'phone_number' => $row['phone_number'],

            'status' => $row['status'] ?? 1,
        ]);
    }

    public function rules(): array
    {
        return [
            '*.email' => 'required|email',
            '*.first_name' => 'required',
        ];
    }
}
