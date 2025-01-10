<template>
    <div class="header">
        THIS IS THE HEADER
        <slot></slot>
    </div>
</template>

<style lang="css" scoped>
    .header {
        background-color: rgb(246, 33, 33);
        color: white;
        text-align: center;
        padding: 1rem;
        display: flex;
        align-items: center;
    }
</style>