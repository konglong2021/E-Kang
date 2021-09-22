<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Category;

class CategoriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $categories = [
            [
                'id'             => 1,
                'name'           => 'Case',
            ],
            [
                'id'             => 2,
                'name'           => 'Screen',
            ],
            [
                'id'             => 3,
                'name'           => 'Charger',
            ],
            [
                'id'             => 4,
                'name'           => 'Headset',
            ],
        ];

        Category::insert($categories);
    }
}
