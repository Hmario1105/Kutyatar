<?php
//?query=kutyanaploTabla

namespace queries;

class KutyanaploTabla extends \queries\ParentTabla {
    public function __construct($params){
        parent::__construct($params);
        $this->title = "Kutyanapló";
        $this->sql = "SELECT * FROM kutyanaplo";
        $this->columns = [
            "kutyaNaploId" => "id",
            "kutyaId" => "Kutya",
            "datum" => "Dátum",
            "esemeny" => "Esemény"
        ];

    }
}
