<?php
/*
    CREATED BY ARIEF MANGGALA PUTRA 
    1 SEPT 2019 
    @ariefmanggalaputra25@gmail.com
    mangggalcorp.com
*/

namespace App\Http\Controllers\API;

use App\Models\M_kkm;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Exceptions\BaseException;



class KKMController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        $q  = $request->q;
        $class_grade_id = $request->class_grade_id;
        $id = stepStudyActive();
        $unit_year_id = yearActive();

        $result =  M_kkm::with(['course','class_grade'])->where('unit_year_id',$unit_year_id)->orderBy('kkm_id','desc');
        // dd($result);

        if(!empty($request->q))
        {
            if(!empty($request->class_grade_id) && (!empty($request->q)))
            {
                $result = $result->whereHas('class_grade',function($query) use ($q,$class_grade_id){
                        $query->where('class_grade_id',$class_grade_id);
                })->whereHas('course',function($query) use ($q){
                        $query->where('course_name','ilike','%'.$q.'%');
                });
            }
            elseif (!empty($request->class_grade_id)) 
            {
                $result = $result->whereHas('class_grade',function($query) use ($class_grade_id){
                        $query->where('class_grade_id',$class_grade_id);
                });
            }
            else
            {
                $result=  $result->where('kkm_value','ilike','%'.$request->q.'%')
                ->orWhereHas('course',function($query) use ($q){
                        $query->where('course_name','ilike','%'.$q.'%');
                });
            }
            
        }
        else if( !empty($request->class_grade_id)) 
        {
            $result = $result->WhereHas('class_grade',function($query) use ($class_grade_id){
                        $query->where('class_grade_id',$class_grade_id);
                });
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
        $unit_year_id = yearActive();

        $this->validate($request,[
            'kkm_value'=>'required|numeric',
            'kkm_a'=>'required|numeric',
            'kkm_b'=>'required|numeric',
            'kkm_c'=>'required|numeric',
            'kkm_d'=>'required|numeric',
            'unit_id'=>'required',
            'class_grade_id'=>'required',
            'course_id'=>'required',
        ]);

        $data = $request->all();
        
        if(!stepStudyActive())
        {
            return response()->json([
                'errors'=>['code'=>1,'message'=>'Belum ada tahapan belajar yang aktif']],
            422);
        }
        $exist = M_kkm::where('course_id',$request->course_id)->where('class_grade_id',$request->class_grade_id)->first();

        if(!empty($exist))
        {
            return response()->json([
                'errors'=>['code'=>1,'message'=>'Mata pelajaran ini sudah di setting kkm']],
            422);   
        }

        $data['kkm_insert_time'] = date('Y-m-d H:i:s');
        $data['kkm_insert_by'] =\Auth::user()->id;
        $data['unit_year_id'] = $unit_year_id;
        $data['class_grade_id'] = $request->class_grade_id;
        
        unset($data['unit_id']);
                        // $save = \App\Models\Menu::create($request->except('menu_id'));  

        $save = M_kkm::create($data);    
        

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
        return M_kkm::find($id);
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
        $this->validate($request,[
            'kkm_value'=>'required|numeric',
            'kkm_a'=>'required|numeric',
            'kkm_b'=>'required|numeric',
            'kkm_c'=>'required|numeric',
            'kkm_d'=>'required|numeric',
            'course_id'=>'required',
            'unit_id'=>'required',
            'class_grade_id'=>'required',
            // 'kkm_value'=>'required|between:0,99.99',
        ]);


        $data = $request->all();

          
        if(!stepStudyActive())
        {
            return response()->json([
                'errors'=>['code'=>1,'message'=>'Belum ada tahapan belajar yang aktif']],
            422);
        }

         $exist = M_kkm::where('course_id',$request->course_id)->first();

        if(!empty($exist))
        {

            \DB::beginTransaction();
            try {    
                M_kkm::where('course_id',$request->course_id)->delete(); 

                $data['kkm_insert_time'] = date('Y-m-d H:i:s');
                $data['kkm_insert_by'] =\Auth::user()->id;
                $data['unit_year_id'] = $unit_year_id();
                $data['class_grade_id'] = $request->class_grade_id;
                
                unset($data['unit_id']);
                $save = M_kkm::create($data);    


                \DB::commit();
                return BaseException::jsonSuccessResponse();
            } catch (\Exception $e) {
                \DB::rollback();
                return BaseException::jsonErrorResponse('1',$e->getMessage());    
            }
        }

        $data['unit_year_id'] = $unit_year_id();
        $data['kkm_update_time'] = date('Y-m-d H:i:s');
        $data['kkm_update_by'] = \Auth::user()->id;
        $data['class_grade_id'] = $request->class_grade_id;
        unset($data['unit_id']);
        
        
        $update = M_kkm::find($id);
        $update->update($request->except('kkm_a'));


        if($update)
        {
            return BaseException::jsonSuccessResponse();
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        if(!empty($id))
        {
            $data = M_kkm::find($id);
            $data->delete();
            return BaseException::jsonSuccessResponse();
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }
    public function copy_kkm()
    {
        
        $unit_year_id = yearActive();
        // $year_now = explode('/',$dt->unit_year_name);
        $year_get = $unit_year_id - 1;
        $dt = \App\Models\M_unit_year::where('unit_year_id',$year_get)->first();
        $kkm = M_kkm::where('unit_year_id',$dt->unit_year_id)->get();

        
        \DB::beginTransaction();
        try {    

            foreach($kkm as $val)
            {
                $data['kkm_insert_time'] = date('Y-m-d H:i:s');
                $data['kkm_insert_by'] =\Auth::user()->id;
                $data['unit_year_id'] = $unit_year_id();
                $data['kkm_value'] = $val->kkm_value;
                $data['kkm_a'] = $val->kkm_a;
                $data['kkm_b'] = $val->kkm_b;
                $data['kkm_c'] = $val->kkm_c;
                $data['kkm_d'] = $val->kkm_d;
                $data['unit_id'] = $request->unit_id;
                $data['class_grade_id'] = $request->class_grade_id;
                $data['course_id'] = $val->course_id;
                $save = M_kkm::create($data);    

            }
            
            \DB::commit();
            return BaseException::jsonSuccessResponse();
        } catch (\Exception $e) {
            \DB::rollback();
            return BaseException::jsonErrorResponse('1',$e->getMessage());    
        }
        dd($dt);

        
    }
}
