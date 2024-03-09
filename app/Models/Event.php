<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Event extends Model
{
    use SoftDeletes;

    protected $table="event";
    use HasFactory;

    public function scopeSearch($query, $term)
    {
        return $query->where('name', 'like', "%{$term}%")
               ->orWhere('location', 'like', "%{$term}%")
               ->orWhere('date', 'like', "%{$term}%");
    }
}
