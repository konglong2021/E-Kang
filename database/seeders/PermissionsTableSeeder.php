<?php

namespace Database\Seeders;

use App\Models\Permission;
use Illuminate\Database\Seeder;

class PermissionsTableSeeder extends Seeder
{
    public function run()
    {
        $permissions = [
            [
                'id'    => 1,
                'title' => 'product_access',
            ],
            [
                'id'    => 2,
                'title' => 'user_access',
            ],
            [
                'id'    => 3,
                'title' => 'category_access',
            ],
            [
                'id'    => 4,
                'title' => 'brand_access',
            ],
            [
                'id'    => 5,
                'title' => 'supplier_access',
            ],
            [
                'id'    => 6,
                'title' => 'warehouse_access',
            ],
            [
                'id'    => 7,
                'title' => 'permission_access',
            ],
            [
                'id'    => 8,
                'title' => 'role_access',
            ],
        ];

        Permission::insert($permissions);
    }
}
