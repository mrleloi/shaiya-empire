<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class IsAdmin
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
//        dd(Auth::guard('web')->user());
//        dd(Auth::guard('admin')->user());
        if (Auth::guard('admin')->check()) {
            if (! Auth::guard('admin')->user()->is_admin) {
                abort(403);
            }
        } else if (Auth::guard('web')->check()) {
            if (! Auth::guard('web')->user()->admin) {
                abort(403);
            }
        }

        return $next($request);
    }
}
