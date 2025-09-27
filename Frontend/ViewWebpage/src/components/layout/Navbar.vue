<template>
  <header>
    <nav class="navbar navbar-expand-lg navbar-light custom-navbar shadow-sm">
      <div class="container">
        <RouterLink class="navbar-brand" to="/">SegítsVelem</RouterLink>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
          aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav ms-auto">
            <li class="nav-item">
              <RouterLink to="about" class="nav-link">Rólunk</RouterLink>
            </li>

            <li class="nav-item">
              <RouterLink class="nav-link" to="/HowToHelp">Hogyan segíthetsz?</RouterLink>
            </li>

            <li class="nav-item">
              <RouterLink class="nav-link" to="/products">Támogatható célok</RouterLink>
            </li>

            <li class="nav-item">
              <RouterLink class="nav-link" to="/connection">Kapcsolat</RouterLink>
            </li>

            <li class="nav-item">
              <RouterLink class="nav-link" to="/profile">Profilom</RouterLink>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="auth-links">
      <RouterLink class="nav-link" to="/register">Regisztráció</RouterLink>
      <RouterLink class="nav-link" to="/login">Bejelentkezés</RouterLink>
    </div>
  </header>
</template>

<script>
export default {
  name: "Navbar"
};
</script>

<style scoped>
header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  padding: 0px 20px;
  background-color: #e9fafa;
}

nav {
  display: flex;
  gap: 15px;
}

nav .nav-link {
  color: #007f7f;
  font-weight: 500;
  padding: 10px 15px;
  border-radius: 5px;
  transition: background-color 0.3s, transform 0.2s;
  text-decoration: none;
}

nav .nav-link:hover {
  background-color: #d4f0f0;
  color: #005c5c;
  transform: scale(1.05);
}

.navbar-toggler {
  border: none;
  background-color: transparent;
}

.auth-links {
  display: flex;
  flex-direction: column;
  gap: 10px;
  padding: 10px;
}

.auth-links .nav-link {
  color: #007f7f;
  font-weight: 500;
  padding: 5px 10px;
  border-radius: 5px;
  text-decoration: none;
  background-color: #e9fafa;
}

.auth-links .nav-link:hover {
  color: #005c5c;
  background-color: #d4f0f0;
}

.navbar-brand {
  font-weight: bold;
  color: #00aaaa !important;
  font-size: 1.4rem;
}
</style>
