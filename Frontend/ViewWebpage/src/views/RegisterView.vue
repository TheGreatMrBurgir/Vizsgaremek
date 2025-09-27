<template>
  <div class="page-wrapper">
    <h2>Regisztráció</h2>
    <form class="register-form" @submit.prevent="register">
      <input type="text" v-model="username" placeholder="Felhasználónév" required />
      <input type="email" v-model="email" placeholder="Email cím" required />
      <input type="password" v-model="password" placeholder="Jelszó" required />
      <button type="submit">Regisztráció</button>
    </form>

    <p class="mt-3">Már van fiókod?</p>
    <button class="switch-btn" @click="goToLogin">Bejelentkezés</button>

    <div class="terms_and_conditions mt-4">
      <p>
        <input type="checkbox" required />
        A folytatással elfogadod a
        <router-link to="/terms">Felhasználási feltételeket</router-link>
        és tudomásul veszed az
        <router-link to="/policy">Adatvédelmi szabályzatot</router-link>.
      </p>
    </div>

    <div v-if="errorMessage" class="error">{{ errorMessage }}</div>
  </div>
</template>

<script>
import http from '@/utils/http'

export default {
  data() {
    return {
      username: "",
      email: "",
      password: "",
      errorMessage: ""
    };
  },
  methods: {
    async register() {
      this.errorMessage = ""
      try {
        //await http.get("/sanctum/csrf-cookie")

        const response = await http.post("/register", {
          name: this.username,
          email: this.email,
          password: this.password
        })

        const user = response.data.user
        //localStorage.setItem("user", JSON.stringify(user))

        this.$router.push("/login")
      } catch (error) {
        console.error("Regisztrációs hiba:", error.response?.data || error.message)
        this.errorMessage = error.response?.data?.message || "Hiba történt. Próbáld újra."
      }
    },
    goToLogin() {
      this.$router.push("/login")
    }
  }
}
</script>

<style scoped>
.register-form {
  display: flex;
  flex-direction: column;
}

.register-form input {
  padding: 0.8rem 1rem;
  margin-bottom: 1rem;
  border: 1px solid #ccc;
  border-radius: 8px;
  font-size: 1rem;
  transition: border-color 0.3s;
}

.register-form input:focus {
  outline: none;
  border-color: #00b4b4;
  box-shadow: 0 0 0 2px rgba(0, 180, 180, 0.2);
}

.register-form button {
  background-color: #00b4b4;
  color: white;
  border: none;
  padding: 0.8rem;
  border-radius: 8px;
  cursor: pointer;
  font-size: 1rem;
  transition: background-color 0.3s;
}

.register-form button:hover {
  background-color: #007f7f;
}

.switch-btn {
  margin-top: 0.5rem;
  background-color: transparent;
  border: 1px solid #00b4b4;
  color: #00b4b4;
  padding: 0.6rem 1rem;
  border-radius: 8px;
  cursor: pointer;
  font-size: 1rem;
  transition: all 0.3s;
}

.switch-btn:hover {
  background-color: #00b4b4;
  color: white;
}

.terms_and_conditions {
  margin-top: 2rem;
  font-size: 0.9rem;
  color: #333;
}

.terms_and_conditions input[type="checkbox"] {
  margin-right: 0.4rem;
}

.terms_and_conditions a {
  color: #00b4b4;
  text-decoration: underline;
}

.mt-3 {
  margin-top: 1rem;
}

.mt-4 {
  margin-top: 2rem;
}

.error {
  color: red;
  margin-top: 1rem;
  font-weight: bold;
  text-align: center;
}
</style>
