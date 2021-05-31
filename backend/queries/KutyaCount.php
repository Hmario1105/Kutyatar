<?php
//?query=kutyaCount

namespace queries;  

class KutyaCount extends \queries\ParentTabla {
    public function __construct($params){
        parent::__construct($params);
        $this->title = "Kutyanapló";
        $this->sql = "SELECT COUNT(*) AS Count FROM kutyak;";
        $this->columns = [
            "Count" => "count"
        ];

    }
}
