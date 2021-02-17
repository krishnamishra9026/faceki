<?php

namespace CreatyDev\Domain\Admin\Api;

use Illuminate\Database\Eloquent\Model;

class Api extends Model
{
    protected $fillable = [
        'name',
        'description',
        'status'
    ];
}
