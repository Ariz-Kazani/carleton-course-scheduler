<script setup lang="ts">

const login = (event: Event) => {
  event.preventDefault()
  console.log('login')
}
</script>

<template>
  <div>
    <Header>
      <div>
        <button>
          <NuxtLink to="/signup">Signup</NuxtLink>
        </button>
      </div>
    </Header>
    <div class="login-content">
      <section class="login">
        <h1>Login</h1>
        <form class="login-form" @submit="login">
          <label for="email">Email</label>
          <input type="email" id="email" name="email" />
          <label for="password">Password</label>
          <input type="password" id="password" name="password" />
          <button type="submit">Login</button>
        </form>
      </section>
    </div>
  </div>
  <Footer></Footer>
</template>

<style scoped>
.login-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  background-color: #f9f9f9;
}

.login {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 1rem;
  margin-top: 2rem;
  background-color: rgb(229, 231, 235);
  padding: 1rem;
  border-radius: 0.5rem;
}

.login .login-form {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}
</style>