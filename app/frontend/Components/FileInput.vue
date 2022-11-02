<script setup>
  import { inject, getCurrentInstance } from 'vue'
  import FormError, { errorClassFor } from './FormError.vue'

  const props = defineProps({
    id: {
      type: String,
      default: () => `text-input-${getCurrentInstance().uid}`
    },
    label: {
      type: String,
      default: null
    }
  })

  const form = inject('form')
</script>

<template>
  <div class="mb-3">
    <label :for="id" class="form-label">{{ label }}</label>
    <input type="file" @change="form[id] = $event.target.files[0]" :id="id" class="form-control form-control-lg" :class="errorClassFor(id)" v-bind="$attrs">
    <FormError :id="id" />
  </div>
</template>
