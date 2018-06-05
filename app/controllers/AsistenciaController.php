<?php
require_once 'Controller.php';
require_once 'IController.php';

class AsistenciaController extends Controller implements IController{
	private $table = 'asistencias';
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

		// die(var_dump($this->conn));

		switch ($http_method) {
		 	case 'GET':
		 		if (empty($this->functionPref)) {
			 		if (empty($this->params)){
			 			$this->index();
			 		} else {
			 			$this->search();
			 		}
		 		} else {
		 			call_user_func(array($this,$this->functionPref));
		 		}
		 		break;
		 	case 'POST':
		 		if (empty($this->functionPref)) {
			 		$this->create();
		 		} else {
		 			call_user_func(array($this,$this->functionPref));
		 		}
		 		break;
		 	case 'PUT':
		 		if (empty($this->functionPref)) {
			 		$this->update();
		 		} else {
		 			call_user_func(array($this,$this->functionPref));
		 		}
		 		break;
		 	case 'DELETE':
		 		if (empty($this->functionPref)) {
			 		$this->delete();
		 		} else {
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
		 			call_user_func(array($this,$this->functionPref));
		 		}
		 		break;
		 }
	}

	//---------------------------------------------------------------------------------------

	public function index() {
		global $adb;
		$sql = "SELECT * FROM asistencias;";
		$sql = $adb->pquery($sql);
		
		$this->result = ["data" => $sql];
	}

	public function search() {
		global $adb;
		// error_reporting(-1);
		$f_inicio = $f_fin = null;
		$query = "SELECT a.*, CONCAT(t.apellidos, ' ', t.nombres) as apenom, '' as dispositivo FROM asistencias as a ";
		$where = " WHERE 1=1 ";
		
		if ( $this->params['type'] == 'date' ) {
            if ( !empty($this->params['f_inicio']) ) {
                $f_inicio = Funciones::validaFecha($this->params['f_inicio']) . " 00:00:00";
                // $asistencias->where("fecha_hora", ">=", $f_inicio);
                $where .= " AND fecha_hora >= '$f_inicio' ";
            }
            if ( !empty($this->params['f_fin']) ) {
                $f_fin = Funciones::validaFecha($this->params['f_fin']) . " 23:59:59";
                // $asistencias->where("fecha_hora", "<=", $f_fin);
                $where .= " AND fecha_hora <= '$f_fin' ";
            }
        }
        if ( $this->params['type'] == 'datetime' ) {
            if ( !empty($this->params['f_inicio']) ) {
                $f_inicio = Funciones::validaFecha($this->params['f_inicio']) . " " . $this->params['h_inicio'];
                // $asistencias->where("fecha_hora", ">=", $f_inicio);
                $where .= " AND fecha_hora >= '$f_inicio' ";
            }
            if ( !empty($this->params['f_fin']) ) {
                $f_fin = Funciones::validaFecha($this->params['f_fin']) . " " . $this->params['h_fin'];
                // $asistencias->where("fecha_hora", "<=", $f_fin);
                $where .= " AND fecha_hora <= '$f_fin' ";
            }
        }

        $query .= " LEFT JOIN trabajadores as t ON a.nro_documento = t.nro_documento ";

        $query .= $where;
        $query .= " ORDER BY fecha_hora";
        // $this->conn->setDebug(true);
        $return = $adb->pquery($query);
		$this->result = ['data' => $return];
	}

	public function update() {
		$this->result = ['message' => 'Sin implementar PUT'];
	}

	public function create() {
		global $request, $adb;
		$is_ok = 1;
        $mensaje = "Asistencia Registrada";
        $alert = "success";
        $http_code = 201;
        $record_id = null;
        $valida_asistencia = null;
        // var_dump($request);
        // die();
        $in_out = !empty($request->in_out)? $request->in_out:'IN'; // si es un registro de IN=INGRESO o OUT=SALIDA
        
        $nro_dia = "";
        $now = date("Y-m-d H:i:s");
        $fecha_hora = empty($request->fecha_hora)? $now : $request->fecha_hora;
        $nro_dia = Funciones::getDiaSemana($fecha_hora);

        $trabajador = $adb->pquery("SELECT * FROM trabajadores where nro_documento = trim('{$request->nro_documento}') AND is_deleted = 0 LIMIT 1");
        if ( empty($trabajador) ) {
            $is_ok = 0;
            $mensaje = "[NO_REGISTRADO] Trabajador no registrado!!";
            $alert = "warning";
            $http_code = 404;
        } else {
        	$trabajador = (object)$trabajador[0];
            
            $ultima_asistencia = $adb->pquery("SELECT * FROM asistencias WHERE nro_documento = trim('{$request->nro_documento}') AND is_ok IN ('1','2') ORDER BY fecha_hora DESC LIMIT 1");
            if ( !empty($ultima_asistencia) ) { $ultima_asistencia = (object) $ultima_asistencia[0]; }
            $valida_asistencia = Funciones::validaAsistencia($trabajador, $fecha_hora, $nro_dia, $in_out, $ultima_asistencia);
            // return response()->json(["response" => $valida_asistencia]);
            $is_ok = $valida_asistencia[0];
            $mensaje = $valida_asistencia[1];
        }


        $obj = new DBConnect('asistencias');
        $obj->fecha_hora = $fecha_hora;
        $obj->nro_dia = $nro_dia;
        $obj->nro_documento = !empty($request->nro_documento)? $request->nro_documento:'';
        $obj->lat_lng = !empty($request->lat_lng)? $request->lat_lng:'';
        $obj->is_ok = $is_ok;
        $obj->mensaje = $mensaje;
        $obj->dispositivo_identificador = !empty($request->dispositivo_identificador)? $request->dispositivo_identificador:'';
        $obj->dispositivo_uuid = !empty($request->dispositivo_uuid)? $request->dispositivo_uuid:'';
        $obj->in_out = $in_out;
        $val = $obj->save();
        // var_dump($obj);die();
        if ( $is_ok == 0 ) {
            $alert = "error";
            // $http_code = 403; // acceso denegado
            $http_code = 200;
            // $record_id = $obj->id;
        } else {
            if ( $val !== true ) {
                $is_ok = 0;
                $mensaje = "Ocurrió un error!!";
                $alert = "error";
                $http_code = 500;
            } else {
                $record_id = $obj->id;
            }
            
        }
        
        $response = [
            'alert' => $alert,
            'is_ok' => $is_ok,
            'message' => $mensaje,
            'record_id' => $record_id,
            'model' => 'Asistencia',
        ];
		$this->result = $response;
	}

	public function delete() {
		$this->result = ['message' => 'Sin implementar DELETE'];
	}

	//--------------------------- funciones personalizadas -----------------------------------------------------


	
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