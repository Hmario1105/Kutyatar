<?php
//POST
/*
    ?query=kutyanaploDelete
    &
    kutyaNaploId=5
*/

namespace queries;

class KutyanaploDelete extends \queries\ParentDelete{

    public function __construct($params){
        parent::__construct($params);
        $this->title = "Kutyanapló törlése";
        $this->sql = "DELETE FROM kutyanaplo
                        WHERE kutyaNaploId = ?";
        $this->typesString = "i";
        $this->paramVariables = [$params["kutyaNaploId"]];
        $this->columns = [];
    }
}