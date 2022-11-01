<script>
  import Layout from '@/Layouts/Storefront.vue'

  export default {
    layout: Layout
  }
</script>

<script setup>
  defineProps({
    barrel: Object
  })
</script>

<template>
  <h1>{{ barrel.name }}</h1>
  <p v-if="barrel.description">{{ barrel.description }}</p>
  <p v-else>No description provided</p>
  <p>Price: ${{ barrel.price }}</p>
</template>