<script setup lang="ts">
const route = useRoute()
</script>

<template>
  <Header>
    <button>
      <NuxtLink to="/login">Login</NuxtLink>
    </button>
  </Header>
  <div class="signup-content">
    <section class="signup">
      <h1>Signup</h1>
      <form class="signup-form">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" />
        <label for="password">Password</label>
        <input type="password" id="password" name="password" />
        <label for="password2">Password</label>
        <input type="password" id="password2" name="password2" />
        <button type="submit">Signup</button>
      </form>
    </section>
  </div>
  <Footer></Footer>
</template>

<style scoped>
.signup-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  background-color: #f9f9f9;
}

.signup {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 1rem;
  margin-top: 2rem;
  background-color: rgb(229, 231, 235);
  padding: 1rem;
  border-radius: 0.5rem;
}

.signup .signup-form {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

.signup button {
  background-color: rgb(246, 33, 33);
  color: white;
  padding: 0.5rem 1rem;
  border-radius: 0.5rem;
  border: none;
  cursor: pointer;
}
</style>