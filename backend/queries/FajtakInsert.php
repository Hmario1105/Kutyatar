<?php
//POST
/*
    query=fajtakInsert
    rendszam=ABC111
    tipus=Ford Kb
    evjarat=2003
    szin=Pink
*/
namespace queries;

class FajtakInsert extends \queries\ParentInsert {

    public function __construct($params){
        parent::__construct($params);
        $this->title = "Fajták hozzáfűzése";
        $this->sql = "INSERT INTO fajtak (fajta,fajtaLeiras,gondozas) VALUE(?,?,?)";
        $this->typesString = "sss";
        $this->paramVariables = [
            $params["fajta"],
            $params["fajtaLeiras"],
            $params["gondozas"]
        ];
    }
}