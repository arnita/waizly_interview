<?php

use Illuminate\Database\Seeder;

class valueobservasi extends Seeder
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
            'name' => 'Berdoa',
            'value' => 'berdoa',
            'category' =>'spiritual',
        ]);
         DB::table('parlookup')->insert([
            'name' => 'Syukur',
            'value' => 'syukur',
            'category' =>'spiritual',
        ]);
         DB::table('parlookup')->insert([
            'name' => 'Ibadah',
            'value' => 'ibadah',
            'category' =>'spiritual',
        ]);
         DB::table('parlookup')->insert([
            'name' => 'Toleransi',
            'value' => 'toleransi',
            'category' =>'sosial',
        ]);
         DB::table('parlookup')->insert([
            'name' => 'Jujur',
            'value' => 'jujur',
            'category' =>'sosial',
        ]);
         DB::table('parlookup')->insert([
            'name' => 'Disiplin',
            'value' => 'disiplin',
            'category' =>'sosial',
        ]);
         DB::table('parlookup')->insert([
            'name' => 'Percaya diri',
            'value' => 'percaya diri',
            'category' =>'sosial',
        ]);
         DB::table('parlookup')->insert([
            'name' => 'Santun',
            'value' => 'santun',
            'category' =>'sosial',
        ]); 

         DB::table('parlookup')->insert([
            'name' => 'Gotong royong',
            'value' => 'gotong royong',
            'category' =>'sosial',
        ]); 

         DB::table('parlookup')->insert([
            'name' => 'Tanggung jawab',
            'value' => 'tanggung jawab',
            'category' =>'sosial',
        ]);


    }
}
