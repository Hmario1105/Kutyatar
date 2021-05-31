<?php
//POST
/*
    ?query=kutyakDelete
    &
    kutyaId=5
*/

namespace queries;

class KutyakDelete extends \queries\ParentDelete{

    public function __construct($params){
        parent::__construct($params);
        $this->title = "Kutyak törlése";
        $this->sql = "DELETE FROM kutyak
                        WHERE kutyaId = ?";
        $this->typesString = "i";
        $this->paramVariables = [$params["kutyaId"]];
        $this->columns = [];
    }
}