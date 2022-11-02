<script setup>
  import FormError, { errorClassFor } from './FormError.vue'
  import { inject, getCurrentInstance } from 'vue'
  import { QuillEditor } from '@vueup/vue-quill'
  import '@vueup/vue-quill/dist/vue-quill.snow.css';

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
    }
  })

  const form = inject('form')
</script>

<template>
  <label :for="id" class="form-label">{{ label }}</label>
  <QuillEditor theme="snow" contentType="html" v-model:content="form[id]" :id="id" v-bind="$attrs" />
  <FormError :id="id" class="d-block" />
</template>