<?php

namespace Database\Seeders;
use App\Models\Customer;
use Illuminate\Database\Seeder;

class CustomerTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        
        $customer = [
            [
                'id'                 => 1,
                'member_id'          => 1,
                'name'               => "Normal",
                'phone'              => "00000",
                'address'            => "Phnom Penh"
            ],
            
        ];

        Customer::insert($customer);
    
    }
}
