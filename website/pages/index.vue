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
    <div class="landing-content">
      <section class="cta">
        <h1>Insert Name Here</h1>
        <p>Save hours finding the perfect schedule</p>
        <NuxtLink to="/signup" class="button">
          <p>Signup</p>
          <svg fill="currentColor" viewBox="0 0 24 24" class="icon">
            <path clip-rule="evenodd"
              d="M12 2.25c-5.385 0-9.75 4.365-9.75 9.75s4.365 9.75 9.75 9.75 9.75-4.365 9.75-9.75S17.385 2.25 12 2.25zm4.28 10.28a.75.75 0 000-1.06l-3-3a.75.75 0 10-1.06 1.06l1.72 1.72H8.25a.75.75 0 000 1.5h5.69l-1.72 1.72a.75.75 0 101.06 1.06l3-3z"
              fill-rule="evenodd"></path>
          </svg>
        </NuxtLink>
      </section>
    </div>
  </div>
  <Footer></Footer>
</template>

<style scoped>
.landing-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  /* justify-content: center; */
  min-height: 100vh;
  background-color: #f9f9f9;
}

.cta {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 1rem;
  margin-top: 2rem;
}

.button {
  position: relative;
  transition: all 0.3s ease-in-out;
  box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2);
  padding-block: 0.5rem;
  padding-inline: 1.25rem;
  background-color: rgb(246, 33, 33);
  border-radius: 9999px;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  color: #ffff;
  gap: 10px;
  font-weight: bold;
  border: 3px solid #ffffff4d;
  outline: none;
  overflow: hidden;
  font-size: 15px;
}

.icon {
  width: 24px;
  height: 24px;
  transition: all 0.3s ease-in-out;
}

.button:hover {
  transform: scale(1.05);
  border-color: #fff9;
}

.button:hover .icon {
  transform: translate(4px);
}

.button:hover::before {
  animation: shine 1.5s ease-out infinite;
}

.button::before {
  content: "";
  position: absolute;
  width: 100px;
  height: 100%;
  background-image: linear-gradient(120deg,
      rgba(255, 255, 255, 0) 30%,
      rgba(255, 255, 255, 0.8),
      rgba(255, 255, 255, 0) 70%);
  top: 0;
  left: -100px;
  opacity: 0.6;
}

@keyframes shine {
  0% {
    left: -100px;
  }

  60% {
    left: 100%;
  }

  to {
    left: 100%;
  }
}
</style>