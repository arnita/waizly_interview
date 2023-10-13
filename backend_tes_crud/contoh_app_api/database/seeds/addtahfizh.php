<?php

use Illuminate\Database\Seeder;

class addtahfizh extends Seeder
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
            'name' => 'Surah At - Takwir',
            'value' => 'attakwir',
            'category' =>'tahfizh',
        ]); 

         DB::table('parlookup')->insert([
            'name' => 'Surah Abasa',
            'value' => 'abasa',
            'category' =>'tahfizh',
        ]);

        DB::table('parlookup')->insert([
            'name' => 'Surah Anaziat',
            'value' => 'annaziat',
            'category' =>'tahfizh',
        ]); 

         DB::table('parlookup')->insert([
            'name' => 'Surah Annaba',
            'value' => 'annaba',
            'category' =>'tahfizh',
        ]);
         
    }
}
