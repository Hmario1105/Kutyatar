<?php
//POST
/*
    query=kutyanaploInsert
    rendszam=ABC111
    tipus=Ford Kb
    evjarat=2003
    szin=Pink
*/
namespace queries;

class KutyanaploInsert extends \queries\ParentInsert {

    public function __construct($params){
        parent::__construct($params);
        $this->title = "Kutyanapló hozzáfűzése";
        $this->sql = "INSERT INTO kutyanaplo(kutyaId,datum,esemenyId) VALUE(?,?,?);";
        $this->typesString = "isi";
        $this->paramVariables = [
            $params["kutyaId"],
            $params["datum"],
            $params["esemenyId"]
        ];
    }
}