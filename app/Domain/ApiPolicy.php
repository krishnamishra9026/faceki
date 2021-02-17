<?php

namespace CreatyDev\Domain;

use CreatyDev\Domain\Admin\Api\Api;
use CreatyDev\Domain\Users\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class ApiPolicy
{
    use HandlesAuthorization;


    public function before(User $user, $ability)
    {
        if ($user->hasRole('admin-root') ||
            $user->can('manage apis') ||
            $user->can('manage roles')) {
            return true;
        }
    }


    /**
     * Determine whether the user can view any DocDummyPluralModel.
     *
     * @param  \CreatyDev\Domain\Users\Models\User  $user
     * @return mixed
     */
    public function viewAny(User $user)
    {
        //
    }

    /**
     * Determine whether the user can view the DocApi.
     *
     * @param  \CreatyDev\Domain\Users\Models\User  $user
     * @param  \CreatyDev\Domain\Api  $api
     * @return mixed
     */
    public function view(User $user, Api $api)
    {
        //
    }

    /**
     * Determine whether the user can create DocDummyPluralModel.
     *
     * @param  \CreatyDev\Domain\Users\Models\User  $user
     * @return mixed
     */
    public function create(User $user)
    {
       return false;
    }

    /**
     * Determine whether the user can update the DocApi.
     *
     * @param  \CreatyDev\Domain\Users\Models\User  $user
     * @param  \CreatyDev\Domain\Api  $api
     * @return mixed
     */
    public function update(User $user, Api $api)
    {
        if ($user->can('update apis')) {
            return true;
        }
    }

    /**
     * Determine whether the user can delete the DocApi.
     *
     * @param  \CreatyDev\Domain\Users\Models\User  $user
     * @param  \CreatyDev\Domain\Api  $api
     * @return mixed
     */
    public function delete(User $user, Api $api)
    {
        //
    }

    /**
     * Determine whether the user can restore the DocApi.
     *
     * @param  \CreatyDev\Domain\Users\Models\User  $user
     * @param  \CreatyDev\Domain\Api  $api
     * @return mixed
     */
    public function restore(User $user, Api $api)
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the DocApi.
     *
     * @param  \CreatyDev\Domain\Users\Models\User  $user
     * @param  \CreatyDev\Domain\Api  $api
     * @return mixed
     */
    public function forceDelete(User $user, Api $api)
    {
        //
    }
}
