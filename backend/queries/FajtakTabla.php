<?php
//?query=fajtakTabla

namespace queries;

class FajtakTabla extends \queries\ParentTabla {
    public function __construct($params){
        parent::__construct($params);
        $this->title = "Fajták";
        $this->sql = "SELECT * FROM fajtak";
        $this->columns = [
            "fajtaId" => "FajtaId",
            "fajta" => "Fajta",
            "fajtaLeiras" => "FajtaLeiras",
            "gondozas" => "Gondozas",
            "fajtaFoto" => "FajtaFoto"
        ];

    }
}
