<?php
//POST
/*
    ?query=esemenyekDelete
    &
    esemenyId=5
*/

namespace queries;

class EsemenyekDelete extends \queries\ParentDelete{

    public function __construct($params){
        parent::__construct($params);
        $this->title = "Események törlése";
        $this->sql = "DELETE FROM esemenyek
                        WHERE esemenyId = ?";
        $this->typesString = "i";
        $this->paramVariables = [$params["esemenyId"]];
        $this->columns = [];
    }
}