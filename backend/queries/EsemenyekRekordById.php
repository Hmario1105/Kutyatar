<?php
//?query=esemenyekRekordById&esemenyId=1

namespace queries;

class EsemenyekRekordById extends \queries\ParentRekordById {

    public function __construct($params){
        parent::__construct($params);
        $this->title = "Események";
        $this->sql = "SELECT * FROM esemenyek WHERE esemenyId = ?";
        $this->typesString = "i";
        $this->paramVariables = [$params["esemenyId"]];
        $this->columns = [
            "esemenyId" => "EsemenyId",
            "esemeny" => "Esemeny"
        ];

    }
}
