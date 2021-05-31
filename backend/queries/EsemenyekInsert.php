<?php
//POST
/*
    query=esemenyekInsert
    esemeny=iskola
*/
namespace queries;

class EsemenyekInsert extends \queries\ParentInsert {

    public function __construct($params){
        parent::__construct($params);
        $this->title = "Események hozzáfűzése";
        $this->sql = "INSERT INTO esemenyek(esemeny) VALUE(?);";
        $this->typesString = "s";
        $this->paramVariables = [
            $params["esemeny"]
        ];
    }
}