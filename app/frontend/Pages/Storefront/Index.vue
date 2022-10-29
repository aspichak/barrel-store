<script>
  import Layout from '@/Layouts/Storefront.vue'

  export default {
    layout: Layout
  }
</script>

<script setup>
  defineProps({
    inventory: Array
  })
</script>

<template>
  <div v-for="b in inventory">
    <h2>{{ b.name }}</h2>
    <p>{{ b.description }}</p>
    <p>${{ b.price }}</p>
  </div>
</template>
