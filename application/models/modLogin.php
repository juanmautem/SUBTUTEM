<?php 
defined('BASEPATH') OR exit ('No direct script access allowed');

/**
 * 
 */
class ModLogin extends CI_Model
{
	
	public function log_in($usr,$psw){
		/*echo "USUARIO: " . $usr;
		echo "PASSWORD: " . $psw;*/
		$result = $this->db->query("SELECT * FROM allUsers WHERE user = '".$usr."' AND pass = '".$psw."';");
		if($result->num_rows() > 0){
			$usersData = $result->result_array();
			//print_r($usersData[0]);
			$userData = $this->db->query("SELECT * FROM userData WHERE userId = ". $usersData[0]['userId']);
			if($userData->num_rows() > 0){
				$uData = $userData->result_array();
				return $uData[0];
			}
		}
		else
			echo "Error en conexion";

	}
}