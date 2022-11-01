<script setup>
  import { InertiaForm } from '@inertiajs/inertia-vue3'
  import { provide } from 'vue'

  const props = defineProps({
    form: InertiaForm,
  })

  provide('form', props.form)
</script>

<template>
  <form @submit.prevent="$emit('submit')" v-bind="$attrs">
    <slot></slot>
  </form>
</template>
