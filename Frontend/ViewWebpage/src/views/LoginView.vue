<template>
  <div class="page-wrapper">
    <h2>Bejelentkezés</h2>
    <form class="login-form" @submit.prevent="login">
      <input type="email" v-model="email" placeholder="Email cím" required />
      <input type="password" v-model="password" placeholder="Jelszó" required />
      <button type="submit">Belépés</button>
    </form>

    <p class="mt-3">Még nincs fiókod?</p>
    <button class="switch-btn" @click="goToRegister">Regisztrálj itt</button>

    <div v-if="error" class="error-message">
      {{ error }}
    </div>
  </div>
</template>

<script>
import http, {setToken} from '@/utils/http'

export default {
  data() {
    return {
      email: '',
      password: '',
      error: ''
    }
  },
  mounted() {
    const savedUser = localStorage.getItem('user')
    if (savedUser) {
      const user = JSON.parse(savedUser)
      if (user.email === 'admin@admin.com') {
        this.$router.push('/ADMIN')
      } else {
        this.$router.push('/profile')
      }
    }
  },
  methods: {
    async login() {
      this.error = ''
      try {
        //await http.get('/sanctum/csrf-cookie')

        const response = await http.post('/login', {
          email: this.email,
          password: this.password
        })
        console.log(response)

        setToken(response.data.token)
        const user = response.data.user
        localStorage.setItem('user', JSON.stringify(user))

        if (user.email === 'admin@email.com') {
          this.$router.push('/ADMIN')
        } else {
          this.$router.push('/profile')
        }

      } catch (err) {
        this.error = err.response?.data?.message || 'Hiba a bejelentkezés során.'
        console.error("Bejelentkezési hiba:", err)
      }
    },
    goToRegister() {
      this.$router.push('/register')
    }
  }
}
</script>



<style scoped>
.login-form {
  display: flex;
  flex-direction: column;
}

.login-form input {
  padding: 0.8rem 1rem;
  margin-bottom: 1rem;
  border: 1px solid #ccc;
  border-radius: 8px;
  font-size: 1rem;
  transition: border-color 0.3s;
}

.login-form input:focus {
  outline: none;
  border-color: #00b4b4;
  box-shadow: 0 0 0 2px rgba(0, 180, 180, 0.2);
}

.login-form button {
  background-color: #00b4b4;
  color: white;
  border: none;
  padding: 0.8rem;
  border-radius: 8px;
  cursor: pointer;
  font-size: 1rem;
  transition: background-color 0.3s;
}

.login-form button:hover {
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

.mt-3 {
  margin-top: 1rem;
}

.error-message {
  margin-top: 1rem;
  color: red;
  font-weight: bold;
}
</style>
