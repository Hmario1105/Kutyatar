<?php
//?query=oltasokTabla

namespace queries;

class OltasokTabla extends \queries\ParentTabla {
    public function __construct($params){
        parent::__construct($params);
        $this->title = "Oltások";
        $this->sql = "SELECT * FROM oltasok";
        $this->columns = [
            "oltasId" => "OltasId",
            "oltasneve" => "Oltasneve"
        ];

    }
}
