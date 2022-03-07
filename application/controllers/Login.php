<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {
	public function __construct(){
		parent::__construct();
        $this->load->database('default');
		$this->load->model('modLogin');
		$this->load->model('modUsers');
	}
	public function index()
	{

		$this->load->view('Template/header');
		$this->load->view('Main/navMain');
		$this->load->view('Login/login');
		$this->load->view('Template/footer');
	}

	public function log_in()
	{

		//print_r($_POST);
		$user = $_POST['txtUser'];
		$psw = $_POST['txtPsw'];
		$data= $this->modLogin->log_in($user,$psw); 
		$sessionUsr = array(
			'nIdUser'=> $data['userId'],
			'nIdPerson'=> $data['personId'],
			'txtName'=> $data['Name'],
			'txtLastName'=> $data['Lastname'],
			'txtRFC'=> $data['RFC'],
			'txtUserType'=> $data['userType']
		);
		$this->session->set_userdata($sessionUsr);
		if($data['userType'] = 'Administrador'){
			$this->admin();
			
		}elseif($data['userType'] = 'Secretario General'){
			$this->sege();
		}elseif($data['userType'] = 'Miembro'){
			$this->miem();
		}
	}
	public function admin(){
		$info['$allUsers'] = 
		$this->load->view('Template/header');
		$this->load->view('Template/navMenu');
		$this->load->view('Template/admin');
		$this->load->view('Template/dashboards');
		$this->load->view('Template/footer');
	}
	public function sege(){
		$this->load->view('Template/header');
		$this->load->view('Template/navMenu');
		$this->load->view('Template/admin');
		$this->load->view('Template/footer');
	}
	public function miem(){
		$this->load->view('Template/header');
		$this->load->view('Template/navMenu');
		$this->load->view('Template/admin');
		$this->load->view('Template/footer');
	}


	public function log_out(){

		$this->session->sess_destroy();
		header('Location: '.site_url('ppal'));

	}
}