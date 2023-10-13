<?php

use Illuminate\Database\Seeder;

class ReligionTableSeeder extends Seeder
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
            'name' => 'Islam',
            'value' => 'islam',
            'category' =>'religion',
        ]);
        DB::table('parlookup')->insert([
            'name' => 'Protestan',
            'value' => 'protestan',
            'category' =>'religion',
        ]);
        DB::table('parlookup')->insert([
            'name' => 'Katolik',
            'value' => 'katolik',
            'category' =>'religion',
        ]);
        DB::table('parlookup')->insert([
            'name' => 'Budha',
            'value' => 'budha',
            'category' =>'religion',
        ]);
        DB::table('parlookup')->insert([
            'name' => 'Hindu',
            'value' => 'hindu',
            'category' =>'religion',
        ]);
        DB::table('parlookup')->insert([
            'name' => 'Kong Hu Chu',
            'value' => 'konghuchu',
            'category' =>'religion',
        ]);
     

        
    }
}
