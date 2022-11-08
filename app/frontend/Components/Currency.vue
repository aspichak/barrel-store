<script setup>
  defineProps({
    value: String
  })
</script>

<template>
  <span>
    ${{
      Number(value).toLocaleString('en-US', {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
      })
    }}
  </span>
</template>
