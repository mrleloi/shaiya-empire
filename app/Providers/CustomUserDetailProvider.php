<?php

namespace App\Providers;

use App\User;
use Illuminate\Contracts\Support\Arrayable;
use Illuminate\Support\Str;

class CustomUserDetailProvider extends CustomUserProvider
{
    private $method_to_email_model;

    public function __construct(\Illuminate\Contracts\Hashing\Hasher $hasher, $model, $method_to_email_model)
    {

        parent::__construct($hasher, $model);

        $this->method_to_email_model = $method_to_email_model;
    }

    public function retrieveByCredentials(array $credentials)
    {
        if (array_key_exists('isResetPw', $credentials)) {
            unset($credentials['password']);
            $email = $credentials['email'];
            $userDetail = $this->createModel()
                ->newQuery()
                ->where('Email', '=', $email)
                ->first();
            return $userDetail;
        }
        if (empty($credentials) ||
            (count($credentials) === 1 &&
                array_key_exists($this->password(), $credentials))) {
            return false;
        }

        // First we will add each credential element to the query as a where clause.
        // Then we can execute the query and, if we found a user, return it in a
        // Eloquent User "model" that will be utilized by the Guard instances.
        $query = $this->createModel()->newQuery();

        foreach ($credentials as $key => $value) {
            if (Str::contains($key, $this->password())) {
                continue;
            }

            if (is_array($value) || $value instanceof Arrayable) {
                $query->whereIn($key, $value);
            } else {
                $query->where($key, $value);
            }
        }

        return $query->first();
    }

    public function validateCredentials(\Illuminate\Contracts\Auth\Authenticatable $user, array $credentials)
    {
        $plain = $credentials[$this->password()];

        return $plain === $user->getAuthPassword();
    }
}
