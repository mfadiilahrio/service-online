<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_booking extends CI_Model {

	function getBooking($where) {
		$this->db->select('
			bookings.*,
			u.name as user_name,
			u.phone as user_phone,
			auth.email as user_email,
			services.name as service_name,
			workshops.name as workshop_name,
			workshops.phone as workshop_phone,
			workshops.address as workshop_address,
			workshops.postal_code as workshop_postal_code,
			areas.name as area_name,
			m.name as mechanic_name,
			banks.name as bank_name,
			bank_accounts.account_number');
		$this->db->join('users u', 'u.id = bookings.user_id', 'left');
		$this->db->join('auth', 'auth.user_id = u.id', 'left');
		$this->db->join('services', 'services.id = bookings.service_id', 'left');
		$this->db->join('workshops', 'workshops.id = bookings.workshop_id', 'left');
		$this->db->join('areas', 'areas.id = bookings.area_id', 'left');
		$this->db->join('users m', 'm.id = bookings.mechanic_id', 'left');
		$this->db->join('bank_accounts', 'bank_accounts.id = bookings.bank_account_id', 'left');
		$this->db->join('banks', 'banks.id = bank_accounts.bank_id', 'left');
		$this->db->order_by('bookings.id', 'desc');

		$data = $this->db->get_where('bookings', $where)->row();

		if ($data->booking_status == 'waiting_confirmation') {
			$data->booking_status = 'Menunggu Persetujuan';
			$data->next_booking_status = 'confirmed';
			$data->next_booking_status_name = 'Konfirmasi';
		} else if ($data->booking_status == 'confirmed') {
			$data->booking_status = 'Dikonfirmasi';
			$data->next_booking_status = 'booking';
			$data->next_booking_status_name = 'Booking';
		} else if ($data->booking_status == 'booking') {
			$data->booking_status = 'Booking';
			$data->next_booking_status = 'process';
			$data->next_booking_status_name = 'Proses';
		} else if ($data->booking_status == 'process') {
			$data->booking_status = 'Diproses';
			$data->next_booking_status = 'waiting_payment';
			$data->next_booking_status_name = 'Menunggu Pembayaran';
		} else if ($data->booking_status == 'waiting_payment') {
			$data->booking_status = 'Menunggu Pembayaran';
			$data->next_booking_status = 'checking_payment';
			$data->next_booking_status_name = 'Mengecek Pembayaran';
		} else if ($data->booking_status == 'checking_payment') {
			$data->booking_status = 'Mengecek Pembayaran';
			$data->next_booking_status = 'completed';
			$data->next_booking_status_name = 'Selesai';
		} else if ($data->booking_status == 'completed') {
			$data->booking_status = 'Selesai';
			$data->next_booking_status = null;
			$data->next_booking_status_name = null;
		} else if ($data->booking_status == 'canceled') {
			$data->booking_status = 'Dibatalkan';
			$data->next_booking_status = null;
			$data->next_booking_status_name = null;
		}

		return $data;
	}

	function getBookings($where) {
		$this->db->select('
			bookings.*,
			u.name as user_name,
			u.phone as user_phone,
			auth.email as user_email,
			services.name as service_name,
			workshops.name as workshop_name,
			workshops.phone as workshop_phone,
			workshops.address as workshop_address,
			workshops.postal_code as workshop_postal_code,
			areas.name as area_name,
			m.name as mechanic_name,
			banks.name as bank_name,
			bank_accounts.account_number');
		$this->db->join('users u', 'u.id = bookings.user_id', 'left');
		$this->db->join('auth', 'auth.user_id = u.id', 'left');
		$this->db->join('services', 'services.id = bookings.service_id', 'left');
		$this->db->join('workshops', 'workshops.id = bookings.workshop_id', 'left');
		$this->db->join('areas', 'areas.id = bookings.area_id', 'left');
		$this->db->join('users m', 'm.id = bookings.mechanic_id', 'left');
		$this->db->join('bank_accounts', 'bank_accounts.id = bookings.bank_account_id', 'left');
		$this->db->join('banks', 'banks.id = bank_accounts.bank_id', 'left');
		$this->db->order_by("bookings.created_at", "desc");

		$datas = $this->db->get_where('bookings', $where)->result();

		foreach ($datas as $data) {
			if ($data->booking_status == 'waiting_confirmation') {
				$data->booking_status = 'Menunggu Persetujuan';
				$data->next_booking_status = 'confirmed';
				$data->next_booking_status_name = 'Konfirmasi';
			} else if ($data->booking_status == 'confirmed') {
				$data->booking_status = 'Dikonfirmasi';
				$data->next_booking_status = 'booking';
				$data->next_booking_status_name = 'Booking';
			} else if ($data->booking_status == 'booking') {
				$data->booking_status = 'Booking';
				$data->next_booking_status = 'process';
				$data->next_booking_status_name = 'Proses';
			} else if ($data->booking_status == 'process') {
				$data->booking_status = 'Diproses';
				$data->next_booking_status = 'waiting_payment';
				$data->next_booking_status_name = 'Menunggu Pembayaran';
			} else if ($data->booking_status == 'waiting_payment') {
				$data->booking_status = 'Menunggu Pembayaran';
				$data->next_booking_status = 'checking_payment';
				$data->next_booking_status_name = 'Mengecek Pembayaran';
			} else if ($data->booking_status == 'checking_payment') {
				$data->booking_status = 'Mengecek Pembayaran';
				$data->next_booking_status = 'completed';
				$data->next_booking_status_name = 'Selesai';
			} else if ($data->booking_status == 'completed') {
				$data->booking_status = 'Selesai';
				$data->next_booking_status = null;
				$data->next_booking_status_name = null;
			} else if ($data->booking_status == 'canceled') {
				$data->booking_status = 'Dibatalkan';
				$data->next_booking_status = null;
				$data->next_booking_status_name = null;
			}
		}

		return $datas;
	}

	function getBookingItems($id) {
		$this->db->select('
			booking_items.*, 
			items.id as item_id, 
			items.name,
			items.image_url, 
			brand_types.name as brand_type,
			brands.name as brand');
		$this->db->join('items', 'items.id = booking_items.item_id', 'left');
		$this->db->join('brand_types', 'brand_types.id = items.brand_type_id', 'left');
		$this->db->join('brands', 'brands.id = brand_types.brand_id', 'left');
		$this->db->where('booking_items.booking_id', $id);

		$datas = $this->db->get('booking_items')->result();

		foreach ($datas as $data) {
			if (($data->brand != null && $data->brand_type != null)) {
				$data->brand_name = $data->brand.' '.$data->brand_type;	
			} else {
				$data->brand_name = '-';
			}

			$data->subtotal = $data->price * $data->qty;
		}

		return $datas;
	}
}

/* End of file M_booking.php */
/* Location: ./application/models/M_booking.php */