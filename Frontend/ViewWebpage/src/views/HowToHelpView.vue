<template>
  <div class="card-page">
    <div class="card-container howtohelp-page">
      <h1 class="text-center">Hogyan segíthetsz?</h1>

      <p class="lead">
        Oldalunk célja, hogy valódi segítséget nyújtson rászoruló gyermekeknek minőségi sportruházat és
        sporteszközök formájában.
      </p>

      <p>
        Nem használt ruhákat gyűjtünk, hanem minőségi, új vagy újszerű sportruházatot és sporteszközöket szerzünk be – odafigyelve az ár-érték arányra és a gyermekek igényeire.
      </p>

      <p>
        A ruhák egy webshophoz hasonló módon jelennek meg az oldalon, ahol minden termékhez hozzájárulhatsz egy kisebb
        vagy nagyobb összeggel.
        Így közösen vásároljuk meg a kiválasztott ruhákat a gyerekeknek.
      </p>

      <p>
        Te döntöd el, hogy melyik ruhadarabhoz szeretnél hozzájárulni – legyen az meleg futókabát télre, vagy profi foci cipő,
        esetleg sportfelszerelés a testneveléshez.
        <strong>Minden kis segítség számít.</strong>
      </p>

      <p>
        Ha megnéznéd, milyen ruhadarabokhoz lehet jelenleg támogatást nyújtani,
        <RouterLink to="/products" class="inline-link">itt kezdheted el a böngészést</RouterLink>.
      </p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'HowToHelp'
}
</script>

<style scoped>
.howtohelp-page h1 {
  color: var(--accent-color);
  margin-bottom: 1.5rem;
}

.howtohelp-page p {
  line-height: 1.7;
  margin-bottom: 1rem;
  color: var(--text-color);
}

.inline-link {
  color: var(--accent-color);
  font-weight: 500;
  text-decoration: underline;
  transition: color 0.2s;
}

.inline-link:hover {
  color: #005c5c;
}
</style>
