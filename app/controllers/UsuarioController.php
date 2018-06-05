<?php
require_once 'Controller.php';
require_once 'IController.php';

class UsuarioController extends Controller implements IController{
	private $table = 'users';
	private $conn = null;
	private $params;
	private $http_method;
	private $type_search;
	private $functionPref;
	private $result;

	public function __construct($params = array(), $http_method = 'GET') {
		// unset($params['_']);
		$this->http_method 	= $http_method;
		$this->functionPref = empty($params['function']) ? null : $params['function'];
		if (!empty($params['function'])) unset($params['function']);
		$this->params 		= $params;
		// die(var_dump($this->params));

		switch ($http_method) {
		 	case 'GET':
		 		if (empty($this->functionPref)) {
			 		if (empty($this->params)){
			 			$this->index();
			 		} else {
			 			$this->search();
			 		}
		 		} else {
		 			unset($this->params['function']);
		 			call_user_func(array($this,$this->functionPref));
		 		}
		 		break;
		 	case 'POST':
		 		if (empty($this->functionPref)) {
			 		$this->create();
		 		} else {
		 			unset($this->params['function']);
		 			call_user_func(array($this,$this->functionPref));
		 		}
		 		break;
		 	case 'PUT':
		 		if (empty($this->functionPref)) {
			 		$this->update();
		 		} else {
		 			unset($this->params['function']);
		 			call_user_func(array($this,$this->functionPref));
		 		}
		 		break;
		 	case 'DELETE':
		 		if (empty($this->functionPref)) {
			 		$this->delete();
		 		} else {
		 			unset($this->params['function']);
		 			call_user_func(array($this,$this->functionPref));
		 		}
		 		break;
		 	
		 	default://GET
				if (empty($this->functionPref)) {
			 		if (empty($this->params)){
			 			$this->index();
			 		} else {
			 			$this->search();
			 		}
		 		} else {
		 			unset($this->params['function']);
		 			call_user_func(array($this,$this->functionPref));
		 		}
		 		break;
		 }
	}

	//---------------------------------------------------------------------------------------

	public function index() {
		global $adb;
		$this->result = $adb->pquery("SELECT * FROM ".$this->table);
	}

	public function search() {
		global $adb;
		if ($this->type_search == 'filtro') {
			$condicion = 'AND';
		}else {
			$condicion = 'OR';
		}
		foreach ($this->params as $key => $value) {
			$where[]= " `".$key."` = '".$value."'";
		}
		$this->result = $this->conn->pquery("SELECT * FROM ".$this->table." WHERE ". implode(" $condicion ", $where), true, true);
	}

	public function update() {
		global $adb;
		$this->result = ['message' => 'Sin implementar PUT'];
	}

	public function create() {
		global $adb;
		$id = $this->conn->select("SELECT id FROM users WHERE name = '".$_POST['username']."' ", false);
		if (count($id) == 0){
			$_POST['password'] = md5($_POST['password']);
			$val = $this->conn->insert($_POST, false)->inTable($this->table);
			$id = $this->conn->select("SELECT id FROM usuarios WHERE username = '".$_POST['username']."' ", false)[0];
			$this->conn->insert(["id_menu"=>"1","id_usuario"=>$id['id'],"usuario"=>$_POST['usuario_reg']])->inTable("permisos_menu");
		} else {
			$this->result = ['estado'=> 'error', 'message' => 'El usuario ya esxite.'];
			exit;
		}

		if ($val===true) {
			$this->result = ['estado'=> 'success', 'message' => 'OK'];
		} else {
			$this->result = ['estado'=> 'error', 'message' => 'Ocurrió un error'];
		}
	}

	public function delete() {
		global $adb;
		$this->result = ['message' => 'Sin implementar DELETE'];
	}

	//--------------------------- funciones personalizadas -----------------------------------------------------
	public function login() {
		global $config, $adb;

		$py_name = $config['nameApp'];
		$actual = date("Y-m-d H:i:s");
		$user = "";
		$permisos = array();
		$msgLicence = "";
		// echo json_encode($_REQUEST);die();

		$username = trim($this->params['username']);
		$password = md5($this->params['password']);
		// $this->conn->setDebug(true);
		$permisos = $adb->pquery("SELECT * FROM `users` u WHERE (u.name = '$username' OR u.email = '$username') AND u.password = '$password' and u.active = 1");
		
		if ( !empty($permisos) ) {
			$permisos = $permisos[0];
			$token = Funciones::genetareAccessToken();

			$adb->pquery("INSERT INTO `user_token` (`user_id`, `token`, `inicio`, `fin`, `active`) VALUES ({$permisos['id']}, '$token', NOW(), NULL, '1')");

			$this->result	= [
				"status" => 200,
				"user" => $username,
				"token" => $token,
				"data" => $permisos,
			];	
		} else {
			$this->result = [
				"status" => 400,
			];
		}
		
	}

	public function validateToken() {
		global $adb;
		$val = Funciones::validateToken();
		$this->result = $val;
		// return $token;
	}

	public function listPermisosByUser(){
		$id_usuario = $this->params['id_usuario'];
		$query = "SELECT pm.id as id_permiso_menu, m.* FROM permisos_menu pm INNER JOIN menu m ON pm.id_menu = m.id WHERE id_usuario = '$id_usuario' AND m.activo = '1' AND pm.activo = '1' ORDER BY m.orden asc";
		$this->result = $this->conn->select($query);
	}
	
	public function listAdminPermisosByUser(){
		$id_usuario = $this->params['id_usuario'];
		$query = "SELECT m.*, case ifnull((SELECT pm.id FROM permisos_menu pm WHERE id_usuario = '$id_usuario' AND m.id = pm.id_menu AND pm.activo = '1'),'0') when '0' then '0' else '1' end as permiso, ifnull((SELECT pm.id FROM permisos_menu pm WHERE id_usuario = '$id_usuario' AND m.id = pm.id_menu AND pm.activo = '1'),'0') as id_permiso_menu FROM menu m WHERE m.activo = '1'  ORDER BY m.orden asc ";

		$this->result = $this->conn->select($query);
	}

	public function listUsuarios(){
		$query = "SELECT u.*, t.email, tu.nombre as tipo_usuario, c.nombre as cargo FROM usuarios u INNER JOIN tipousuario tu ON u.id_tipousuario = tu.id INNER JOIN trabajador t ON u.id_trabajador = t.id LEFT JOIN trabajador_cargo tc ON t.id = tc.id_trabajador LEFT JOIN cargos c ON tc.id_cargo = c.id";
		$this->result = $this->conn->select($query);
	}

	public function cambiarEstado(){
		$id_usuario = $this->params['id_usuario'];
		$activo = $this->params['estado'];
		$val = $this->conn->update("UPDATE usuarios SET activo = '$activo', updated_at = now() WHERE id = '$id_usuario'");
		if ($val === true) {
			$this->result = ["estado" => "success", "message" => "OK"];
		} else {
			$this->result = ["estado" => "error", "message" => "Ocurrió un error."];
		}
	}

	public function getTipoUsuario()
	{
		$this->result = $this->conn->select("SELECT * FROM tipousuario WHERE activo = '1'");
	}

	public function adminPermisos(){
		$id = $this->params['id'];
		$id_usuario = $this->params['id_usuario'];
		$activo = $this->params['estado'];

		unset($_POST['function']);
		unset($_POST['id']);
		unset($_POST['estado']);

		if (intval($id) > 0) {
			$val = $this->conn->update("UPDATE permisos_menu SET activo = '$activo', updated_at = now() WHERE id = '$id'");
		} else {
			$val = $this->conn->insert($_POST)->inTable("permisos_menu");
		}
		if ($val === true) {
			$this->result = ["estado" => "success", "message" => "OK"];
		} else {
			$this->result = ["estado" => "error", "message" => "Ocurrió un error."];
		}
	}

	public function getTrabajadoresSinUsuario()
	{
		$this->result = $this->conn->select("SELECT t.* FROM trabajador t WHERE t.id NOT IN(select u.id_trabajador from usuarios u) AND t.estado = '1'");
	}


	public function verificaDatos() {
		$option = strtoupper($this->params['dato']);
		$valor = trim($this->params['valor']);
		$message = "El $option ya está registrado.";
		switch ($option) {
			case 'USERNAME':
				$query = "SELECT * FROM usuarios WHERE trim(username) = '$valor'";
				$rest = $this->conn->select($query);
				if (count($rest) == 0) {$message = true;}
				break;
			case 'EMAIL':
				$query = "SELECT * FROM trabajador WHERE trim(email) = '$valor'";
				$rest = $this->conn->select($query);
				if (count($rest) == 0) {$message = true;}
				break;
		}
		$this->result = $message;
	}

	public function sugiereUsuario()
	{
		$id_trabajador = $this->params['id_trabajador'];

		$this->result = $this->conn->select("select lower(concat(substring(nombres,1,1), substring(apellidos,1,locate(' ', trim(apellidos))) )) username from trabajador where id = '$id_trabajador'")[0];
	}


	
	//--------------------------- fin funciones personalizadas --------------------------------------------------



	// utilizando metodo heredado
	public function response($type = 'json') {
		if ($type = 'json') {
			return parent::responseJson($this->result);
		}else {
			return parent::response($this->result);
		}
	}

}