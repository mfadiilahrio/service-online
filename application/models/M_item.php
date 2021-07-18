<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_item extends CI_Model {

	function decreaseQty($id, $qty) {
		$this->db->set('qty', "qty - $qty", false);
		$this->db->where('id', $id);
		if($this->db->update('items')) {
			return true;
		} else {
			return false;
		}
	}

}

/* End of file M_item.php */
/* Location: ./application/models/M_item.php */