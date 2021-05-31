<?php
//?query=kutyakRekordById&kutyaId=1

namespace queries;

class KutyakRekordById extends \queries\ParentRekordById {

    public function __construct($params){
        parent::__construct($params);
        $this->title = "Kutyak";
        $this->sql = "SELECT * FROM kutyak WHERE kutyaId = ?";
        $this->typesString = "i";
        $this->paramVariables = [$params["kutyaId"]];
        $this->columns = [
            "kutyaId" => "kutyaId",
            "nev" => "Nev",
            "fajtaId" => "FajtaId",
            "szuletes" => "Szuletes",
            "suly" => "Suly",
            "magassag" => "Magassag",
            "foto" => "Foto",
            "ertek" => "Ertek"
        ];

    }
}
