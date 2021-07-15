<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Bookingservice extends CI_Controller {

	var $page_name = "Booking Servis"; 

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model('m_base');
		$this->load->model('m_cart');
		$this->timeStamp = date('Y-m-d H:i:s', time());
	}

	public function index()
	{
		$data['success'] = $this->session->flashdata('success');
		$data['error'] = $this->session->flashdata('error');

		$data['records'] = $this->m_base->getListWhere('services', array());

		$data['page_name'] = $this->page_name;
		$this->header();
		$this->load->view('bookingservice/index', $data);
		$this->footer();
	}

	public function header()
	{
		$data = array();

		if($user_id = $this->session->userdata('user_id') != null){
			$data['cart_total'] = $this->m_cart->getTotalCartItems($user_id);
		}
		
		$this->load->view('templates/header', $data);
	}

	public function footer()
	{
		$this->load->view('templates/footer');
	}

}

/* End of file Bookingservice */
/* Location: ./application/controllers/Bookingservice */