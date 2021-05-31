<?php
//POST
/*
    query=kutyaoltasokInsert
    oltasId=1
    kutyaId=4
*/
namespace queries;

class KutyaoltasokInsert extends \queries\ParentInsert {

    public function __construct($params){
        parent::__construct($params);
        $this->title = "Kutyaoltasok hozzáfűzése";
        $this->sql = "    INSERT INTO kutyakoltasok(kutyaId,oltasId) VALUE(?,?);";
        $this->typesString = "ii";
        $this->paramVariables = [
            $params["kutyaId"],
            $params["oltasId"]
        ];
    }
}