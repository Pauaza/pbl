<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DepartmentSeeder extends Seeder
{
    public function run(): void
    {
        $departments = [
            ['name' => 'IT Development',     'latitude' => -7.945915, 'longitude' => 112.6163315, 'radius_meters' => 200],
            ['name' => 'Human Resource',     'latitude' => -7.945915, 'longitude' => 112.6163315, 'radius_meters' => 180],
            ['name' => 'Finance & Accounting','latitude' => -7.945915, 'longitude' => 112.6163315, 'radius_meters' => 150],
            ['name' => 'Marketing',          'latitude' => -7.945915, 'longitude' => 112.6163315, 'radius_meters' => 220],
            ['name' => 'Operational',        'latitude' => -7.945915, 'longitude' => 112.6163315, 'radius_meters' => 250],
            ['name' => 'General Affair',     'latitude' => -7.945915, 'longitude' => 112.6163315, 'radius_meters' => 200],
        ];

        DB::table('departments')->insert($departments);
    }
}