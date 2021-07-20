<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Booking extends CI_Controller {

	var $page_name = "Pesanan"; 

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model('m_base');
		$this->load->model('m_booking');
		$this->load->model('m_cart');
		$this->load->model('m_item');
		$this->timeStamp = date('Y-m-d H:i:s', time());
	}

	public function index()
	{
		$data['success'] = $this->session->flashdata('success');
		$data['error'] = $this->session->flashdata('error');
		$data['message'] = $this->session->flashdata('message');

		$id = $this->input->get('id');
		$print = ($this->input->get('print') != null) ? true : false;

		if ($id != null) {
			$data['record'] = $this->m_booking->getBooking(array('bookings.id' => $id));
			$data['records'] = $this->m_booking->getBookingItems($id);

			$subtotal = 0;

			foreach ($data['records'] as $booking_item) {
				$subtotal = $subtotal + ($booking_item->price * $booking_item->qty);
			}

			$data['subtotal'] = $subtotal + $data['record']->other_cost;

			$view = ($print) ? 'booking/invoice_print' :'booking/booking_detail';
		} else {
			if ($this->session->userdata('user_type') == 'customer') {
				$where['user_id'] = $this->session->userdata('user_id');
			} else if($this->session->userdata('user_type') == 'mechanic') {
				$where['mechanic_id'] = $this->session->userdata('user_id');
			}

			$data['records'] = $this->m_booking->getBookings(array());

			$view = 'booking/index';
		}

		$data['page_name'] = $this->page_name;

		if (!$print) {
			$this->header();
		}
		$this->load->view($view, $data);
		if (!$print) {
			$this->footer();
		}
	}

	public function createbooking()
	{
		$type   = $this->input->post('type');
		$area_id   = $this->input->post('area_id');
		$complaint   = $this->input->post('complaint');
		$date   = $this->input->post('date');
		$bank_account_id   = $this->input->post('bank_account_id');

		if ($type == 'shopping' || $type == 'booking') {
			$this->form_validation->set_rules('type', 'Tipe Pesanan', 'required');
			$this->form_validation->set_rules('area_id', 'Area', 'required|numeric');
			if ($type == 'booking') {
				$this->form_validation->set_rules('complaint', 'Keluhan', 'required');
				$this->form_validation->set_rules('date', 'Tanggal', 'required');
			}
			$this->form_validation->set_rules('bank_account_id', 'Metode pembayaran', 'required|numeric');

			if($this->form_validation->run()) {

				$data = array(
					'user_id' => $this->session->userdata('user_id'),
					'service_id' => ($type == 'shopping') ? 1 : 2,
					'area_id' => $area_id,
					'type' => $type,
					'complaint' => ($type == 'booking') ? $complaint : NULL,
					'date' => ($type == 'shopping') ? $this->timeStamp : $date,
					'address' => $this->session->userdata('address'),
					'phone' => $this->session->userdata('phone'),
					'postal_code' => $this->session->userdata('postal_code'),
					'bank_account_id' => $bank_account_id
				);

				if ($booking_id = $this->m_base->createDataWithInsertID('bookings', $data)) {

					$cart_items = $this->m_cart->getData($this->session->userdata('id'), $type);

					foreach ($cart_items as $cart_item) {
						$booking_item_data = array(
							'booking_id' => $booking_id,
							'item_id' => $cart_item->item_id,
							'price' => $cart_item->price,
							'qty' => $cart_item->qty
						);

						$this->m_base->createData('booking_items', $booking_item_data);

						$this->m_item->decreaseQty($cart_item->item_id, $cart_item->qty);
					}

					$cart_data = array(
						'status' => false
					);

					if ($this->m_cart->nonactivateCarts($cart_data, $this->session->userdata('user_id'), $type)) {
						$this->session->set_flashdata('success', 'Pesanan anda berhasil dibuat');
						redirect('booking','refresh'); 
					} else { 
						$this->session->set_flashdata('message', 'Gagal menghapus daftar keranjang anda'); 
					}
				} else {
					$this->session->set_flashdata('message', 'Pesanan anda gagal dibuat');
				}
			} else {
				$this->session->set_flashdata('error', validation_errors());
			}
			redirect('cart?type='.$type,'refresh');
		} else {
			$this->session->set_flashdata('message', "Error saat membuat pesanan");
			redirect('cart?type=booking','refresh');
		}
	}

	public function header()
	{
		if($this->session->userdata('id') == null){
			redirect(base_url("auth"));
		}

		$data = array();

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

/* End of file Booking.php */
/* Location: ./application/controllers/Booking.php */