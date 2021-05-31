<?php
//POST
/*
    query=kutyakInsert
    rendszam=ABC111
    tipus=Ford Kb
    evjarat=2003
    szin=Pink
*/
namespace queries;

class KutyakInsert extends \queries\ParentInsert {

    public function __construct($params){
        parent::__construct($params);
        $this->title = "Kutya hozzáfűzése";
        $this->sql = "INSERT INTO kutyak(nev,fajtaId,szuletes,suly,magassag,foto,ertek) VALUE(?,?,?,?,?,?,?);";
        $this->typesString = "sisiisi";
        $this->paramVariables = [
            $params["nev"],
            $params["fajtaId"],
            $params["szuletes"],
            $params["suly"],
            $params["szmagassagin"],
            $params["foto"],
            $params["ertek"]
        ];
    }
}