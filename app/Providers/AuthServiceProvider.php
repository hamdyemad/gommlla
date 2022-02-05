<?php

namespace App\Providers;

use App\User;
use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Laravel\Passport\Passport;

class AuthServiceProvider extends ServiceProvider
{
  /**
   * The policy mappings for the application.
   *
   * @var array
   */
  protected $policies = [
    'App\Model' => 'App\Policies\ModelPolicy',
  ];

  /**
   * Register any authentication / authorization services.
   *
   * @return void
   */
  public function boot()
  {
    $this->registerPolicies();
    Passport::routes();
    // 1 pos
    // 2 products
    // 3 all orders
    // s all statuses
    // 4 inhousses orders
    // 5 seller orders
    // 7 refunds
    // 8 customers
    // 9 sellers
    // 10 reports
    // 11 marketing
    // 12 support
    // 13 tickets
    // 16 conversations
    // 20 staffs

    // distribution distribution orders
    // commissions commissions
    $permessions = ['1','2','3','4','5','7','8','9','10','11','12','13','16','20','distribution','commissions' ,'s'];


    foreach ($permessions as $permession) {
        Gate::define($permession, function(User $user) use($permession) {
            return $user->user_type == 'admin' || in_array($permession, json_decode($user->staff->role->permissions));
        });
    }

  }
}
