<?php

use Illuminate\Database\Seeder;

class AddTinggiBadan extends Seeder
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
            'name' => 'Tinggi',
            'value' => 'tinggi',
            'category' =>'Fisik'
        ]);  

         DB::table('parlookup')->insert([
            'name' => 'Berat',
            'value' => 'berat',
            'category' =>'Fisik'
        ]);
    }
}
