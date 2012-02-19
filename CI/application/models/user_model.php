<?php

class User_model extends CI_Model {
	function validate_user() {
		// Constructing the query
		$login_credentials = array(
			'userId' => $this->input->post('username'),
			'password' => $this->input->post('password')
		);
		// Firing the query
		$query = $this->db->get('users');
		// If query has 1 result
		// User exists & is validated.
		if($query->num_rows == 1) {
			return true;
		}
	}
}