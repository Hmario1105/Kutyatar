<?php
//POST
/*
    ?query=fajtakDelete
    &
    fajtaId=5
*/

namespace queries;

class FajtakDelete extends \queries\ParentDelete{

    public function __construct($params){
        parent::__construct($params);
        $this->title = "Fajták törlése";
        $this->sql = "DELETE FROM fajtak
                        WHERE fajtaId = ?";
        $this->typesString = "i";
        $this->paramVariables = [$params["fajtaId"]];
        $this->columns = [];
    }
}