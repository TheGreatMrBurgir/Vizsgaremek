<template>
  <div class="product-view">
    <div class="container py-5">
      <h1 class="text-center text-teal mb-4">Támogatható célok</h1>
      <p class="text-center text-muted mb-5">
        Válassz egy ügyet, és adj hozzá egy kis reményt valaki életéhez.
      </p>

      <div class="row g-4">
        <div class="col-md-6 col-lg-4" v-for="product in products" :key="product.id">
          <div class="card h-100 shadow-sm border-0 product-card">
            <img
              v-if="product.image"
              :src="product.image"
              class="card-img-top object-fit-cover"
              :alt="product.name"
              style="height: 200px;"
            />

            <div class="card-body d-flex flex-column">
              <h5 class="card-title text-teal fw-semibold">{{ product.name }}</h5>
              <p class="card-text mb-2">{{ product.description }}</p>

              <div class="mt-auto">
                <div class="progress mb-2" style="height: 8px;">
                  <div
                    class="progress-bar bg-teal"
                    :style="{ width: progressPercentage(product) + '%' }"
                    role="progressbar"
                    :aria-valuenow="product.collected_amount"
                    :aria-valuemin="0"
                    :aria-valuemax="product.goal_amount"
                  ></div>
                </div>
                <small class="text-muted">
                  {{ product.collected_amount }} Ft / {{ product.goal_amount }} Ft
                </small>
              </div>
            </div>

            <div class="card-footer bg-transparent border-0">
              <button class="btn w-100"
                      :class="product.collected_amount >= product.goal_amount ? 'btn-success disabled' : 'btn-outline-teal'"
                      @click="openSupport(product)"
                      :disabled="product.collected_amount >= product.goal_amount">
                {{ product.collected_amount >= product.goal_amount ? 'Cél elérve!' : 'Támogatás' }}
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <Support
      v-if="selectedProduct"
      :product="selectedProduct"
      :productId="selectedProduct.id"
      :onClose="closeSupport"
      :onSupport="handleSupport"
    />
  </div>
</template>

<script>
import Support from '@/components/Support.vue'
import http from '@/utils/http'

export default {
  name: "ProductView",
  components: {
    Support
  },
  data() {
    return {
      selectedProduct: null,
      products: []
    }
  },
  mounted() {
    http.get('/products')
      .then(res => {
        this.products = res.data
      })
      .catch(err => {
        console.error('Hiba a termékek betöltésekor:', err)
      })
  },
  methods: {
    progressPercentage(product) {
      return Math.min(100, (product.collected_amount / product.goal_amount) * 100)
    },
    openSupport(product) {
      if (product.collected_amount >= product.goal_amount) {
        alert('Ez a cél már teljesült – nem lehet további támogatást küldeni.');
        return;
      }
      this.selectedProduct = product
    },
    closeSupport() {
      this.selectedProduct = null
    },
    async handleSupport(productId, amount) {
      const product = this.products.find(p => p.id === productId)
      if (product) {
        product.collected_amount += amount
        await http.put("/products/" + productId, product);
      }
    }
  }
}
</script>

<style scoped>
.product-view {
  background: linear-gradient(to bottom, #e6ffff, #ffffff);
  min-height: 100vh;
  padding-top: 3rem;
  background-image: url("@/ASSETS/Product_wall.png");
  background-repeat: repeat;
  background-size: auto;
}

.text-teal {
  color: #007f7f;
}

.bg-teal {
  background-color: #00b4b4 !important;
}

.btn-outline-teal {
  color: #007f7f;
  border: 1px solid #00b4b4;
}

.btn-outline-teal:hover {
  background-color: #00b4b4;
  color: white;
}

.product-card {
  border-radius: 16px;
  overflow: hidden;
  transition: transform 0.2s ease;
}

.product-card:hover {
  transform: translateY(-5px);
}

.object-fit-cover {
  object-fit: cover;
}
</style>
