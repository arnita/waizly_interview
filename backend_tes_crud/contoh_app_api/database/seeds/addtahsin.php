<?php

use Illuminate\Database\Seeder;

class addtahsin extends Seeder
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
            'name' => 'Iqra 1',
            'value' => 'iqra_1',
            'category' =>'tahsin',
        ]); 

         DB::table('parlookup')->insert([
            'name' => 'Iqra 2',
            'value' => 'iqra_2',
            'category' =>'tahsin',
        ]);

        DB::table('parlookup')->insert([
            'name' => 'Iqra 3',
            'value' => 'iqra_3',
            'category' =>'tahsin',
        ]); 

         DB::table('parlookup')->insert([
            'name' => 'Iqra 4',
            'value' => 'iqra_4',
            'category' =>'tahsin',
        ]);
        DB::table('parlookup')->insert([
            'name' => 'Iqra 5',
            'value' => 'iqra_5',
            'category' =>'tahsin',
        ]); 

         DB::table('parlookup')->insert([
            'name' => 'Iqra 6',
            'value' => 'iqra_6',
            'category' =>'tahsin',
        ]);

        DB::table('parlookup')->insert([
            'name' => 'Alquran',
            'value' => 'alquran',
            'category' =>'tahsin',
        ]); 


    }
}
