<?php
//?query=kutyaAdatlap&kutyaId=1

namespace queries;

class KutyaAdatlap extends \queries\ParentRekordById {

    public function __construct($params){
        parent::__construct($params);
        $this->title = "Kutyanapló";
        $this->sql = "SELECT kn.kutyaNaploId,k.nev ,kn.datum,e.esemeny FROM kutyanaplo kn
                            INNER JOIN kutyak k on k.kutyaId = kn.kutyaId
                            INNER JOIN esemenyek e on e.esemenyId = kn.esemenyId
                            WHERE k.kutyaId = ?;";
        $this->typesString = "i";
        $this->paramVariables = [$params["kutyaId"]];
        $this->columns = [
            "kutyaNaploId" => "id",
            "nev" => "Nev",
            "datum" => "Dátum",
            "esemeny" => "Esemény"
        ];

    }
}
