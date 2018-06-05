<?php
class HttpHelper {

	public static function requestHelper() {
		unset($_REQUEST['controller']);
		unset($_REQUEST['_']);

		if ($_SERVER['REQUEST_METHOD'] == 'GET' || $_SERVER['REQUEST_METHOD'] == 'POST') {
			if (strpos($_SERVER["REQUEST_URI"], "?")) {
				list($base, $params) = explode("?", $_SERVER["REQUEST_URI"]);
				$params .= "&";
				do {
					$key = substr($params, 0, strpos($params, "="));
					$params = substr($params, strpos($params, "=") + 1);
					$val = substr($params, 0, strpos($params, "&"));
					$params = substr($params, strpos($params, "&") + 1);
					$arr_params[$key] = $val;
				}while (strpos($params, "&"));
				$_REQUEST = $arr_params;
			}
		}

		$input = file_get_contents("php://input");
		$arr_json = ["[","{"];
		if (!empty($input) && in_array(substr(trim($input), 0,1), $arr_json))
		{
			$params = json_decode($input, true);
			foreach ($params as $key => $value) {
				$_REQUEST[$key] = $value;
			}
		}
		global $request;
		$request = HttpRequest::setData($_REQUEST);
		// die(var_dump($_REQUEST));
	}
	
}

class HttpRequest {
	function __construct(){}
	public static function setData($arr) {
		$request = new self;
		foreach ($arr as $key => $value) {
			$request->{$key} = $value;
		}
		return $request;
	}
}