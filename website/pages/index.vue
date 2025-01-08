<script setup lang="ts">
const route = useRoute()
</script>

<template>
  <div class="landing-page">
    <Header>
      <h1>Welcome to Carleton Course Scheduler</h1>
      <p>Your one-stop solution for managing your courses efficiently.</p>
      <button><NuxtLink to="/login">Login</NuxtLink></button>
    </Header>
    <section class="features">
      <h2>Features</h2>
      <ul>
        <li>Easy course scheduling</li>
        <li>Personalized recommendations</li>
        <li>Real-time updates</li>
      </ul>
    </section>
    <section class="cta">
      <h2>Get Started</h2>
      <button>
        <NuxtLink to="/signup">Signup</NuxtLink>
      </button>
    </section>
  </div>
  <Footer></Footer>
</template>
