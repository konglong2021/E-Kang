<?php

namespace Database\Seeders;
use App\Models\Member;
use Illuminate\Database\Seeder;

class MemberTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $member = [
            [
                'id'                    => 1,
                'title'                 => "Normal Member",
                'discount'              => 0,
                'default'              => 1
            ],
            
        ];

        Member::insert($member);
    }
}
