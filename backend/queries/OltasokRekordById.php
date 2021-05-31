<?php
//?query=oltasokRekordById&oltasId=1

namespace queries;

class OltasokRekordById extends \queries\ParentRekordById {

    public function __construct($params){
        parent::__construct($params);
        $this->title = "Oltások";
        $this->sql = "SELECT * FROM oltasok WHERE oltasId = ?";
        $this->typesString = "i";
        $this->paramVariables = [$params["oltasId"]];
        $this->columns = [
            "oltasId" => "OltasId",
            "oltasneve" => "Oltasneve"
        ];

    }
}
