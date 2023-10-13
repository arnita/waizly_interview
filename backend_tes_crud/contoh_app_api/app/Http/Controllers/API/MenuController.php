<?php
/*
    CREATED BY ARIEF MANGGALA PUTRA 
    1 SEPT 2019 
    @ariefmanggalaputra25@gmail.com
    mangggalcorp.com
*/

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Exceptions\BaseException;
use Spatie\Permission\Models\Permission;


class MenuController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        $result = 
        \DB::table('menu as a')
        ->select('a.menu_name','a.menu_id','a.menu_url','b.menu_name as menu_parent','a.no_urut')
        ->leftJoin('menu as b',\DB::raw('b.menu_id::integer'),\DB::raw('a.menu_parent::integer') )
        ->orderBy('a.created_at', 'DESC');
        // \App\Models\Menu::orderBy('menu_id','desc');

        if(!empty($request->q))
        {
            $result->where('a.menu_name','ilike','%'.$request->q.'%');
            $result->orWhere(\DB::raw('a.no_urut::text') ,$request->q);
        }

        return $result->paginate(10);
        
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $this->validate($request,[
            'menu_name'=>'required',
            'menu_url'=>'required',
            'menu_parent'=>'required',
        ]);

        if(empty($request->menu_id))
        {
            $this->validate($request,[
                'no_urut'=>'required|unique:menu|numeric',
            ]);
        }

        \DB::beginTransaction();
        try {

            if(!empty($request->menu_id))
            {

                $update = \App\Models\Menu::find($request->menu_id);
                $update->menu_name =  $request->menu_name;
                $update->menu_parent =  $request->menu_parent;
                $update->menu_url =  $request->menu_url;
                $update->menu_desc =  $request->menu_desc;
                $update->no_urut =  $request->no_urut;
                $update->save();

                $per = Permission::where('menu_id',$request->menu_id)->get();
                foreach ($per as $key => $value) 
                {   
                    $name_m = explode('-', $value->name);
                    $rep = str_replace($name_m[1], trim($request->menu_name), $value->name);
                    Permission::where('id', $value->id)
                      ->update(['name'=>$rep]);
                }    
            }
            else
            {

              
                $data = $request->all();
                $save = \App\Models\Menu::create($request->except('menu_id'));  
                $var_per = [
                    'create-'.trim($request->menu_name) => 'Create ',
                    'read-'.trim($request->menu_name) =>'Read',
                    'update-'.trim($request->menu_name) =>'Update',
                    'delete-'.trim($request->menu_name) =>'Delete'
                   ];
                
                foreach ($var_per as $key => $value) 
                {   
                    $perm['name']  = $key;
                    $perm['menu_id']=$save->menu_id;
                    Permission::create($perm);            
                }              

            }

            \DB::commit();
            return BaseException::jsonSuccessResponse();
        } catch (\Exception $e) {
            \DB::rollback();
            return BaseException::jsonErrorResponse('1', $e->getMessage());
        }



        return response()->json(['status' => 'success']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        return \App\Models\Menu::find($id);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if(!empty($id))
        {
            $data = \App\Models\Menu::find($id);
            $data->delete();
            return BaseException::jsonSuccessResponse();
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }
}
