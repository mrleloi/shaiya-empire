<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Gate;
use Illuminate\Http\Request;

class ChangePassword2Controller extends Controller
{
    public function edit()
    {
//        abort_if(Gate::denies('profile_password_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');
        return view('auth.password2-edit');
    }

    public function update(Request $request)
    {
        $request->validate([
            'old_password' => 'required|string|min:8',
            'new_password' => 'required|string|min:8|confirmed',
        ]);

        $user = auth()->user();
        if (!$user->checkPassword($request->old_password)) {
            if ($request->ajax() || $request->wantsJson()) {
                return response()->json([
                    'success' => false,
                    'errors' => ['old_password' => 'Mật khẩu cũ không chính xác']
                ], 400);
            }
            return back()->withErrors(['old_password' => 'Mật khẩu cũ không chính xác']);
        }
        $userGameUserDetail = $user->getGameUserDetail();
        $userGameUserDetail->setPassword($request->new_password);
        $userGameUserDetail->save();

        // Kiểm tra nếu là AJAX request
        if ($request->ajax() || $request->wantsJson()) {
            return response()->json([
                'success' => true,
                'message' => __('global.change_password_success'),
            ]);
        }

        return redirect()
            ->route('change-password2.edit')
            ->with('status', __('global.change_password_success'));
    }

    /*public function updateProfile(UpdateProfileRequest $request)
    {
        $user = auth()->user();

        $user->update($request->validated());

        return redirect()->route('profile.password.edit')->with('message', __('global.update_profile_success'));
    }

    public function destroy()
    {
        $user = auth()->user();

        $user->update([
            'email' => time() . '_' . $user->email,
        ]);

        $user->delete();

        return redirect()->route('login')->with('message', __('global.delete_account_success'));
    }*/
}
