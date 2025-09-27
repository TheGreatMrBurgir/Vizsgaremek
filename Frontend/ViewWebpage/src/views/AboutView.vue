<template>
  <div class="card-page">
    <div class="card-container about">
      <h1>Rólunk</h1>

      <section class="section">
        <h2 @click="toggleAccordion(0)" class="accordion-header">Kik vagyunk?</h2>
        <div v-show="activeAccordion === 0" class="accordion-content">
          <p>
            Három barát vagyunk, akiket két dolog biztosan összeköt: gyerekkorunk óta sportolunk, és ugyanilyen régóta fontos számunkra, hogy segítsünk a nálunk kevésbé szerencséseknek.
          </p>
          <p>
            Kezdetben cipősdoboz-ajándékokkal támogattuk a rászoruló gyerekeket, mára nonprofit csapattá váltunk. A Felszerelés Egyesület célja, hogy közösen, a közösség erejével érjünk el valódi változásokat.       
          </p>
          <p>
            Edzéseink során saját bőrünkön tapasztaltuk, mennyit számít a teljesítményben a megfelelő ruházat – különösen tudatos edzés vagy versenysport esetén. A jó minőségű sportruházat azonban drága, sok család számára megfizethetetlen.
          </p>
          <p>
            A rendszeres mozgás elengedhetetlen a gyermekek fejlődése szempontjából: támogatja az izom- és csontrendszer erősödését, segít megelőzni a tartáshibákat, fenntartani az egészséges testsúlyt.
          </p>
          <p>
            Számunkra természetes, hogy egy sportruha megfelelő méretű, minőségi anyagból készül, támogatja a mozgást, védi a bőrt és segíti a hőszabályozást. Sajnos ez nem mindenkinek alapvetés. Mi ezen szeretnénk változtatni.
          </p>
        </div>
      </section>

      <section class="section">
        <h2 @click="toggleAccordion(1)" class="accordion-header">Tevékenységünk</h2>
        <div v-show="activeAccordion === 1" class="accordion-content">
          <p>
            Ha lenne sok pénzünk, abból támogatnánk a gyerekeket – de nincs. Van viszont energiánk, jó ötleteink, és kiváló partnereink.
          </p>
          <p>
            Kiemelt partnerünk az Igazgyöngy Alapítvány, amely évtizedek óta segíti a kelet-magyarországi, mélyszegénységben élő családokat.<br>
            Az alapítványról bővebben: <a href="https://igazgyongyalapitvany.hu" target="_blank">igazgyongyalapitvany.hu</a>
          </p>
          <p>
            Az adományozási folyamatban mi vagyunk a híd:
          </p>
          <ul>
            <li>Az Igazgyöngytől megkapjuk a gyermekek adatait (méret, kor, szükséges felszerelés).</li>
            <li>Felkutatjuk a legjobb ár-érték arányú új vagy újszerű termékeket.</li>
            <li>Létrehozzuk a támogatható célokat az oldalunkon.</li>
            <li>A beérkező támogatásokból megvásároljuk a kiválasztott felszereléseket és célba juttatjuk azokat.</li>
          </ul>
          <p>
            A gyermekek személyes adatait a GDPR szabályok szerint védjük. Lehetőség van személyes üzenetet is küldeni a támogatott gyerekeknek, amelyet mi továbbítunk.
          </p>
        </div>
      </section>

      <section class="section">
        <h2 @click="toggleAccordion(2)" class="accordion-header">Kapcsolat</h2>
        <div v-show="activeAccordion === 2" class="accordion-content">
          <p>
            Ha kérdésed van, tedd fel nyugodtan a
            <RouterLink to="/connection">Kapcsolat</RouterLink> oldalon keresztül.
          </p>
        </div>
      </section>

      <section class="section">
        <h2 @click="toggleAccordion(3)" class="accordion-header">Közérdekű adatok</h2>
        <div v-show="activeAccordion === 3" class="accordion-content">
          <p><strong>Felszerelés Egyesület</strong></p>
          <p>
            Cím: 1032 Budapest, Bécsi út 134.<br>
            Telefon: +36 90 555 000<br>
            Email: felszereles@blathy.hu<br>
            Adószám: 12345678-0-00<br>
            Számlaszám: Kisgömböc Bank Zrt. – 12345678-87654321
          </p>
          <p><strong>Alapdokumentumok:</strong></p>
          <ul>
            <li>Alapító okirat</li>
            <li>Szervezeti és működési szabályzat (2024)</li>
          </ul>
          <p><strong>Átláthatóság:</strong></p>
          <ul>
            <li>Éves jelentés (2024)</li>
            <li>Közhasznúsági jelentés (2024)</li>
            <li>Könyvvizsgálói jelentés (2024)</li>
            <li>Általános szerződési feltételek</li>
          </ul>
        </div>
      </section>

    </div>
  </div>
</template>

<script>
export default {
  name: 'AboutView',
  data() {
    return {
      activeAccordion: null
    };
  },
  methods: {
    toggleAccordion(index) {
      this.activeAccordion = this.activeAccordion === index ? null : index;
    }
  }
}
</script>

<style scoped>
.card-page {
  padding: 4rem 2rem;
  background-color: #fafafa;
  min-height: 100vh;
}

.card-container.about {
  background: #fff;
  border-radius: 12px;
  padding: 4rem 3rem;
  max-width: 900px;
  margin: 3rem auto;
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08);
}

.about h1 {
  color: var(--accent-color);
  font-size: 2.8rem;
  font-weight: bold;
  text-align: center;
  margin-bottom: 3rem;
}

.accordion-header {
  color: var(--accent-color);
  margin-top: 2rem;
  font-size: 2rem;
  font-weight: 600;
  cursor: pointer;
  border-bottom: 2px solid transparent;
  transition: all 0.3s ease;
  padding-bottom: 0.5rem;
  margin-bottom: 1.5rem;
}

.accordion-header:hover {
  border-color: var(--accent-color);
}

.accordion-content {
  padding: 1.5rem 2rem;
  font-size: 1.15rem;
  line-height: 1.8;
  color: var(--text-color);
  background-color: #f9f9f9;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  margin-bottom: 2rem;
}

.about p {
  margin: 1rem 0;
  text-align: justify;
}

.about ul {
  margin-left: 3rem;
  margin-bottom: 2rem;
  list-style-type: disc;
  color: var(--text-color);
  font-size: 1.15rem;
  line-height: 1.7;
}

.about li {
  margin-top: 0.5rem;
}

.about a {
  color: var(--accent-color);
  font-weight: 600;
  text-decoration: none;
}

.about a:hover {
  text-decoration: underline;
}

.section {
  margin-top: 4rem;
}
</style>
