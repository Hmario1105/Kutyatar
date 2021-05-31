<?php
//?query=fajtakereses&search="tr"

namespace queries;

class Fajtakereses extends \queries\ParentRekordById {

    public function  __construct($params){
        parent:: __construct($params);
        $this->title = "Fajtakereses";
        $this->sql = " SELECT * FROM fajtak f
                            WHERE f.fajta LIKE ?;";
        $this->typesString = "s";
        $this->paramVariables = [
            '%'. $params["search"] .'%',
            ];
        $this->columns = [
            "fajtaId" => "FajtaId",
            "fajta" => "Fajta",
            "fajtaLeiras" => "FajtaLeiras",
            "gondozas" => "Gondozas",
            "fajtaFoto" => "FajtaFoto",
            "kutyaId" => "kutyaId",
            "nev" => "Nev",
            "fajtaId" => "FajtaId",
            "fajta" => "Fajta",
            "oltasId" => "OltasId",
            "oltasneve" => "Oltasneve",
            "szuletes" => "Szuletes",
            "suly" => "Suly",
            "magassag" => "Magassag",
            "foto" => "Foto",
            "ertek" => "Ertek"
        ];
    }

}