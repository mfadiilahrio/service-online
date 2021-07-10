<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_user extends CI_Model {

	function getDataById($id) {
		$this->db->select('users.*');
		$this->db->where('users.id',$id);
		$this->db->limit(1,0);
		return $this->db->get('users')->row();
	}

	function getData() {
		$this->db->select('users.*');
		$this->db->order_by('users.id', 'desc');
		return $this->db->get('users')->result();
	}

	function getNonUserAuths() {
		$this->db->select('users.id');
		$this->db->select('users.name');
		$this->db->join('users', 'users.user_id = users.id', 'left');
		$this->db->where('users.id IS NULL');
		$this->db->order_by('users.id', 'desc');
		return $this->db->get('users')->result();
	}
}

/* End of file m_user.php */
/* Location: ./application/models/m_user.php */