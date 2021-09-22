<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Brand;

class BrandsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        
        $brand = [
            [
                'id'             => 1,
                'name'           => 'Apple',
            ],
            [
                'id'             => 2,
                'name'           => 'Google',
            ],
            [
                'id'             => 3,
                'name'           => 'HTC',
            ],
            [
                'id'             => 4,
                'name'           => 'Huawei',
            ],
            [
                'id'             => 5,
                'name'           => 'LG',
            ],
            [
                'id'             => 6,
                'name'           => 'Microsoft',
            ],
            [
                'id'             => 7,
                'name'           => 'Nokia',
            ],
            [
                'id'             => 8,
                'name'           => 'OnePlus',
            ],
            [
                'id'             => 9,
                'name'           => 'Oppo',
            ],
            [
                'id'             => 10,
                'name'           => 'RealMe',
            ],
            [
                'id'             => 11,
                'name'           => 'Samsung',
            ],
            [
                'id'             => 12,
                'name'           => 'Vivo',
            ],
            [
                'id'             => 13,
                'name'           => 'XiaoMe',
            ],
        ];

        Brand::insert($brand);
    }
}
