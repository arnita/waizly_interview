<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
         $this->call(
                [
                    //UsersTableSeeder::class,
                    addextracurricular::class,
                    addpersonality::class,
                    addphysicalstudent::class,
                    addtahfizh::class,
                    addtahsin::class,
                    AddTinggiBadan::class,
                    GenderTableSeeder::class,
                    inserttahsin::class,
                    ReligionTableSeeder::class,
                    valueobservasi::class
                ]
            );
        // DB::table('sys_project')->insert([
        //     'project_name' => 'project telo',
        //     'description' => 'asem',
        //     'created_at' => now(),
        // ]);


        DB::table('users')->insert([
            'username' => 'arief',
            // 'email' => 'arief@telo.com',
            'email_verified_at' => now(),
            'password' => bcrypt('123123'),
            'api_token'=>$this->generateRandomString(20)
        ]);
    }


    function generateRandomString($length = 10) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }
}
