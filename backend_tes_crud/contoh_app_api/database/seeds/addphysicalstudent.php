<?php

use Illuminate\Database\Seeder;

class addphysicalstudent extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //

        DB::table('parlookup')->insert([
            'name' => 'Pendengaran',
            'value' => 'pendengaran',
            'category' =>'Kesehatan',
        ]);
        DB::table('parlookup')->insert([
            'name' => 'Penglihatan',
            'value' => 'penglihatan',
            'category' =>'Kesehatan',
        ]);
        DB::table('parlookup')->insert([
            'name' => 'Gigi',
            'value' => 'gigi',
            'category' =>'Kesehatan',
        ]);
        DB::table('parlookup')->insert([
            'name' => 'Rambut',
            'value' => 'rambut',
            'category' =>'Kesehatan',
        ]);
        DB::table('parlookup')->insert([
            'name' => 'Kepala',
            'value' => 'kepala',
            'category' =>'Kesehatan',
        ]);

    }
}
