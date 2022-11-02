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
  import FileInput from '@/Components/FileInput.vue'
  import QuillEditor from '@/Components/QuillEditor.vue'

  const props = defineProps({
    url: String,
    data: Object
  })

  const form = useForm({
    name: null,
    description: null,
    volume: 0.0,
    price: 0.0,
    image: null,
    ...props.data
  })

  const submitAction = () => props.data ? form.patch(`/barrel/${form.id}`) : form.post('/barrel')
</script>

<template>
  <Form :form="form" @submit="submitAction">
    <Input id="name" type="text" label="Name" required />
    <FileInput id="image" accept="image/*" label="Image" />
    <progress class="d-block w-100" v-if="form.progress" :value="form.progress.percentage" max="100">
      {{ form.progress.percentage }}%
    </progress>
    <QuillEditor id="description" label="Description" />
    <Input id="volume" type="number" label="Volume (Gal)" min="0" />
    <Input id="price" type="number" label="Price (USD)" min="0" step="0.01" />

    <button class="btn btn-primary btn-lg mt-4">Save</button>
  </Form>
</template>