<script>
  import Layout from '@/Layouts/Storefront.vue'

  export default {
    layout: Layout
  }
</script>

<script setup>
  import Currency from '@/Components/Currency.vue'

  defineProps({
    barrel: Object
  })
</script>

<template>
  <h1>{{ barrel.name }}</h1>
  <p v-if="barrel.description" v-html="barrel.description"></p>
  <p v-else>No description provided</p>
  <p>Price: <Currency :value="barrel.price"/></p>
</template>