<?php
//?query=kutyakTabla

namespace queries;

class KutyakTabla extends \queries\ParentTabla {
    public function __construct($params){
        parent::__construct($params);
        $this->title = "Kutyák";
        $this->sql = "  SELECT k.kutyaId,k.nev, f.fajta,o.oltasneve, k.szuletes,k.suly,k.magassag, k.foto,k.ertek FROM kutyak k
        INNER JOIN fajtak f on f.fajtaId = k.fajtaId
        INNER JOIN kutyakoltasok ko on ko.kutyaId = k.kutyaId
        INNER JOIN oltasok o on o.oltasId = ko.oltasId";
        $this->columns = [
            "kutyaId" => "kutyaId",
            "nev" => "Nev",
            "fajta" => "Fajta",
            "oltasneve" => "Oltasneve",
            "szuletes" => "Szuletes",
            "suly" => "Suly",
            "magassag" => "Magassag",
            "foto" => "Foto",
            "ertek" => "Ertek"
        ];

    }
}
