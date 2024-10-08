<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Brandtype extends CI_Controller {

	var $page_name = "Tipe Merek"; 

	public function __construct()
	{
		parent::__construct();

		$this->load->model('m_base');
		$this->load->model('m_cart');
		$this->load->model('m_brandtype');
		$this->timeStamp = date("Y-m-d H:i:s", time());
	}

	public function index()
	{
		$data['success'] = $this->session->flashdata('success');
		$data['error'] = $this->session->flashdata('error');

		$data['records'] = $this->m_brandtype->getbrandtypes();

		$data['page_name'] = $this->page_name;
		$this->header();
		$this->load->view('brandtype/index', $data);
		$this->footer();
	}

	public function edit()
	{
		$data['error'] = $this->session->flashdata('error');

		$id = $this->input->get('id');

		if ($id == '') {
			$data['record'] = '';
		} else {
			$data['record'] = $this->m_brandtype->getbrandtype($id);
		}

		$data['brands'] = $this->m_base->getListWhere('brands', array(), 'asc');

		$data['page_name'] = $this->page_name;
		$this->header();
		$this->load->view('brandtype/edit', $data);
		$this->footer();
	}

	public function update()
	{
		$id = $this->input->post('id');
		$brand_id = $this->input->post('brand_id');

		$data = array(
			'name' => $this->input->post('name')
		);

		if ($id == '') {
			if ($id == null) {
				$data['brand_id'] = $brand_id;
			}

			if ($this->m_base->createData('brand_types', $data, 'id', $id)) {
				$this->session->set_flashdata('success', 'Data berhasil ditambahkan');
			} else {
				$this->session->set_flashdata('error', 'Data gagal ditambahkan');
			}
		} else {
			if ($this->m_base->updateData('brand_types', $data, 'id', $id)) {
				$this->session->set_flashdata('success', 'Data berhasil diubah');
			} else {
				$this->session->set_flashdata('error', 'Data gagal diubah');
			}
		}

		redirect('brandtype','refresh');
	}

	public function delete()
	{
		$id = $this->input->post('id');

		$data = array(
			'status' => false
		);

		if ($this->m_base->updateData('brand_types', $data, 'id', $id)) {
			$this->session->set_flashdata('success', 'Tipe berhasil dihapus');
			echo json_encode(array('message' => 'Tipe berhasil dihapus'));
		} else {
			$this->session->set_flashdata('error', 'Tipe gagal dihapus');
			echo json_encode(array('error' => 'Error saat menghapus tipe'));
		}
	}

	public function header()
	{
		if($this->session->userdata('id') == null){
			redirect(base_url("auth"));
		}

		if($this->session->userdata('user_id') != null){
			$data['cart_total'] = $this->m_cart->getTotalCartItems($this->session->userdata('user_id'));
			$data['booking_cart_total'] = $this->m_cart->getTotalBookingCartItems($this->session->userdata('user_id'));
		}
		
		$this->load->view('templates/header', $data);
	}

	public function footer()
	{
		$this->load->view('templates/footer');
	}

}

/* End of file Brandtype.php */
/* Location: ./application/controllers/Brandtype.php */