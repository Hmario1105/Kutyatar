<?php
//POST
/*
    query=kutyaNaploUpdate
    kutyaNaploId=1
    kutyaId=2
    datum=2017.05.03
    esemenyId=2

*/

namespace queries;

class KutyaNaploUpdate extends ParentUpdate{

    public function __construct($params){
        parent::__construct($params);
        $this->title = "Kutyanapló update";
        $this->sql = "UPDATE kutyanaplo SET 
                     kutyaId=?, datum=?, esemenyId=?
                    WHERE kutyaNaploId = ?";
        $this->typesString = "isii";
        $this->paramVariables = [
            $params["kutyaId"],
            $params["datum"],
            $params["esemenyId"],
            $params["kutyaNaploId"],
        ];
        $this->columns = [];

    }
}