<script>
  import Layout from '@/Layouts/Admin.vue'

  export default {
    layout: Layout
  }
</script>

<script setup>
  import { Link, useForm } from '@inertiajs/inertia-vue3'

  defineProps({
    inventory: Array
  })

  function destroy(barrel) {
    if (confirm('Are you sure you want to delete this barrel?')) {
      useForm(barrel).delete(`/barrel/${barrel.id}`)
    }
  }
</script>

<template>
  <Link href="/barrel/new" class="btn btn-primary">New Barrel</Link>

  <table class="table">
    <thead>
      <tr>
        <th scope="col">Name</th>
        <th scope="col">Price</th>
        <th scope="col"></th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="b in inventory">
        <td><Link :href="`/barrel/${b.id}/edit`">{{ b.name }}</Link></td>
        <td>${{ b.price }}</td>
        <td>
          <button class="btn btn-danger" @click="destroy(b)">Delete</button>
        </td>
      </tr>
    </tbody>
  </table>
</template>
