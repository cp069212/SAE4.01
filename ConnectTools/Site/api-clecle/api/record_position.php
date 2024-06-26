<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../class/position_history.php';

$database = new Database();
$db = $database->getConnection();

$position_history = new PositionHistory($db);

$data = json_decode(file_get_contents("php://input"));

if(
    !empty($data->object_id) &&
    !empty($data->position)
){
    $position_history->object_id = $data->object_id;
    $position_history->position = $data->position;
    
    if($position_history->record()){
        http_response_code(201);
        echo json_encode(array("message" => "Position was recorded."));
    }
    else{
        http_response_code(503);
        echo json_encode(array("message" => "Unable to record position."));
    }
}
else{
    http_response_code(400);
    echo json_encode(array("message" => "Unable to record position. Data is incomplete."));
}
?>
