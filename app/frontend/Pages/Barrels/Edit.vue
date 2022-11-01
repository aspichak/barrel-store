<script>
  import Layout from '@/Layouts/Admin.vue'

  export default {
    layout: Layout
  }
</script>

<script setup>
  import Form from './Form.vue';

  defineProps({
    barrel: Object
  })
</script>

<template>
  <Form :data="barrel" /> 
</template>