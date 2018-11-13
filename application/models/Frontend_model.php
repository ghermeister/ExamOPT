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
	
	public function save_answers()
	{
		$ins = [
			'testID' => "TRIAL", // generate unique ID
			'memberID' => $this->session->userdata('login_id'), // get session ID
			'testdescription' => "desc_test",
			'lancode' => "en"
		];
		
		$this->db->insert('results_main', $ins);

		$resultID = $this->db->insert_id();

		$answers = $this->input->post();
		
		$data = [];
		foreach($answers as $key => $ans) {
			if(substr($key, 0, 3) === "opt") {
				$res['results_mainID'] = $resultID;
				$res['itemsID'] = substr($key, 3, strlen($key));
				$res['value'] = $ans;
				$data[] = $res;
			}
		}

		$this->db->insert_batch('results_items', $data);

		// update to get item text
		$sql = "UPDATE results_items INNER JOIN vw_items ON results_items.itemsID  = vw_items.ID
			SET results_items.itemtext = vw_items.text
			WHERE vw_items.lancode = '{$ins['lancode']}' AND results_mainID = $resultID";
		$this->db->query($sql);

		$fn = "CALL P_CALCULATE_MAIN($resultID)";
		$save = $this->db->query($fn);
		if($save){
			return $resultID;
		}else{
			return "No Result";
			exit();
		}

	}

	public function show_results_dimensions($answer){
		$member_id = $this->session->userdata('login_id');
		$this->db->select('*');
		$this->db->from('results_dimensions');
		$this->db->where('results_mainID', $answer);
		$query = $this->db->get();
		if($query->num_rows() > 0){
			return $query->result();
		}
        return [];
	}

	public function show_results_categories($answer){
		$member_id = $this->session->userdata('login_id');
		$this->db->select('*');
		$this->db->from('results_categories');
		$this->db->where('results_mainID', $answer);
		$query = $this->db->get();
		if($query->num_rows() > 0){
			return $query->result();
		}
        return [];
	}
}