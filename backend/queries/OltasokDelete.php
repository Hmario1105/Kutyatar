<?php
//POST
/*
    ?query=oltasokDelete
    &
    oltasId=5
*/

namespace queries;

class OltasokDelete extends \queries\ParentDelete{

    public function __construct($params){
        parent::__construct($params);
        $this->title = "OLtások törlése";
        $this->sql = "  DELETE FROM oltasok WHERE oltasId = ?;";
        $this->typesString = "i";
        $this->paramVariables = [$params["oltasId"]];
        $this->columns = [];
    }
}