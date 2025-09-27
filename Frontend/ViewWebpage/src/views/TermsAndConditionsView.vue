<template>
  <div class="legal-page container py-5">
    <div class="legal-card p-4 shadow-sm">
      <h1 class="text-center mb-4">Felhasználási feltételek</h1>

      <section class="mb-4">
        <h2>1. Az oldal célja</h2>
        <p>Az oldal lehetőséget biztosít adományozásra gyermekruházati termékek támogatására.</p>
      </section>

      <section class="mb-4">
        <h2>2. Regisztráció és fiókhasználat</h2>
        <p>Csak valós adatokkal történő regisztráció engedélyezett. A fiók használata során tilos a rendszer szándékos zavarása.</p>
      </section>

      <section class="mb-4">
        <h2>3. Felelősség</h2>
        <p>Az üzemeltető mindent megtesz az adatok biztonságáért, de technikai hibák esetén nem vállal teljes felelősséget a szolgáltatás zavartalanságáért.</p>
      </section>

      <section class="mb-4">
        <h2>4. Adományozás folyamata</h2>
        <p>A támogatások önkéntesek, nem visszatéríthetők. Az összegek a gyerekek számára kijelölt termékekre kerülnek felhasználásra.</p>
      </section>

      <section class="mb-4">
        <h2>5. Módosítások</h2>
        <p>Az üzemeltető fenntartja a jogot a feltételek frissítésére. Az aktuális változat mindig ezen az oldalon elérhető.</p>
      </section>
    </div>
  </div>
</template>

<script>
export default {
  name: 'TermsAndConditionsView'
}
</script>

<style scoped>
.legal-card {
  max-width: 900px;
  margin: 0 auto;
  background-color: #f9fbfb;
  border-left: 6px solid #007f7f;
  border-radius: 8px;
}

.legal-card h1 {
  color: #007f7f;
  font-size: 2rem;
  border-bottom: 2px solid #d0eaea;
  padding-bottom: 0.5rem;
}

.legal-card h2 {
  color: #005c5c;
  font-size: 1.2rem;
  margin-top: 1.5rem;
  text-decoration: underline;
}

.legal-card p {
  font-size: 1rem;
  line-height: 1.6;
  color: #333;
}
</style>
