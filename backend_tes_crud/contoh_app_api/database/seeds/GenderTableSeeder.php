<?php

use Illuminate\Database\Seeder;

class GenderTableSeeder extends Seeder
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
            'name' => 'Laki - laki',
            'value' => 'L',
            'category' =>'gender',
        ]);
    

        DB::table('parlookup')->insert([
            'name' => 'Perempuan',
            'value' => 'P',
            'category' =>'gender',
        ]);
    
    }
}
