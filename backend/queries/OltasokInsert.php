<?php
//POST
/*
    query=oltasokInsert
    oltasId=1
    oltasneve=vmi
*/
namespace queries;

class OltasokInsert extends \queries\ParentInsert {

    public function __construct($params){
        parent::__construct($params);
        $this->title = "Oltások hozzáfűzése";
        $this->sql = "  INSERT INTO oltasok(oltasneve) VALUE(?);";
        $this->typesString = "s";
        $this->paramVariables = [
            $params["oltasneve"]
        ];
    }
}