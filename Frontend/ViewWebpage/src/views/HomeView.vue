<template>
  <div class="home-container">
    <section class="hero text-white text-center d-flex align-items-center justify-content-center">
      <div class="hero-overlay container">
        <h1 class="display-4 mb-3">Segíts, hogy mások is mozoghassanak</h1>
        <p class="lead mb-4">
          Támogasd a rászorulókat sportfelszereléssel – egy kis adomány nagy változást hozhat!
        </p>
        <RouterLink to="/products" class="btn btn-light btn-lg text-teal">Nézd meg, kiknek segíthetsz</RouterLink>
      </div>
    </section>

    <div class="shared-bg py-5">
      <section class="container text-center mb-5">
        <h2 class="mb-4 fw-bold text-teal">Kiemelt célok</h2>
        <div class="row g-4 justify-content-center">
          <div class="col-12 col-sm-6 col-md-4" v-for="product in featuredProducts" :key="product.id">
            <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
              <img
                v-if="product.image"
                :src="product.image"
                :alt="product.name"
                class="card-img-top object-fit-cover"
                style="height: 200px;"
              />
              <div class="card-body">
                <h5 class="card-title fw-bold text-teal">{{ product.name }}</h5>
                <p class="card-text">{{ product.description }}</p>
                <small class="text-muted d-block">{{ product.collectedAmount }} Ft / {{ product.goalAmount }} Ft</small>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section class="container text-center">
        <h2 class="mb-3">Te is lehetsz a változás része</h2>
        <p class="mb-4">Legyél részese egy közösségnek, amely törődik másokkal. Egy kis segítség is számít.</p>
        <RouterLink to="register" class="btn btn-primary btn-lg bg-teal border-0">Csatlakozom</RouterLink>
      </section>
    </div>
  </div>
</template>

<script>
import { RouterLink } from "vue-router";

export default {
  name: "HomeView",
  data() {
    return {
      featuredProducts: [
        {
          id: 1,
          name: "Téli kabát egy fiatal sportoló lánynak",
          description: "Hogy ne kelljen kihagynia az edzéseket a hideg miatt.",
          image: "http://localhost:8000/storage/images/kabat.jpg",
          category: "Kabát",
          goalAmount: 15000,
          collectedAmount: 8700,
        },
        {
          id: 2,
          name: "Sportcipő egy iskolás kisfiúnak",
          description: "A mozgás öröme mindenkit megillet.",
          image: "http://localhost:8000/storage/images/cipo.jpg",
          category: "Cipő",
          goalAmount: 12000,
          collectedAmount: 4100,
        },
        {
          id: 3,
          name: "Melegítő szett edzésekhez",
          description: "Hogy legyen miben fejlődni és küzdeni.",
          image: "http://localhost:8000/storage/images/melegito.jpg",
          category: "Melegítő",
          goalAmount: 18000,
          collectedAmount: 9200,
        },
      ],
    };
  },
};
</script>

<style scoped>
.home-container {
  font-family: 'Segoe UI', sans-serif;
  color: #2f2f2f;
}

.hero {
  background: url("@/ASSETS/VR_logo.png") no-repeat center;
  background-size: contain;
  background-color: #e7ffff;
  min-height: 400px;
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.4);
  padding: 2rem;
  overflow: hidden;
}

.hero::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.4);
  z-index: 1;
}

.hero-overlay {
  position: relative;
  z-index: 2;
  animation: fadeIn 1.5s ease-out both;
  padding: 2rem;
  border-radius: 20px;
  background: rgba(255, 255, 255, 0.1);
}

@keyframes fadeIn {
  0% {
    opacity: 0;
    transform: translateY(15px);
  }

  100% {
    opacity: 1;
    transform: translateY(0);
  }
}

@media (max-width: 768px) {
  .hero {
    background-size: cover;
    min-height: 300px;
  }

  .hero-overlay {
    padding: 1rem;
  }

  .display-4 {
    font-size: 1.8rem;
  }

  .lead {
    font-size: 1rem;
  }
}

.text-teal {
  color: #007f7f !important;
  filter: brightness(1.1);
}

.bg-teal {
  background-color: #00b4b4 !important;
}

.shared-bg {
  background-color: #94e8e8;
  border-radius: 30px 30px 0px 0px;
}
</style>
