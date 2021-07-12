<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

	var $page_name = "Home"; 

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model('m_base');
		$this->timeStamp = date('Y-m-d H:i:s', time());
	}

	public function index()
	{
		$data['success'] = $this->session->flashdata('success');
		$data['error'] = $this->session->flashdata('error');

		$data['page_name'] = $this->page_name;
		$this->header();
		$this->load->view('home/index', $data);
		$this->footer();
	}

	public function header()
	{
		$this->load->view('templates/header');
	}

	public function footer()
	{
		$this->load->view('templates/footer');
	}

}

/* End of file Home */
/* Location: ./application/controllers/Home */