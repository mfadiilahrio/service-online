<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('m_base');
		$this->load->model('m_user');
	}

	public function index()
	{

		if($this->session->userdata('id') != null){
			redirect(base_url("booking"));
		}

		$data['message'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('message');
		$this->load->view('login/index', $data);
	}

	function login()
	{
		$email   = $this->input->post('email');
		$password   = $this->input->post('password');

		$where = array(
			'email' => $email,
			'password' => md5($password)
		);

		if ($auth = $this->m_base->getWhere('auth', $where)) {

			$where = array(
				'id' => $auth->user_id,
			);

			if($user = $this->m_base->getWhere('users', $where)) {

				$data_session = array(
					'id' 		=> $auth->id,
					'email'		=> $auth->email,
					'user_type' => $auth->user_type,
					'user_id'   => $user->id,
					'name'     	=> $user->name,
					'phone' 	=> $user->phone,
					'address'	=> $user->address,
					'dob'		=> $user->dob,
					'user_type' => $auth->user_type,
				);

				$this->session->set_userdata($data_session);
				$this->session->set_flashdata('success', "Hello ".$user->name." :)");

				redirect(base_url("booking"));

			} else {

				$this->session->set_flashdata('message', "Unregistered User !!");
				redirect('auth','refresh');

			}

		} else {

			$this->session->set_flashdata('message', "Username atau Password salah");
			redirect('auth','refresh');

		}       
	}
	
	function logout()
	{
		$this->session->sess_destroy();
		redirect(base_url('auth'));
	}

}

/* End of file auth.php */
/* Location: ./application/controllers/auth.php */