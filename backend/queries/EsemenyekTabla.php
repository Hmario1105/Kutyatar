<?php
//?query=esemenyekTabla

namespace queries;

class EsemenyekTabla extends \queries\ParentTabla {
    public function __construct($params){
        parent::__construct($params);
        $this->title = "Események";
        $this->sql = "SELECT * FROM esemenyek";
        $this->columns = [
            "esemenyId" => "EsemenyId",
            "esemeny" => "Esemeny"
        ];

    }
}
