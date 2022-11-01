<script setup>
  import { inject, getCurrentInstance } from 'vue'
  import FormError, { errorClassFor } from './FormError.vue'

  defineProps({
    id: {
      type: String,
      default: () => `text-input-${getCurrentInstance().uid}`
    },
    type: {
      type: String,
      default: 'text'
    },
    label: {
      type: String,
      default: null
    },
    value: {
      type: String,
      default: null
    }
  })

  const form = inject('form')
</script>

<template>
  <div class="mb-3">
    <label :for="id" class="form-label">{{ label }}</label>
    <textarea v-model="form[id]" :id="id" class="form-control" :class="errorClassFor(id)" v-bind="$attrs" />
    <FormError :id="id" />
  </div>
</template>