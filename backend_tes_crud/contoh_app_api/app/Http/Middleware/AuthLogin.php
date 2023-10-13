<?php

namespace App\Http\Middleware;

use Closure;
use Session;
use Request;

class AuthLogin
{
    public function handle($request, Closure $next)
    {
        if(!Session::get('api_token'))
        {
            return redirect('/');
        }
        else
        {
        	return redirect('/login');
        }
        return $next($request);
    }
}