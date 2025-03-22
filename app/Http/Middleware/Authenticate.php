<?php

namespace App\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class Authenticate extends Middleware
{
    /**
     * Get the path the user should be redirected to when they are not authenticated.
     */
    protected function redirectTo(Request $request): ?string
    {
        if ($request->expectsJson()) {
            return null;
        }


//        Auth::guard('web')->logout();
//        $request->session()->invalidate();
//        $request->session()->regenerateToken();
//        dd(Auth::guard('web')->check());

        // Kiểm tra prefix của route
        if ($request->route()->getPrefix() === '/admin') {
            return route('admin.login');
        }

        return route('login');
    }
}
