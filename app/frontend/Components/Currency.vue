<script setup>
  defineProps({
    value: String
  })
</script>

<template>
  <span>${{ Number(value).toFixed(2) }}</span>
</template>