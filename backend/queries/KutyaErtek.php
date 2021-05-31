<?php
//?query=kutyaErtek

namespace queries;  

class KutyaErtek extends \queries\ParentTabla {
    public function __construct($params){
        parent::__construct($params);
        $this->title = "Kutyanapló";
        $this->sql = "SELECT SUM(kutyak.ertek) AS Sum FROM kutyak;";
        $this->columns = [
            "Sum" => "sum"
        ];

    }
}
