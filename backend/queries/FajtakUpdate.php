<?php
//POST
/*
    query=fajtakUpdate
    fajtaId=2
    fajta=puli
    fajtaLeiras=vmi
    gondozas=vmik

*/

namespace queries;

class FajtakUpdate extends ParentUpdate{

    public function __construct($params){
        parent::__construct($params);
        $this->title = "Fajták update";
        $this->sql = "UPDATE fajtak SET fajta = ?, fajtaLeiras = ?, gondozas = ? WHERE fajtaId = ?;";
        $this->typesString = "sssi";
        $this->paramVariables = [
            $params["fajta"],
            $params["fajtaLeiras"],
            $params["gondozas"],
            $params["fajtaId"]
        ];
        $this->columns = [];

    }
}