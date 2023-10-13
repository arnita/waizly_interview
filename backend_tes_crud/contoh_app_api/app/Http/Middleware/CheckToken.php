<?php

namespace App\Http\Middleware;

use Closure;
use Tymon\JWTAuth\Facades\JWTAuth; //use this library

class CheckToken
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $token = 
        //JWTAuth::getToken();
        JWTAuth::parseToken()->check();
        if(!$token)
        {    
            return response()->json(['error' => 'Unauthorized','message'=>'token_expired'], 401);
        }
        
        return $next($request);
    }
}
