<?php
//?query=kutyaoltasokTabla

namespace queries;

class KutyaoltasokTabla extends \queries\ParentTabla {
    public function __construct($params){
        parent::__construct($params);
        $this->title = "Kutyaoltasok";
        $this->sql = "SELECT * FROM kutyaoltasok";
        $this->columns = [
            "kutyaId" => "KutyaId",
            "oltasId" => "OltasId"
        ];

    }
}
