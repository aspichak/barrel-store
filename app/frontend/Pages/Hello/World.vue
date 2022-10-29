<script setup>
  import { Head } from '@inertiajs/inertia-vue3'

  defineProps({
    name: String,
  })
</script>

<template>
  <Head title="Hello There!" />
  <p>Hello, {{ name }}!</p>
</template>
