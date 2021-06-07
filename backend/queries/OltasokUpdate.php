<?php
//POST
/*
    query=oltasokUpdate
    oltasId=1
    oltasneve=vmi

*/

namespace queries;

class OltasokUpdate extends ParentUpdate{

    public function __construct($params){
        parent::__construct($params);
        $this->title = "Oltások update";
        $this->sql = "  UPDATE oltasok SET oltasneve = ? WHERE oltasId = ?;";
        $this->typesString = "si";
        $this->paramVariables = [
            $params["oltasneve"],
            $params["oltasId"]
        ];
        $this->columns = [];

    }
}