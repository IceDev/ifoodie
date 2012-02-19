<?php
class Dashboard extends CI_Controller {
	function index() {
	}
	
	function login() {
		$this->load->model('user_model');
		$query = $this->user_model->validate_user();
		
		if ($query)	{ // If the user is validated.
			$session_data = array (
				'username' => $this->input->post('username'),
				'is_logged_in' => true
			);
			//	Create a session. Initialize it.
			$this->session->set_userdata($session_data);
			//	Display a view
			redirect('dashboard');
		}	else {
			redirect('start');
		}
	}
}
