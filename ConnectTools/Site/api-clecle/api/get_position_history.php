<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../config/database.php';
include_once '../class/position_history.php';

$database = new Database();
$db = $database->getConnection();

$position_history = new PositionHistory($db);

$position_history->object_id = isset($_GET['object_id']) ? $_GET['object_id'] : die();

$stmt = $position_history->read();
$num = $stmt->rowCount();

if($num > 0){
    $position_history_arr=array();
    $position_history_arr["records"]=array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        extract($row);

        $position_history_item=array(
            "id" => $id,
            "object_id" => $object_id,
            "position" => $position,
            "timestamp" => $timestamp
        );

        array_push($position_history_arr["records"], $position_history_item);
    }

    http_response_code(200);
    echo json_encode($position_history_arr);
}
else{
    http_response_code(404);
    echo json_encode(
        array("message" => "No position history found.")
    );
}
?>
