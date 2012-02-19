<?php

class Start extends CI_Controller {
	function index() {
		$data['main_content'] = 'start_screen';
		$this->load->view('template\template', $data);
	}
}
