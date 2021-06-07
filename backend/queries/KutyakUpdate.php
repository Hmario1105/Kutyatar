<?php
//POST
/*
    query=kutyakUpdate
    kutyaId=2
    datum=peti
    fajtaId=2
    szuletes=2018.08.30.
    suly=56
    magassag=100
    foto=vmi
    ertek=70000

*/

namespace queries;

class KutyakUpdate extends ParentUpdate{

    public function __construct($params){
        parent::__construct($params);
        $this->title = "Kutyak update";
        $this->sql = "UPDATE kutyak SET nev = ?,fajtaId = ?,  szuletes = ?,suly = ?,magassag = ?, foto = ?,ertek = ? WHERE kutyaId = ?;";
        $this->typesString = "siiiisii";
        $this->paramVariables = [
            $params["nev"],
            $params["fajtaId"],
            $params["szuletes"],
            $params["suly"],
            $params["magassag"],
            $params["foto"],
            $params["ertek"],
            $params["kutyaId"]
        ];
        $this->columns = [];
        

    }
}