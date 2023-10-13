<?php

namespace App\Exceptions;

/**
 * 
 */
class BaseException
{
	public static function jsonErrorResponse($error="",$msg="")
	{

		if(empty($error))
		{
			$error = $this->error_code;
		}
		if(empty($msg))
		{
			$msg = $this->message;
		}

		 return response()->json([
		     'status' => [
		         'code'    => $error,
		         'message' => $msg
		     ]
		 ], 422);
	}

	public static function jsonSuccessResponse($data=[])
	{
		return response()->json([
				'status'=>['code'=>1,'message'=>'success'],
				'data'=>$data
			]
		);
	}
}

