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
use App\Models\M_kd_detail;
use App\Exceptions\BaseException;

class KDDetailController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        $id = stepStudyActive();
         $result = 
         
         \DB::table('m_kd as a')
        ->join('m_unit_year as b','b.unit_year_id','a.unit_year_id')
        ->join('course_setting as c','c.course_setting_id','a.course_setting_id')
        ->join('m_course as g','g.course_id','c.course_id')
        ->join('m_class_grade as f','f.class_grade_id','c.class_grade_id')
        ->join('m_kd_detail as h','h.kd_id','=','a.kd_id')
        ->where('h.step_study_id',$id);

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
                $result->where('kd_code','ilike','%'.$request->q.'%')->orWhere('kd_type','%'.$request->q.'%')
                ->where('kd_name','ilike','%'.$request->q.'%')
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
        $data_kd = $request->kd_id;

        if(!stepStudyActive())
        {
            return response()->json([
                'errors'=>['code'=>1,'message'=>'Belum ada tahapan belajar yang aktif']],
            422);
        }
     
        if(!empty($data_kd))
        {
            \DB::beginTransaction();
            try {
                foreach ($data_kd as $key => $value) 
                {

                    $data['kd_detail_insert_time'] = date('Y-m-d H:i:s');
                    $data['kd_detail_insert_by'] = \Auth::user()->id;
                    $data['step_study_id'] = stepStudyActive();
                    $data['kd_id'] = $value;
                    $save = M_kd_detail::create($data);    
                }  

                \DB::commit();
                return BaseException::jsonSuccessResponse();
            } catch (\Exception $e) {
                \DB::rollback();
                return BaseException::jsonErrorResponse('1', $e->getMessage());
            }
            
            return BaseException::jsonSuccessResponse();
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
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
        return M_kd_detail::find($id);
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
            'kd_code'=>'required',
            'kd_type'=>'required',
            'course_id'=>'required',
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
        
        
        $update = M_kd_detail::find($id);
        $update->update($request->all());


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
            $data = M_kd_detail::find($id);
            $data->delete();
            return BaseException::jsonSuccessResponse();
        }
        else
        {
            return BaseException::jsonErrorResponse('1','error');
        }
    }
}
