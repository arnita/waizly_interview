<?php

use Illuminate\Database\Seeder;

class addextracurricular extends Seeder
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
            'name' => 'Renang',
            'value' => 'renang',
            'category' =>'ekstrakurikuler',
        ]); 

         DB::table('parlookup')->insert([
            'name' => 'Pramuka',
            'value' => 'pramuka',
            'category' =>'ekstrakurikuler',
        ]);
    }
}
