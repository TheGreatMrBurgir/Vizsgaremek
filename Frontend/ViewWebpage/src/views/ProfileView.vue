<template>
  <div class="profile-container">
    <div class="profile-card">
      <h2>Profilom</h2>

      <div class="profile-section">
        <label>Email cím</label>
        <p>{{ user.email }}</p>
      </div>

      <div class="profile-section">
        <label>Felhasználónév</label>
        <div v-if="editingUsername">
          <input type="text" v-model="username" placeholder="Új felhasználónév" />
          <input type="password" v-model="currentPasswordForUsername" placeholder="Jelszó megerősítés" />
          <button @click="saveUsername">Mentés</button>
          <button @click="cancelEdit('username')">Mégse</button>
        </div>
        <div v-else>
          <p>{{ user.name }}</p>
          <button @click="editingUsername = true">Szerkesztés</button>
        </div>
      </div>

      <div class="profile-section">
        <label>Jelszó módosítása</label>
        <div v-if="editingPassword">
          <input type="password" v-model="currentPassword" placeholder="Új jelszó" />
          <input type="password" v-model="newPassword" placeholder="Új jelszó mégegyszer" />
          <button @click="savePassword">Mentés</button>
          <button @click="cancelEdit('password')">Mégse</button>
        </div>
        <div v-else>
          <p>********</p>
          <button @click="editingPassword = true">Jelszó módosítása</button>
        </div>
      </div>

      <div class="d-flex flex-column align-items-start gap-2 mb-2">
        <button class="btn btn-danger" @click="logout" :disabled="busy" title="Kijelentkezés">
          Kijelentkezés
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import http from '@/utils/http'

export default {
  data() {
    return {
      user: {
        email: '',
        name: ''
      },
      username: '',
      currentPasswordForUsername: '',
      currentPassword: '',
      newPassword: '',
      editingUsername: false,
      editingPassword: false,
      busy: false
    }
  },
  mounted() {
    const saved = localStorage.getItem('user')
    if (saved) {
      this.user = JSON.parse(saved)
    } else {
      this.$router.push('/login')
    }
  },
  methods: {
    async logout() {
      this.busy = true
      try {
        await http.post('/logout').catch(() => {})
      } finally {
        try { 
          localStorage.removeItem('token'); 
          localStorage.removeItem('user'); 
        } catch (_) {}
        this.busy = false
        this.$router.push('/login')
      }
    },

    saveUsername() {
      if (!this.currentPasswordForUsername || !this.username) {
        alert('Minden mezőt ki kell tölteni!')
        return
      }

      this.user.name = this.username
      localStorage.setItem('user', JSON.stringify(this.user))

      this.editingUsername = false
      this.username = ''
      this.currentPasswordForUsername = ''
      alert('Felhasználónév frissítve (helyileg).')
    },

    async savePassword() {
      if (!this.currentPassword || !this.newPassword) {
        alert('Minden mezőt ki kell tölteni!')
        return
      }
      const response = await http.put("/changepassword", {password: this.currentPassword, newPassword: this.newPassword})
      console.log(response)
      if(response.data.success === "true"){
        alert('sikeres mentés')
      }
      this.editingPassword = false
      this.currentPassword = ''
      this.newPassword = ''
    },

    cancelEdit(section) {
      if (section === 'username') {
        this.editingUsername = false
        this.username = ''
        this.currentPasswordForUsername = ''
      }
      if (section === 'password') {
        this.editingPassword = false
        this.currentPassword = ''
        this.newPassword = ''
      }
    }
  }
}
</script>

<style scoped>
.profile-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 85vh;
  background: linear-gradient(135deg, #e0f7f7 0%, #d1f0f0 100%);
  padding: 2rem;
}

.profile-card {
  background: #ffffff;
  padding: 2rem;
  border-radius: 12px;
  box-shadow: 0 0 20px rgba(0, 150, 160, 0.2);
  max-width: 500px;
  width: 100%;
}

.profile-card h2 {
  text-align: center;
  color: #0db7b7;
  margin-bottom: 1.5rem;
}

.profile-section {
  margin-bottom: 1.5rem;
}

.profile-section label {
  display: block;
  color: #0a2e36;
  font-weight: bold;
  margin-bottom: 0.5rem;
}

.profile-section p {
  background: #f2fafa;
  padding: 0.6rem;
  border-radius: 6px;
  color: #0a2e36;
}

input {
  width: 100%;
  padding: 0.6rem;
  margin-bottom: 0.6rem;
  border: 1px solid #ccc;
  border-radius: 6px;
}

button {
  margin-right: 0.5rem;
  background-color: #0db7b7;
  color: white;
  border: none;
  padding: 0.5rem 1rem;
  border-radius: 6px;
  cursor: pointer;
  transition: background 0.3s;
}

button:hover {
  background-color: #097c7c;
}
</style>
