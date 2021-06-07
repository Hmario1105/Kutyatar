//1. a routes komponensek
import Home from "../components/routes/Home.vue";
import Kutyanaplo from "../components/routes/Kutyanaplo.vue";
import Esemenyek from "../components/routes/Esemenyek.vue";
import Kutyak from "../components/routes/Kutyak.vue";
import Fajtak from "../components/routes/Fajtak.vue";
import KutyaCard from "../components/routes/KutyaCard.vue";
import FajtakCard from "../components/routes/FajtakCard.vue";
import Oltasok from "../components/routes/Oltasok.vue";
import Login from "../components/routes/Login.vue";


//2. route - komponenes hozzárendelés
const routes = [
    {
        name: "home",
        path: "/",
        component: Home,
        meta: { requiresAuth: false }
    },
    {
        name: "Kutyanaplo",
        path: "/Kutyanaplo/Kutyanaplo/",
        component: Kutyanaplo,
        meta: { requiresAuth: true }
    },
    {
        name: "Esemenyek",
        path: "/Kutyanaplo/Esemenyek/",
        component: Esemenyek,
        meta: { requiresAuth: true }
    },
    {
        name: "Kutyak",
        path: "/Kutyanaplo/Kutyak/",
        component: Kutyak,
        meta: { requiresAuth: true }
    },
    {
        name: "Fajtak",
        path: "/Kutyanaplo/Fajtak/",
        component: Fajtak,
        meta: { requiresAuth: true }
    },
    {
        name: "KutyaCard",
        path: "/KutyaCard/",
        component: KutyaCard,
        meta: { requiresAuth: false }
    },
    {
        name: "FajtakCard",
        path: "/FajtakCard/",
        component: FajtakCard,
        meta: { requiresAuth: false }
    },
    {
        name: "Oltasok",
        path: "/Kutyanaplo/Oltasok/",
        component: Oltasok,
        meta: { requiresAuth: true }
    },
    {
        name: "Login",
        path: "/Login",
        component: Login,
        meta: { requiresAuth: false }
    }

];

//3. Export, hogy kívülről elérhető legyen
export default routes;