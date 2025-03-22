<?php

namespace App\Models;

use Carbon\Carbon;
use DateTimeInterface;
use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Request;

class GameUser extends Authenticatable
{
    use Notifiable, CanResetPassword;

//    protected $connection = 'mysql_userdata';
    protected $connection = 'sqlsrv_userdata';
//    public $table = 'users_master';
    protected $table = 'dbo.Users_Master';

    protected $hidden = [
        'Pw',
    ];

    protected $dates = [
        'JoinDate',
    ];

    protected $fillable = [
        'UserUID',
        'UserID',
        'Pw',
        'JoinDate',
        'Admin',
        'AdminLevel',
        'UseQueue',
        'Status',
        'Leave',
        'UserType',
        'UserIp',
        'Point',
    ];

    protected $primaryKey = 'UserUID';
    protected $guarded = [];
    public $timestamps = false;
    protected $appends = ['id', 'Email'];

//    protected $appends = ['userDetail'];

    public function getIdAttribute()
    {
        return $this->UserUID;
    }

    public function getGameUserDetailAttribute()
    {
        return GameUserDetail::query()->where('UserID', $this->UserID)->first();
    }

    public function getGameUserDetail()
    {
        return $this->getGameUserDetailAttribute();
    }

    public function checkPassword1($password)
    {
        return $this->Pw === $password;
    }

    public function checkPassword($password)
    {
        $gameUserDetail = $this->getGameUserDetail();
        return $gameUserDetail->PwAnswer === $password;
    }

    public function getUsernameAttribute($value)
    {
        return $this->UserID;
    }

    public function getEmailAttribute($value)
    {
        return $this->gameUserDetail->Email;
    }

    public function updateUserIp()
    {
        $this->UserIp = Request::ip();
        $this->save();
    }

    public function setRememberToken($token) {
        return false;
    }

    public function getEmailForPasswordReset()
    {
        return $this->Email;
    }

    public function setPassword($password)
    {
        $this->Pw = $password;
        return $this;
    }

    public function routeNotificationForMail($notification)
    {
        return $this->Email;
    }

    public function sendPasswordResetNotification($token)
    {
        $this->notify(new \App\Notifications\ResetPasswordNotification($token));
    }

    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }

    public function getJoindateAttribute($value)
    {
        return $value ? Carbon::createFromFormat('Y-m-d H:i:s', $value)->format(config('panel.date_format') . ' ' . config('panel.time_format')) : null;
    }

    public function setJoindateAttribute($value)
    {
        $this->attributes['JoinDate'] = $value ? Carbon::createFromFormat(config('panel.date_format') . ' ' . config('panel.time_format'), $value)->format('Y-m-d H:i:s') : null;
    }
}
