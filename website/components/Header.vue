<template>
  <div class="header-main-content">
    <div class="header-static-content">
      <NuxtLink to="/" class="header-link">
        THIS IS THE HEADER
      </NuxtLink>
    </div>
    <div class="slot-content">
      <slot></slot>
    </div>
  </div>
</template>

<style lang="css" scoped>
.header-main-content {
  background-color: rgb(246, 33, 33);
  color: white;
  text-align: center;
  padding: 1rem;
  display: flex;
  align-items: center;
  display: grid;
  grid-template-columns: 1fr 1fr;
}

.header-main-content .header-static-content {
  width: 100%;
  display: flex;
}

.header-main-content .header-static-content .header-link {
  color: white;
  text-decoration: none;
  font-weight: bold;
  font-size: 1.5rem;
  display: flex;
  align-items: center;
  gap: 10px;
}

.header-main-content .slot-content {
  display: flex;
  justify-content: flex-end;
  width: 100%;
}

</style>