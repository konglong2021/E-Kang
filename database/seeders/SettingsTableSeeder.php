<?php

namespace Database\Seeders;
use App\Models\Settings;
use Illuminate\Database\Seeder;

class SettingsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        {
            $setting = [
                [
                    'id'              => 1,
                    'digit'           => 2,
                    'negative'        => 1,
                    'user_id'         => 1
                ],
                
            ];
    
            Settings::insert($setting);
        }
    }
}
