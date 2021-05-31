<?php
//?query=kutyaoltasokRekordById&oltasId=1

namespace queries;

class KutyaoltasokRekordById extends \queries\ParentRekordById {

    public function __construct($params){
        parent::__construct($params);
        $this->title = "Kutyaoltasok";
        $this->sql = "SELECT * FROM kutyaoltasok WHERE oltasId = ? and kutyaId = ?";
        $this->typesString = "i";
        $this->paramVariables = [$params["oltasId"], $params["kutyaId"]];
        $this->columns = [
            "oltasId" => "OltasId",
            "kutyaId" => "KutyaId"
        ];

    }
}
