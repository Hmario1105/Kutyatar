<?php
//?query=fajtakRekordById&fajtaId=1

namespace queries;

class FajtakRekordById extends \queries\ParentRekordById {

    public function __construct($params){
        parent::__construct($params);
        $this->title = "Fajták";
        $this->sql = "SELECT * FROM fajtak WHERE fajtaId = ?";
        $this->typesString = "i";
        $this->paramVariables = [$params["fajtaId"]];
        $this->columns = [
            "fajtaId" => "FajtaId",
            "fajta" => "Fajta",
            "fajtaLeiras" => "FajtaLeiras",
            "gondozas" => "Gondozas"
        ];

    }
}
