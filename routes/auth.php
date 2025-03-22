<?php

use App\Http\Controllers\Auth\AuthenticatedSessionController;
use App\Http\Controllers\Auth\ConfirmablePasswordController;
use App\Http\Controllers\Auth\EmailVerificationNotificationController;
use App\Http\Controllers\Auth\EmailVerificationPromptController;
use App\Http\Controllers\Auth\NewPasswordController;
use App\Http\Controllers\Auth\PasswordController;
use App\Http\Controllers\Auth\PasswordResetLinkController;
use App\Http\Controllers\Auth\RegisteredUserController;
use App\Http\Controllers\Auth\VerifyEmailController;
use Illuminate\Support\Facades\Route;

Route::middleware('guest')->group(function () {
    Route::any('/pages/register.php', [RegisteredUserController::class, 'create'])
                ->name('register');

    Route::post('/pages/do_register.php', [RegisteredUserController::class, 'store']);

    Route::get('/pages/login.php', [AuthenticatedSessionController::class, 'create'])
                ->name('login');

    Route::post('/pages/login.php', [AuthenticatedSessionController::class, 'store']);

    Route::get('/pages/forgot-password.php', [PasswordResetLinkController::class, 'create'])
                ->name('password.request');

    Route::post('/pages/forgot-password.php', [PasswordResetLinkController::class, 'store'])
                ->name('password.email');

    Route::get('/pages/reset-password/{token}.php', [NewPasswordController::class, 'create'])
                ->name('password.reset');

    Route::post('/pages/reset-password.php', [NewPasswordController::class, 'store'])
                ->name('password.store');
});

Route::middleware('auth')->group(function () {
    Route::get('/pages/verify-email.php', EmailVerificationPromptController::class)
                ->name('verification.notice');

    Route::get('/pages/verify-email/{id}/{hash}.php', VerifyEmailController::class)
                ->middleware(['signed', 'throttle:6,1'])
                ->name('verification.verify');

    Route::post('/pages/email/verification-notification.php', [EmailVerificationNotificationController::class, 'store'])
                ->middleware('throttle:6,1')
                ->name('verification.send');

    Route::get('/pages/confirm-password.php', [ConfirmablePasswordController::class, 'show'])
                ->name('password.confirm');

    Route::post('/pages/confirm-password.php', [ConfirmablePasswordController::class, 'store']);

    Route::put('/pages/password.php', [PasswordController::class, 'update'])->name('password.update');

    Route::post('/pages/logout.php', [AuthenticatedSessionController::class, 'destroy'])
                ->name('logout');
    // Profile
//    Route::get('/profile', [\App\Http\Controllers\ProfileController::class, 'edit'])->name('profile.edit');
//    Route::patch('/profile', [\App\Http\Controllers\ProfileController::class, 'update'])->name('profile.update');
//    Route::delete('/profile', [\App\Http\Controllers\ProfileController::class, 'destroy'])->name('profile.destroy');
//    Route::post('profile', 'ChangePasswordController@updateProfile')->name('password.updateProfile');
//    Route::post('profile/destroy', 'ChangePasswordController@destroy')->name('password.destroyProfile');

    // Supports
//    Route::delete('supports/destroy', 'SupportsController@massDestroy')->name('supports.massDestroy');
//    Route::post('supports/media', 'SupportsController@storeMedia')->name('supports.storeMedia');
//    Route::post('supports/ckmedia', 'SupportsController@storeCKEditorImages')->name('supports.storeCKEditorImages');
//    Route::resource('supports', 'SupportsController');

    // Change password
    Route::post('/pages/password1.php', [\App\Http\Controllers\Auth\ChangePasswordController::class, 'edit'])->name('change-password.edit');
    Route::post('/pages/do-change-password1.php', [\App\Http\Controllers\Auth\ChangePasswordController::class, 'update'])->name('change-password.update');

    Route::post('/pages/password2.php', [\App\Http\Controllers\Auth\ChangePassword2Controller::class, 'edit'])->name('change-password2.edit');
    Route::post('/pages/do-change-password2.php', [\App\Http\Controllers\Auth\ChangePassword2Controller::class, 'update'])->name('change-password2.update');
});
