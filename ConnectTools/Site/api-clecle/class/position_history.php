<?php
class PositionHistory{
    private $conn;
    private $table_name = "position_history";

    public $id;
    public $object_id;
    public $x;
    public $y;
    public $plan;
    public $timestamp;

    public function __construct($db){
        $this->conn = $db;
    }

    function record(){
        $query = "INSERT INTO " . $this->table_name . " SET object_id=:object_id, position=:position";

        $stmt = $this->conn->prepare($query);

        $this->object_id=htmlspecialchars(strip_tags($this->object_id));
        $this->position=htmlspecialchars(strip_tags($this->position));

        $stmt->bindParam(":object_id", $this->object_id);
        $stmt->bindParam(":position", $this->position);

        if($stmt->execute()){
            return true;
        }
        return false;
    }

    function read(){
        $query = "SELECT * FROM " . $this->table_name . " WHERE object_id = ? ORDER BY timestamp DESC";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(1, $this->object_id);

        $stmt->execute();

        return $stmt;
    }
}
?>
