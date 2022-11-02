<script>
  import Layout from '@/Layouts/Storefront.vue'

  export default {
    layout: Layout
  }
</script>

<script setup>
  import { useForm } from '@inertiajs/inertia-vue3'

  const form = useForm({ user: {
    email: 'demo@example.com',
    password: 'password',
    remember_me: true
  }})

  defineProps({
    inventory: Array
  })
</script>

<template>
  <div class="container row mx-auto">

    <div class="col-md-9 col-lg-6 col-xl-5">
      <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
        class="img-fluid" alt="Sample image">
    </div>

    <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
      <form @submit.prevent="form.post('/login')">
        <h1 class="">Sign In</h1>

        <!-- Email input -->
        <div class="form-outline mb-4">
          <label for="email" class="form-label">Email</label>
          <input v-model="form.user.email" type="email" class="form-control form-control-lg" id="email" autofocus>
        </div>

        <!-- Password input -->
        <div class="form-outline mb-3">
          <label for="password" class="form-label">Password</label>
          <input v-model="form.user.password" type="password" class="form-control form-control-lg" id="password" autofocus>
        </div>
        
        <div class="d-flex justify-content-between align-items-center">
            <!-- Remember me checkbox -->
            <div class="form-check mb-0">
              <input v-model="form.user.remember_me" class="form-check-input me-2" type="checkbox" id="remember_me">
              <label class="form-check-label" for="remember_me">Remember me</label>
            </div>

            <a href="#" class="text-body">Forgot your password?</a>
        </div>

        <div class="text-center text-lg-start mt-4 pt-2">
          <button class="btn btn-primary btn-lg" style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
        </div>

      </form>
    </div>
  </div>
</template>