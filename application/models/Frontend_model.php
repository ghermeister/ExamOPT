<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Frontend_model extends CI_Model {
	function __construct(){
		parent::__construct();
		$this->load->database();
    }
	
	public function user_login($username, $password){
		$result = $this->db->from('member')->where('username', $username)->get();
		if($result->num_rows() === 1){
			$user = $result->row_array();
			if($password == $user['password']){
				return $result->result();
			} else {
				return [];
			}
		} else {
			return [];
		}
    }
	
	public function rand_question(){
		$this->db->select('*');
        $this->db->from('vw_items');
		$this->db->where('lancode', 'en');
		$this->db->order_by('rand()');
        $query = $this->db->get();
        if($query->num_rows() > 0){
            return $query->result();
        }
        return [];
    }
}