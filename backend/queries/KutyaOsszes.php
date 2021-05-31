<?php
//?query=kutyaOsszes

namespace queries;  

class KutyaOsszes extends \queries\ParentTabla {
    public function __construct($params){
        parent::__construct($params);
        $this->title = "Kutyanapló";
        $this->sql = "SELECT * FROM kutyanaplo kn
                            INNER JOIN kutyak k on k.kutyaId = kn.kutyaId
                            INNER JOIN fajtak f on k.fajtaId = f.fajtaId";
        $this->columns = [
            "kutyaNaploId" => "id",
            "kutyaId" => "Kutya",
            "datum" => "Dátum",
            "esemenyId" => "Esemény"
            "kutyaId" => "KutyaId",
            "nev" => "Nev",
            "fajtaId" => "Fajta",
            "szuletes" => "Szuletes"
            "suly" => "Suly",
            "magassag" => "Magassag",
            "foto" => "Foto",
            "ertek" => "Ertek"
        ];

    }
}
