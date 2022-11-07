<script>
  import { inject } from 'vue' // TODO:  inject() can only be used inside setup() or functional components.

  export function errorFor(id) {
    const form = inject('form')
    return form.errors[id]?.[0]
  }

  export function errorClassFor(id) {
    return { 'is-invalid': errorFor(id) } 
  }
</script>

<script setup>
  const props = defineProps({
    id: String
  })
</script>

<template>
  <div v-if="errorFor(id)" class="invalid-feedback">{{ errorFor(id) }}</div>
</template>