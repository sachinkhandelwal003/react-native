namespace App\Imports;

use App\Models\AppUser;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToModel;
use Illuminate\Support\Facades\Hash;

class CustomersImport implements ToModel
{
    public function model(array $row)
    {
        return new AppUser([
            'first_name'   => $row[0],
            'last_name'    => $row[1],
            'phone_number' => $row[2],
            'email'        => $row[3],
            'status'       => $row[4],
        ]);
    }
}
