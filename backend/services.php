<?php
return [
    "kutyanaploTabla" => function ($params){
        (new \queries\KutyanaploTabla($params))->render();
    },
    "kutyanaploDelete" => function ($params){
        (new \queries\KutyanaploDelete($params))->render();
    },
    "kutyaNaploUpdate" => function ($params){
        (new \queries\KutyaNaploUpdate($params))->render();
    },
    "kutyanaploRekordById" => function ($params){
        (new \queries\KutyanaploRekordById($params))->render();
    },
    "kutyaOsszes" => function ($params){
        (new \queries\KutyaOsszes($params))->render();
    },
    "kutyaCount" => function ($params){
        (new \queries\KutyaCount($params))->render();
    },
    "kutyaErtek" => function ($params){
        (new \queries\KutyaErtek($params))->render();
    },
    "kutyaAdatlap" => function ($params){
        (new \queries\KutyaAdatlap($params))->render();
    },
    "kutyakTabla" => function ($params){
        (new \queries\KutyakTabla($params))->render();
    },
    "kutyakDelete" => function ($params){
        (new \queries\KutyakDelete($params))->render();
    },
    "kutyakRekordById" => function ($params){
        (new \queries\KutyakRekordById($params))->render();
    },
    "kutyakUpdate" => function ($params){
        (new \queries\KutyakUpdate($params))->render();
    },
    "fajtakTabla" => function ($params){
        (new \queries\FajtakTabla($params))->render();
    },
    "fajtakDelete" => function ($params){
        (new \queries\FajtakDelete($params))->render();
    },
    "fajtakRekordById" => function ($params){
        (new \queries\FajtakRekordById($params))->render();
    },
    "fajtakUpdate" => function ($params){
        (new \queries\FajtakUpdate($params))->render();
    },
    "esemenyekTabla" => function ($params){
        (new \queries\EsemenyekTabla($params))->render();
    },
    "esemenyekDelete" => function ($params){
        (new \queries\EsemenyekDelete($params))->render();
    },
    "esemenyekRekordById" => function ($params){
        (new \queries\EsemenyekRekordById($params))->render();
    },
    "esemenyekUpdate" => function ($params){
        (new \queries\EsemenyekUpdate($params))->render();
    },
    "kutyakInsert" => function ($params){
        (new \queries\KutyakInsert($params))->render();
    },
    "kutyanaploInsert" => function ($params){
        (new \queries\KutyanaploInsert($params))->render();
    },
    "esemenyekInsert" => function ($params){
        (new \queries\EsemenyekInsert($params))->render();
    },
    "fajtakInsert" => function ($params){
        (new \queries\FajtakInsert($params))->render();
    },
    "oltasokTabla" => function ($params){
        (new \queries\OltasokTabla($params))->render();
    },
    "oltasokDelete" => function ($params){
        (new \queries\OltasokDelete($params))->render();
    },
    "oltasokInsert" => function ($params){
        (new \queries\OltasokInsert($params))->render();
    },
    "oltasokRekordById" => function ($params){
        (new \queries\OltasokRekordById($params))->render();
    },
    "oltasokUpdate" => function ($params){
        (new \queries\OltasokUpdate($params))->render();
    },
    "kutyaoltasokTabla" => function ($params){
        (new \queries\KutyaoltasokTabla($params))->render();
    },
    "kutyaoltasokDelete" => function ($params){
        (new \queries\KutyaoltasokDelete($params))->render();
    },
    "kutyaoltasokInsert" => function ($params){
        (new \queries\KutyaoltasokInsert($params))->render();
    },
    "kutyaoltasokRekordById" => function ($params){
        (new \queries\KutyaoltasokRekordById($params))->render();
    },
    "kutyaoltasokUpdate" => function ($params){
        (new \queries\KutyaoltasokUpdate($params))->render();
    },
    "fajtakereses" => function ($params){
        (new \queries\Fajtakereses($params))->render();
    },
    "kutyakereses" => function ($params){
        (new \queries\Kutyakereses($params))->render();
    },



    // Ezek kellenek
    "paramsError" => function ($params){
        (new \core\ParamsError($params))->render();
    },

    "loginUser" => function ($params){
        (new \queries\LoginUser($params))->login();
    },
    "logoutUser" => function ($params){
        (new \queries\LogoutUser($params))->logout();
    },
    "getUser" => function ($params){
        (new \queries\GetUser($params))->getUser();
    }
];