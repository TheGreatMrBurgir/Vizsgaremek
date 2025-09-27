<template>
  <div class="legal-page container py-5">
    <div class="legal-card p-4 shadow-sm">
      <h1 class="text-center mb-4">Adatkezelési tájékoztató</h1>

      <section class="mb-4">
        <h2>1. Milyen adatokat gyűjtünk?</h2>
        <p>Regisztrációkor megadott adatokat (pl. név, felhasználónév, jelszó, e-mail cím).</p>
      </section>

      <section class="mb-4">
        <h2>2. Milyen célból használjuk?</h2>
        <p>Az adatok kizárólag a rendszer működtetéséhez, adományozási lehetőségek biztosításához, és felhasználói azonosításhoz szükségesek.</p>
      </section>

      <section class="mb-4">
        <h2>3. Adattárolás időtartama</h2>
        <p>Amíg a felhasználói fiók aktív, illetve jogszabályi kötelezettség fennáll.</p>
      </section>

      <section class="mb-4">
        <h2>4. Ki fér hozzá az adatokhoz?</h2>
        <p>Az üzemeltető adminisztrátorai, valamint kizárólag törvényes esetekben hatóságok.</p>
      </section>

      <section class="mb-4">
        <h2>5. Jogok és lehetőségek</h2>
        <p>A felhasználó kérheti adatai törlését vagy módosítását a kapcsolat oldalon keresztül.</p>
      </section>
    </div>
  </div>
</template>

<script>
export default {
  name: 'PrivacyPolicyView'
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
