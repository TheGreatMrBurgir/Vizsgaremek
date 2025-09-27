<template>
  <div class="connections-container">
    <h2>Lépj velünk kapcsolatba</h2>

    <div class="contact-info">
      <p><strong>Email:</strong> segitsvelem@gmail.com</p>
      <p><strong>Telefonszám:</strong> +36 30 123 4567</p>
      <p><strong>Cím:</strong> 1051 Budapest, Szív utca 10.</p>
    </div>

    <form class="contact-form" @submit.prevent="submitForm" v-if="loggedIn">
      <h3>Írj nekünk</h3>
      <input type="text" v-model="name" placeholder="Név" required />
      <input type="email" v-model="email" placeholder="Email címed" required />
      <textarea v-model="message" placeholder="Üzenet" rows="5" required></textarea>
      <button type="submit">Küldés</button>
    </form>

    <div v-else class="text-danger text-center mt-4">
      A kapcsolatfelvételhez <router-link to="/login" class="text-white">jelentkezz be</router-link>.
    </div>

    <div v-if="successMessage" class="text-success mt-3">{{ successMessage }}</div>
    <div v-if="errorMessage" class="text-danger mt-3">{{ errorMessage }}</div>
  </div>
</template>

<script>
import http from '@/utils/http'

export default {
  data() {
    return {
      name: "",
      email: "",
      message: "",
      successMessage: "",
      errorMessage: "",
      loggedIn: false
    }
  },
  async mounted() {
    try {
      const response = await http.get('/user')
      this.name = response.data.name
      this.email = response.data.email
      this.loggedIn = true
    } catch (err) {
      console.warn("Nem vagy bejelentkezve:", err)
      this.loggedIn = false
    }
  },
  methods: {
    async submitForm() {
      this.successMessage = ''
      this.errorMessage = ''

      try {
        await http.post('/contact', {
          name: this.name,
          email: this.email,
          message: this.message
        })
        this.successMessage = "Köszönjük, hogy írtál nekünk! Hamarosan válaszolunk."
        this.message = ""
      } catch (error) {
        this.errorMessage = "Nem sikerült elküldeni az üzenetet."
        console.error("Kapcsolatfelvétel hiba:", error)
      }
    }
  }
}
</script>

<style scoped>
.connections-container {
  max-width: 800px;
  margin: 50px auto;
  background: linear-gradient(to right, #4b88a2, #5395ab, #2c5364);
  color: white;
  padding: 30px;
  border-radius: 12px;
  box-shadow: 0 0 25px rgba(0, 0, 0, 0.3);
}

h2, h3 {
  text-align: center;
  margin-bottom: 20px;
}

.contact-info {
  text-align: center;
  margin-bottom: 40px;
  line-height: 1.8;
  font-size: 1.1em;
}

.contact-form {
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.contact-form input,
.contact-form textarea {
  padding: 12px;
  border: none;
  border-radius: 6px;
  background-color: #1b2b38;
  color: white;
  font-size: 1em;
}

.contact-form button {
  background-color: #00b4b4;
  color: white;
  font-weight: bold;
  padding: 12px;
  border: none;
  border-radius: 6px;
  cursor: pointer;
}

.contact-form button:hover {
  background-color: #019191;
}

.text-success {
  color: #00ffcc;
  text-align: center;
  margin-top: 1rem;
}

.text-danger {
  color: #ffcccc;
  text-align: center;
  margin-top: 1rem;
}

a {
  text-decoration: underline;
}
</style>
