<script>
  import Layout from '@/Layouts/Admin.vue'

  export default {
    layout: Layout
  }
</script>

<script setup>
  import { useForm } from '@inertiajs/inertia-vue3'
  import Form from '@/Components/Form.vue'
  import Input from '@/Components/Input.vue'
  import Textarea from '@/Components/Textarea.vue'

  const props = defineProps({
    url: String,
    data: Object
  })

  const form = useForm(props.data || {
    name: null,
    description: null,
    volume: 0.0,
    price: 0.0
  })

  const submitAction = () => props.data ? form.patch(`/barrel/${form.id}`) : form.post('/barrel')
</script>

<template>
  <Form :form="form" @submit="submitAction">
    <Input id="name" type="text" label="Name" required />
    <Textarea id="description" label="Description" rows="20" />
    <Input id="volume" type="number" label="Volume (Gal)" min="0" />
    <Input id="price" type="number" label="Price (USD)" min="0" step="0.01" />
    <button class="btn btn-primary btn-lg mt-4">Save</button>
  </Form>
</template>