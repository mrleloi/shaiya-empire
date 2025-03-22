<?php

namespace App\Models;

use Carbon\Carbon;
use DateTimeInterface;
use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Request;

class GameUserDetail extends Model implements \Illuminate\Contracts\Auth\CanResetPassword
{
    use Notifiable, CanResetPassword;

//    protected $connection = 'mysql_userdata';
    protected $connection = 'sqlsrv_userdata';
//    public $table = 'users_detail';
    protected $table = 'dbo.Users_Detail';

    protected $fillable = [
        'UserUID',
        'UserID',
        'Email',
        'PwQuestion',
        'PwAnswer',
        'NewsLetter',
        'Sms',
        'AdultAuth',
        'EmailAuth',
    ];

    protected $primaryKey = 'UserUID';
    protected $guarded = [];
    public $timestamps = false;
    protected $appends = ['id'];

//    protected $appends = ['userDetail'];

    public function getIdAttribute()
    {
        return $this->UserUID;
    }

    public function getGameUserAttribute()
    {
        return GameUser::query()->where('UserID', $this->UserID)->first();
    }

    public function getGameUser()
    {
        return $this->getGameUserAttribute();
    }

    public function getEmailAttribute()
    {
        return $this->attributes['Email'];
    }

    public function setPassword($password)
    {
        $this->PwAnswer = $password;
        return $this;
    }
}
