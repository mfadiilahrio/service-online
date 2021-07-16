<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_bankaccount extends CI_Model {

	function getBankAccounts($where) {
		$this->db->select('
			bank_accounts.*,
			banks.name');
		$this->db->join('banks', 'banks.id = bank_accounts.bank_id', 'left');
		return $this->db->get_where('bank_accounts', $where)->result();
	}

}