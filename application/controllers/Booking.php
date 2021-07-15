<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Booking extends CI_Controller {

	var $page_name = "Booking"; 

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model('m_base');
		$this->load->model('m_booking');
		$this->load->model('m_cart');
		$this->timeStamp = date('Y-m-d H:i:s', time());
	}

	public function index()
	{
		if($this->session->userdata('id') == null && $this->session->userdata('user_type') != 'admin'){
			redirect(base_url("auth"));
		}

		$data['success'] = $this->session->flashdata('success');
		$data['error'] = $this->session->flashdata('error');

		$where = array();

		if ($this->session->userdata('user_type') == 'customer') {
			$where['user_id'] = $this->session->userdata('user_id');
		} else if($this->session->userdata('user_type') == 'mechanic') {
			$where['mechanic_id'] = $this->session->userdata('user_id');
		}

		$data['records'] = $this->m_booking->getBookings($where);

		$data['page_name'] = $this->page_name;
		$this->header();
		$this->load->view('booking/index', $data);
		$this->footer();
	}

	public function header()
	{
		$data = array();

		if($this->session->userdata('user_id') != null){
			$data['cart_total'] = $this->m_cart->getTotalCartItems($this->session->userdata('user_id'));
		}
		
		$this->load->view('templates/header', $data);
	}

	public function footer()
	{
		$this->load->view('templates/footer');
	}


}

/* End of file Booking.php */
/* Location: ./application/controllers/Booking.php */