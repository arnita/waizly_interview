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
use App\Models\M_kd;
use App\Exceptions\BaseException;
use App\Imports\KD;


class KDController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        $unit_year_id = yearActive();
        $result = \DB::table('m_kd as a')
        ->join('m_unit_year as b','b.unit_year_id','a.unit_year_id')
        ->join('course_setting as c','c.course_setting_id','a.course_setting_id')
        ->join('m_course as g','g.course_id','c.course_id')
        ->join('m_class_grade as f','f.class_grade_id','c.class_grade_id')
        ->where('a.unit_year_id',$unit_year_id)
        ->orderBy('kd_id','desc')
        ;

            if(!empty($request->q))
            { 
                if( ( !empty($request->course_id) )  && ( !empty($request->class_grade_id) ) )
                {
                    $result->where('c.course_id',$request->course_id)->where('f.class_grade_id',$request->class_grade_id)
                    ->where('kd_code','ilike','%'.$request->q.'%');
                }
                else if(!empty($request->class_grade_id))
                {
                    $result->where('f.class_grade_id',$request->class_grade_id)
                    ->where('kd_code','ilike','%'.$request->q.'%');
                }
                else if(!empty($request->course_id))
                {
                    $result->where('c.course_id',$request->course_id)
                    ->where('kd_code','ilike','%'.$request->q.'%');
                }
                else
                {
                    $result->where('kd_code','ilike','%'.$request->q.'%')->orWhere('kd_type','ilike','%'.$request->q.'%')
                    ->orWhere('kd_name','ilike','%'.$request->q.'%')
                    ;
                }
                
            }
            else if( ( !empty($request->course_id) )  &&  ( !empty($request->class_grade_id) ) )
            {
                
                $result->where('c.course_id',$request->course_id)->where('f.class_grade_id',$request->class_grade_id);

            }
            else if(!empty($request->class_grade_id))
            {
                
                $result->where('f.class_grade_id',$request->class_grade_id);
            }
            else if(!empty($request->course_id))
            {
                
                $result->where('c.course_id',$request->course_id);   
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
            'kd_name'=>'required',
            'kd_type'=>'required',
            'kd_code' => 'required',
            'course_id'=>'required',
            'class_grade_id'=>'required',
            // 'kd_id'=>'required',
        ]);

        
        $data_ex  = \DB::table('m_kd as a')
        ->join('course_setting as b','b.course_setting_id','a.course_setting_id')
        ->where('b.course_setting_id',$request->course_id)
        ->where('b.class_grade_id',$request->class_grade_id)
        ->where('a.kd_code',$request->kd_code)
        ->orWhere('a.kd_name',$request->kd_name)
        ->where('a.unit_year_id',$unit_year_id)
        ->first();
        
        if(!empty($data_ex))
        {
            return response()->json([
                'errors'=>['code'=>1,'message'=>'KD tersebut sudah pernah diinput']],
            422);   
        }

        if(!yearActive())
        {
            return response()->json([
                'errors'=>['code'=>1,'message'=>'Belum ada tahun ajaran yang aktif']],
            422);
        }

        $data = $request->all();
        $data['kd_insert_time'] = date('Y-m-d H:i:s');
        $data['kd_insert_by'] = \Auth::user()->id;
        $data['unit_year_id'] = yearActive();
        $data['course_id'] = null;
        $data['course_setting_id'] = $request->course_id;
        unset($data['class_grade_id']);

        M_kd::create($data);    
        

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
        $unit_year_id = yearActive();
        $result = \DB::table('m_kd as a')
        ->join('m_unit_year as b','b.unit_year_id','a.unit_year_id')
        ->join('course_setting as c','c.course_setting_id','a.course_setting_id')
        ->join('m_course as g','g.course_id','c.course_id')
        // ->join('m_study_group as e','e.study_group_id','c.study_group_id')
        ->join('m_class_grade as f','f.class_grade_id','c.class_grade_id')
        ->where('a.unit_year_id',$unit_year_id)
        ->where('kd_id',$id)
        ->orderBy('kd_id','desc')
        ->first()
        ;
        
        
        return BaseException::jsonSuccessResponse($result);
        //  $result = \DB::table('m_kd as a')
        // ->join('m_unit_year as b','b.unit_year_id','a.unit_year_id')
        // ->join('m_course as g','g.course_id','a.course_id')
        // ->join('course_setting as c','c.course_id','g.course_id')
        // ->join('m_study_group as e','e.study_group_id','c.study_group_id')
        // ->join('m_class_grade as f','f.class_grade_id','e.class_grade_id')
        // ->where('kd_id',$id)->first();
        // return BaseException::jsonSuccessResponse($result);
    }

    public function get_course_edit_kd(Request $request)
    {
        $cek = \DB::table('m_course as a')
        ->join('course_setting as b','a.course_id','=','b.course_id')
        ->where('b.class_grade_id',$request->class_grade_id)
        ->get();
        return BaseException::jsonSuccessResponse($cek);

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
            'kd_name'=>'required',
            'kd_code' => 'required',
            'kd_type'=>'required',
            'course_id'=>'required',
            'class_grade_id'=>'required',
            // 'kd_name'=>'required|between:0,99.99',
        ]);


        $data = $request->all();

        if(!yearActive())
        {
            return response()->json([
                'errors'=>['code'=>1,'message'=>'Belum ada tahun ajaran yang aktif']],
            422);
        }
        $data['unit_year_id'] = yearActive();
        $data['kd_update_time'] = date('Y-m-d H:i:s');
        $data['kd_update_by'] = \Auth::user()->id;
        $data['course_id'] = null;
        $data['course_setting_id'] = $request->course_id;
        unset($data['class_grade_id']);
        
        
        $update = M_kd::find($id);
        $update->update($data);


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
            $data = M_kd::find($id);
            $data->delete();
            return BaseException::jsonSuccessResponse();
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }


    public function kd_upload(Request $request)
    {
       $validate = $request->validate([
            'file_excel'=>"required|mimes:xls,xlsx|max:500",
        ]);

        $dt = \Excel::toArray(new KD, $request->file('file_excel')); 
        $count_row = count($dt[0]);
        $count_column = count($dt[0][0]);


         \DB::beginTransaction();
        try {    
              
            for($i=1;$i < $count_row; $i++)
            {
                $data["kd_name"]= $dt[0][$i][1];
                $data["kd_code"]= $dt[0][$i][2];
                $data["kd_type"]= $dt[0][$i][3];
                $data["unit_id"]= $request->unit_id;
                $data["unit_year_id"]= yearActive();
                $data['course_id'] = null;
                $data['course_setting_id'] = $request->course_id;
                                
                $data['kd_insert_time'] = date('Y-m-d H:i:s');
                $data['kd_insert_by'] = \Auth::user()->id;

                $dt_cek = M_kd::where('course_setting_id',$request->course_id)->where('kd_code',$dt[0][$i][2])->where('kd_name',$dt[0][$i][1])
                ->first();
                if(!empty($dt_cek))
                {
                    continue;
                }
                // dd($data);
                $save_kd =M_kd::create($data);

            }

           \DB::commit();
            return BaseException::jsonSuccessResponse(['data'=>'sucess']);
        } catch (\Exception $e) {
            \DB::rollback();
            return BaseException::jsonErrorResponse('1',$e->getMessage());    
        }
    }



}
