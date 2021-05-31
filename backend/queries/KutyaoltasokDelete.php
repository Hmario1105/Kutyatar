<?php
//POST
/*
    ?query=kutyaoltasokDelete
    &
    kutyaId=5
*/

namespace queries;

class KutyaoltasokDelete extends \queries\ParentDelete{

    public function __construct($params){
        parent::__construct($params);
        $this->title = "Kutyaoltasok törlése";
        $this->sql = "    DELETE FROM kutyakoltasok WHERE kutyaId = ? AND oltasId = ?;";
        $this->typesString = "i";
        $this->paramVariables = [$params["oltasId"], $params["kutyaId"]];
        $this->columns = [];
    }
}