<?php

use Illuminate\Database\Seeder;

class addpersonality extends Seeder
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
            'name' => 'Kelakuan',
            'value' => 'kelakuan',
            'category' =>'personality',
        ]); 

         DB::table('parlookup')->insert([
            'name' => 'Kerajinan',
            'value' => 'kerajinan',
            'category' =>'personality',
        ]);

         DB::table('parlookup')->insert([
            'name' => 'Kerapihan',
            'value' => 'kerapihan',
            'category' =>'personality',
        ]);
    }
}
