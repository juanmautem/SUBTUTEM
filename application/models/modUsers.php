<?php 
defined('BASEPATH') OR exit ('No direct script access allowed');

/**
 * 
 */
class ModUsers extends CI_Model
{
	
	public function get_allUsers(){
		$resultAdmin= $this->db->query("SELECT count(*) as total FROM usersData WHERE userType = 'Administrador'");
		if($resultAdmin){
			$data['numadm'] = $resultAdmin->result_array(0);
		}
		print_r($data);
	}
}