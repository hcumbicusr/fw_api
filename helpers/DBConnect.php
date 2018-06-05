<?php
class DBConnect {
	public static function initialize(){
		global $adb;
		//-------------- conexion a BD
		$class = new Database();
		$adb = $class->selectManager();
		return $adb;
	}
	public static function finalize(){
		global $adb;
		$adb->close();
		$adb = null;
	}

	function __construct($table = null){
		$this->table = $table;
	}

	function save($pk = 'id') {
		global $adb;
		// var_dump($adb->getConnection());die();
		$insert = "INSERT INTO {$this->table} ";
		$fields = "";
		$f = [];
		$v = [];
		$w = [];
		foreach (get_object_vars($this) as $key => $value) {
			if ($key != 'table') {
				$f[] = "`$key`";
				$value = (!is_numeric($value) && empty($value))? 'NULL' : "'$value'";
				$v[] = $value;
				$w[] = ($value=='NULL')?"`$key` IS NULL":"`$key`=$value";
			}
		}
		if ( !empty($f) ) {
			$fields .= "(". implode(",", $f) .") ";
		}
		$values = "";
		if ( !empty($v) ) {
			$values .= "(". implode(",", $v) .") ";
		}
		$insert .= $fields . " VALUES ". $values;
		// echo json_encode($insert);
		$val = $adb->pquery($insert);
		// echo json_encode($adb);
		// die();
		if ( $val === true ) {
			// $id = $adb->insert_id;
			$where = implode(" AND ", $w);
			// echo "SELECT * FROM {$this->table} WHERE $where";
			$row = $adb->pquery("SELECT * FROM {$this->table} WHERE $where");
			// var_dump($row);die();
			if ( !empty($row) ) {
				// $row = (object) $row[0];
				foreach ($row[0] as $key => $value) {
					$this->{$key} = $value;
				}
			}
			return true;
		}
		return false;
	}
}

DBConnect::initialize();