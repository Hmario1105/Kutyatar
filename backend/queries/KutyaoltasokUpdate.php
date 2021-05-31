<?php
//POST
/*
    query=kutyaoltasokUpdate
    oltasId=1
    kutyaId=12

*/

namespace queries;

class KutyaoltasokUpdate extends ParentUpdate{

    public function __construct($params){
        parent::__construct($params);
        $this->title = "Kutyaoltasok update";
        $this->sql = "    UPDATE kutyakoltasok SET kutyaId = ? AND oltasId = ? WHERE kutyaId = ? AND oltasId = ?;";
        $this->typesString = "ii";
        $this->paramVariables = [
            $params["oltasId"],
            $params["kutyaId"]
        ];
        $this->columns = [];

    }
}