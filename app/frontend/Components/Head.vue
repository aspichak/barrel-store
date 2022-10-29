<script setup>
  import { Head } from '@inertiajs/inertia-vue3'

  defineProps({
    title: String
  })
</script>

<template>
  <Head :title="title ? `${title} - The Barrel Store` : 'The Barrel Store'">
    <slot />
  </Head>
</template>
