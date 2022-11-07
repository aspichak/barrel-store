<script setup>
  import { inject, getCurrentInstance } from 'vue'
  import CKEditor from '@ckeditor/ckeditor5-vue'
  import ClassicEditor from '@ckeditor/ckeditor5-build-classic'
  import FormError from './FormError.vue'

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
  const Editor = CKEditor.component
  const config = {
    toolbar: [ 'heading', '|', 'bold', 'italic', 'link', 'bulletedList', 'numberedList', 'blockQuote' ]
  }

</script>

<template>
  <label :for="id" class="form-label">{{ label }}</label>
  <Editor :editor="ClassicEditor" v-model="form[id]" :config="config" v-bind="$attrs" />
  <FormError :id="id" class="d-block" />
</template>