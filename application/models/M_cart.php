<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_cart extends CI_Model {

	function getTotalCartItems($user_id) {
		$this->db->select_sum('cart_items.qty');
		$this->db->join('cart_items', 'cart_items.cart_id = carts.id', 'left');
		$this->db->where('carts.user_id', $user_id);
		$this->db->where('carts.type', 'shopping');
		$this->db->where('carts.status', true);
		return $this->db->get('carts')->row();
	}

	function getTotalBookingCartItems($user_id) {
		$this->db->select_sum('cart_items.qty');
		$this->db->join('cart_items', 'cart_items.cart_id = carts.id', 'left');
		$this->db->where('carts.user_id', $user_id);
		$this->db->where('carts.type', 'booking');
		$this->db->where('carts.status', true);
		return $this->db->get('carts')->row();
	}

}

/* End of file M_cart.php */
/* Location: ./application/models/M_cart.php */