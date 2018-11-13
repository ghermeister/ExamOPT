<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
*/
$route['frontend'] = 'frontend';
$route['frontend/user_verification'] = 'frontend/user_verification';
$route['frontend/dashboard'] = 'frontend/homepage';
$route['take_exam'] = 'frontend/take_exam';
$route['submit_test'] = 'frontend/submit_test';
$route['show_result/(:num)'] = 'frontend/show_result/$1';
$route['sign_out'] = 'frontend/sign_out';

$route['default_controller'] = 'frontend';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;
