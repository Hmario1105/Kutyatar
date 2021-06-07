<?php
//POST
/*
    query=esemenyekUpdate
    esemenyId=2
    esemeny=oltás

*/

namespace queries;

class EsemenyekUpdate extends ParentUpdate{

    public function __construct($params){
        parent::__construct($params);
        $this->title = "Események update";
        $this->sql = "UPDATE esemenyek SET esemeny = ? WHERE esemenyId = ?;";
        $this->typesString = "si";
        $this->paramVariables = [
            $params["esemeny"],
            $params["esemenyId"]
        ];
        $this->columns = [];

    }
}