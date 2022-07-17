<?php

namespace Tests\Feature;

use App\Models\User;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class AuthenticationTest extends TestCase
{
    use RefreshDatabase;

    public function test_login_screen_can_be_rendered()
    {
        $response = $this->get('/login');

        $response->assertStatus(200);
    }

    public function test_users_can_authenticate_using_the_login_screen()
    {

        $response = $this->post('/api/login', [
            'email' => 'admin@admin.com',
            'password' => 'password',
        ]);

        $response->assertStatus(200);
       
    }

    public function test_users_register()
    {
        $user = $this->post('/api/user',[
            'name' => 'konglong',
            'email' => 'lykonglong@yahoo.com',
            'password' => 'password'
            
        ]);
        
        $user->assertStatus(200);
    }
}
