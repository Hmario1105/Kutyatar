<?php
//?query=kutyanaploRekordById&kutyaNaploId=1

namespace queries;

class KutyanaploRekordById extends \queries\ParentRekordById {

    public function __construct($params){
        parent::__construct($params);
        $this->title = "Kutyanapló";
        $this->sql = "SELECT * FROM kutyanaplo WHERE kutyaNaploId = ?";
        $this->typesString = "i";
        $this->paramVariables = [$params["kutyaNaploId"]];
        $this->columns = [
            "kutyaNaploId" => "id",
            "kutyaId" => "Kutya",
            "datum" => "Dátum",
            "esemenyId" => "Esemény"
        ];

    }
}
