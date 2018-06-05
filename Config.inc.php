<?php
/**
 * Este archivo contiene las variables de configuracion de la aplicacion
 * @author Henry Cumbicus <hcumbicusr@gmail.com>
 * @package 
 * @subpackage 
*/
header('Content-Type: application/json; charset=UTF-8');

/**
 * @var charset
 */
$config['charset']= 'UTF-8';
/**
 * @var language
 */
$config['lang']= 'es-ES';

/**
 * @var entorno : D-> Desarrollo; P-> Produccion
 */
$config['entorno']= 'D';

if ($config['entorno'] == 'D')
{
    ini_set("display_errors", true);
    error_reporting(E_ALL);
}elseif($config['entorno'] == 'P')
{
    ini_set("display_errors", false);
    error_reporting(0);
}

//Configuracion de la fecha segun la region
date_default_timezone_set('America/Lima');
setlocale(LC_ALL,"es_ES");

/**
*@var name
*/
$config['titleApp']="fw_api";
/**
*@var version
*/
$config['version']="v1";
/**
*@var name
*/
$config['nameApp']="fw_api";
/**
 * @var email developer
 */
$config['emailDeveloper']="hcumbicusr@gmail.com";
/**
 * @var emails group developers
 */
$config['teamDeveloper'] = array(
    "hcumbicusr" => "hcumbicusr"
);
/**
 * @var host ruta completa
 */
$config['host']="http://localhost:82/{$config['nameApp']}/";
/**
 * @var path ruta raiz directorio
 */
$config['path']="C:\wamp\www\fw_api/";

if ($config['entorno'] == 'D')
{
    /**
    * @var accessBD n1 default
    */
   $config['accessBD'] = array(
       "host" => "localhost",
       "port" => "3306",
       "db" => "asistencias",
       "user" => "root",
       "pass" => ""
   );
   
}elseif($config['entorno'] == 'P')
{
    /**
    * @var accessBD n1
    */
   $config['accessBD'] = array(
       "host" => "localhost",
       "port" => "3306",
       "db" => "",
       "user" => "",
       "pass" => ""
   );
   
}

/**
 * @var management
 */
$config['managerDataBase']="mysqli";

/**
 * @var sessionTime in seg
 */
$config['sessionTime']= 2400;

/**
 * @var auditable = true : registra todas las transacciones sql en una tabla auditoria en la bd 
 * @var auditable = false:  obvia el registro de transacciones sql
 */
$config['auditable']= false;
$config['audit_table']= "sys_logs";

/**
 * Requiere del archivo db.php para funcionar
 */

require_once 'core/Database.php';
/**
 * Requiere del archivo config.php para funcionar
 */
require_once 'core/ClassConfig.php';