<template>
  <div class="container">
    <div class="w3-text-theme p-5">
      <h1 style="color: black">Üdvözzölek az oldalon!</h1>
      <p style="color: black" id="szoveg">
        Én Márió vagyok, és sok állatot szeretek, de legfőképpen a kutyákat és ezért is készítettem el ezt az oldalt.<br>
        Az oldal célja minél többet megtudni a kutyákról és a fajtákról,hogy aki szeretne kutyát az minden információt megtudjon róluk. <br>
        Az oldalon alapvetően lehet kutyákat és kutya fajtákat nézegetni illetve érdekes és fontos információkat
        megtudni a kutyákról és a fajtájukról, bejelentkezés nélkül. <br />
        Ha bevagy jelentkezve akkor táblákat is tudsz szerkeszteni,hozzáadni,törölni például:
        hozzátudsz adni kutyákat, a naplójukba eseményeket,dátumokat tudsz szerkeszteni, az oltásokhoz akár mégtöbb oltást tudsz
        hozzáadni, vagy fajtákhoz tudsz érdekes leírásokat hozzátenni, esetleg törölni is tudsz sorokat a különböző táblákba. <br />
        Bejelentkezéshez regisztráció szükséges amit jelenleg úgy lehet
        meegoldani, hogy írsz egy kérő e-mailt nekem a <strong>mario@gmail.com</strong>-ra én pedig,
        felveszlek az adatbázisba azon az e-mail címen amin írtál, és adok neked
        egy jelszót is, amit visszaigazoló emailbe fogsz megkapni tőlem.
      </p>
    </div>
    <div class="kep">
      <img src="../../assets/kep/welcome.jpg" alt="" class="img-fluid">
    </div>
  </div>
</template>

<script>
export default {
  name: "Home",
};
</script>

<style>
#szoveg {
  text-align: justify;
}
h1 {
  text-align: center;
}
.kep {
  /* background-image: url("../../assets/kep/welcome.jpg"); */
  max-width: 800px;
  margin: auto auto;
}
</style>