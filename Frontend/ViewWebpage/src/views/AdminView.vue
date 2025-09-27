<template>
  <div class="container-fluid admin-container">
    <!-- Új termék hozzáadása -->
    <form @submit.prevent="addProduct" class="admin-form" enctype="multipart/form-data" v-if="!editMode">
      <h1 class="form-title">Termék hozzáadása</h1>

      <input v-model="productName" type="text" class="form-control mb-3" placeholder="Termék neve" required>
      <input ref="fileInput" @change="handleFileUpload" type="file" class="form-control mb-3" accept="image/*" required>
      <input v-model="productPrice" type="number" class="form-control mb-3" placeholder="Célösszeg (Ft)" required>
      <textarea v-model="productDescription" class="form-control mb-3" placeholder="Termék leírása" rows="3" required></textarea>

      <button type="submit" class="btn btn-primary">Hozzáadás</button>
    </form>

    <!-- Termék módosítása -->
    <form @submit.prevent="updateProduct" class="admin-form" v-if="editMode">
      <h1 class="form-title">Termék módosítása</h1>

      <input v-model="productName" type="text" class="form-control mb-3" placeholder="Termék neve" required>
      <input v-model="productPrice" type="number" class="form-control mb-3" placeholder="Célösszeg (Ft)" required>
      <textarea v-model="productDescription" class="form-control mb-3" placeholder="Termék leírása" rows="3" required></textarea>

      <button type="submit" class="btn btn-success">Mentés</button>
      <button type="button" class="btn btn-secondary ms-2" @click="cancelEdit">Mégse</button>
      <button type="button" class="btn btn-danger ms-2" @click="showDeleteModal(editProductId)">Törlés</button>
    </form>

    <!-- Üzenetek -->
    <div v-if="successMessage" class="alert alert-success mt-3">{{ successMessage }}</div>
    <div v-if="errorMessage" class="alert alert-danger mt-3">{{ errorMessage }}</div>

    <!-- Terméklista -->
    <div v-if="products.length > 0" class="product-list mt-5">
      <h2 class="mb-4">Hozzáadott termékek</h2>
      <div class="row g-4">
        <div class="col-md-6 col-lg-4" v-for="product in products" :key="product.id">
          <div class="card shadow-sm product-card h-100">
            <img
              v-if="product.image"
              :src="'http://localhost:8000' + product.image"
              class="card-img-top product-image"
              :alt="product.name"
            />
            <div class="card-body">
              <h5 class="card-title">{{ product.name }}</h5>
              <p class="card-text"><strong>Célösszeg:</strong> {{ product.goal_amount }} Ft</p>
              <p class="card-text"><strong>Leírás:</strong> {{ product.description }}</p>
              <button class="btn btn-outline-primary btn-sm mt-2" @click="editProduct(product)">Módosítás</button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- MODAL - Termék törlés megerősítése -->
    <div class="modal fade" id="deleteConfirmModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true" ref="deleteModal">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="deleteModalLabel">Törlés megerősítése</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Bezárás"></button>
          </div>
          <div class="modal-body">
            Biztosan törölni szeretnéd ezt a terméket? Ez a művelet nem visszavonható.
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Mégse</button>
            <button type="button" class="btn btn-danger" @click="confirmDelete">Törlés</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import http from '@/utils/http'
import { Modal } from 'bootstrap'

export default {
  name: "AdminView",
  data() {
    return {
      productName: "",
      productImage: null,
      productPrice: "",
      productDescription: "",
      products: [],
      successMessage: '',
      errorMessage: '',
      editMode: false,
      editProductId: null,
      pendingDeleteId: null,
      deleteModalInstance: null
    }
  },
  mounted() {
    this.fetchProducts()

    const modalElement = this.$refs.deleteModal
    if (modalElement) {
      this.deleteModalInstance = new Modal(modalElement)
    }
  },
  methods: {
    handleFileUpload(event) {
      this.productImage = event.target.files[0]
    },
    async addProduct() {
      this.clearMessages()

      if (!this.productImage || !this.productName || !this.productPrice || !this.productDescription) {
        this.errorMessage = "Minden mező kötelező!";
        return;
      }

      const formData = new FormData()
      formData.append('name', this.productName)
      formData.append('goal_amount', this.productPrice)
      formData.append('description', this.productDescription)
      formData.append('image', this.productImage)

      try {
        await http.post('/products', formData, {
          headers: { 'Content-Type': 'multipart/form-data' }
        })
        this.successMessage = "Termék sikeresen hozzáadva!"
        this.resetForm()
        this.fetchProducts()
      } catch (error) {
        console.error('Hiba termék hozzáadásakor:', error)
        this.errorMessage = "Sikertelen feltöltés."
      }
    },
    async updateProduct() {
      this.clearMessages()

      if (!this.editProductId || !this.productName || !this.productPrice || !this.productDescription) {
        this.errorMessage = "Minden mező kötelező!";
        return;
      }

      try {
        await http.put(`/products/${this.editProductId}`, {
          name: this.productName,
          goal_amount: this.productPrice,
          description: this.productDescription
        })
        this.successMessage = "Termék frissítve!"
        this.cancelEdit()
        this.fetchProducts()
      } catch (err) {
        console.error("Hiba mentéskor:", err)
        this.errorMessage = "Mentés sikertelen."
      }
    },
    showDeleteModal(id) {
      this.pendingDeleteId = id
      if (this.deleteModalInstance) {
        this.deleteModalInstance.show()
      }
    },
    async confirmDelete() {
      if (!this.pendingDeleteId) return

      try {
        await http.delete(`/products/${this.pendingDeleteId}`)
        this.successMessage = "Termék törölve."
        this.fetchProducts()
        this.cancelEdit()
      } catch (err) {
        console.error("Hiba törléskor:", err)
        this.errorMessage = "Törlés sikertelen."
      } finally {
        this.pendingDeleteId = null
        this.deleteModalInstance?.hide()
      }
    },
    editProduct(product) {
      this.editMode = true
      this.editProductId = product.id
      this.productName = product.name
      this.productPrice = product.goal_amount
      this.productDescription = product.description
    },
    cancelEdit() {
      this.editMode = false
      this.editProductId = null
      this.resetForm()
    },
    async fetchProducts() {
      try {
        const res = await http.get('/products')
        this.products = res.data
      } catch (err) {
        console.error("Hiba a termékek betöltésekor:", err)
      }
    },
    resetForm() {
      this.productName = ""
      this.productImage = null
      this.productPrice = ""
      this.productDescription = ""
      this.$refs.fileInput && (this.$refs.fileInput.value = null)
    },
    clearMessages() {
      this.successMessage = ""
      this.errorMessage = ""
    }
  }
}
</script>

<style scoped>
.admin-container {
  background-color: #e0f7f7;
  padding: 2rem;
  border-radius: 10px;
}

.admin-form {
  background-color: #ffffff;
  padding: 2rem;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0,0,0,0.1);
}

.form-title {
  font-size: 2rem;
  font-weight: bold;
  color: #218888;
  margin-bottom: 1.5rem;
  text-align: center;
}

.form-control {
  background-color: #deffff;
  border: 1px solid #afaeae;
}

.product-list {
  margin-top: 3rem;
}

.card {
  border: 1px solid #ccc;
}

.product-image {
  height: 200px;
  object-fit: cover;
}
</style>
