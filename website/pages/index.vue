<script setup lang="ts">
const route = useRoute()
</script>

<template>
  <div class="landing-page">
    <Header>
      <div>
        <button>
          <NuxtLink to="/login">Login</NuxtLink>
        </button>
      </div>
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
