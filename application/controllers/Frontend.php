<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Frontend extends CI_Controller {

	/**
		Frontend Controller
	*/
	 
	function __construct(){
        parent::__construct();
		$this->load->helper(array('url', 'form', 'security'));
		$this->load->library(array('form_validation', 'session'));
		$this->load->model('frontend_model');

        $this->template->set_title('Personality Test');
        $this->template->set_template('frontend');
    }
	
	public function index(){
		if($this->session->userdata('login_is_active') == 1){
			redirect(base_url() . 'frontend/dashboard', 'refresh');
			// echo "Logged In";
		}else{
			$this->load->view('frontend/frontend_login');
		}
	}
	
	public function user_verification(){
		if($this->session->userdata('login_is_active') == 1){
			redirect(base_url() . 'frontend/dashboard', 'refresh');
			// echo "Logged In";
		}else{
			$username = $this->input->post('username');
			$password = $this->input->post('password');
			$this->form_validation->set_rules('username', 'Username', 'required');  
			$this->form_validation->set_rules('password', 'Password', 'required');
			
			if($this->form_validation->run() == FALSE){
				$result = $this->frontend_model->user_login($username, $password);
				if (count($result) > 0){
					// set session
					$sess_data = array(
						'login' => TRUE, 
						'login_username' => $result[0]->username, 
						'login_password' => $result[0]->password, 
						'login_is_active' => $result[0]->is_active, 
						'login_id' => $result[0]->id
					);
					if($sess_data['login_is_active'] == 1){
						$this->session->set_userdata($sess_data);
						redirect(base_url() . 'frontend/dashboard', 'refresh');
					}else{
						$this->session->set_flashdata('success', '<div id="alert-fade" class="alert alert-danger alert-dismissible" role="alert" id="alertErr"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>The Account You Try To Login is Not Active/De-activated.</div>');
						redirect(base_url(), 'refresh');
					}
				}
			}else{
				redirect(base_url(), 'refresh');
			}
		}
	}
	
	public function homepage(){
		if($this->session->userdata('login_is_active') == 1){
			$styles = array(

			);
			$js = array(
				
			);
			$this->template->set_additional_css($styles);
			$this->template->set_additional_js($js);
			$this->template->load_sub('session_user', $this->session->userdata());
			$this->template->load('frontend/frontend_index');
		}else{
			redirect(base_url());
		}
	}
	
	public function take_exam(){
		if($this->session->userdata('login_is_active') == 1){
			$styles = array(

			);
			$js = array(
				
			);
			$this->template->set_additional_css($styles);
			$this->template->set_additional_js($js);
			$this->template->load_sub('session_user', $this->session->userdata());
			$this->template->load_sub('questions', $this->frontend_model->rand_question());
			$this->template->load('frontend/frontend_take_exam');
		}else{
			redirect(base_url());
		}
	}

	public function submit_test()
	{
		$answer = $this->frontend_model->save_answers();
		if($answer){
			redirect('/show_result/'.$answer, 'refresh');
		}else{
			redirect('/take_exam', 'refresh');
		}
	}

	public function show_result($answer)
	{
		if($this->session->userdata('login_is_active') == 1){
			$styles = array(

			);
			$js = array(
				
			);
			$this->template->set_additional_css($styles);
			$this->template->set_additional_js($js);
			$this->template->load_sub('session_user', $this->session->userdata());
			$this->template->load_sub('showResultsDimension', $this->frontend_model->show_results_dimensions($answer));
			$this->template->load_sub('showResultsCategory', $this->frontend_model->show_results_categories($answer));
			$this->template->load('frontend/frontend_show_result');
		}else{
			redirect(base_url());
		}
	}
	
}
