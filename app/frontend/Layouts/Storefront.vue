<script setup>
  import { Link } from '@inertiajs/inertia-vue3'
  import Head from '@/Components/Head.vue'
  import FlashMessages from '@/Components/FlashMessages.vue'

  defineProps({
    user: Object
  });
</script>

<template>
  <Head />

  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="#!">Start Bootstrap</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
            <li class="nav-item"><Link class="nav-link active" href="/">Home</Link></li>
            <li class="nav-item"><Link href="/barrel" class="nav-link">Admin Area</Link></li>
            <li class="nav-item"><Link href="/about" class="nav-link">About Us</Link></li>
          </ul>

          <ul class="navbar-nav me-3">
            <li v-if="user.id" class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">{{ user.email }}</a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><Link href="/barrel" class="dropdown-item">Admin Area</Link></li>
                <li><Link href="/logout" class="dropdown-item">Log Out</Link></li>
              </ul>
            </li>
            <li v-else class="nav-item"><Link class="nav-link" href="/login">Log In</Link></li>
          </ul>
          
          <form class="d-flex">
            <button class="btn btn-outline-dark" type="submit">
              <i class="bi-cart-fill me-1"></i>
              Cart
              <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
            </button>
          </form>
        </div>
      </div>
    </nav>

    <!-- Header-->
    <header class="bg-dark py-5">
      <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
          <h1 class="display-4 fw-bolder">Shop in style</h1>
          <p class="lead fw-normal text-white-50 mb-0">With this shop homepage template</p>
        </div>
      </div>
    </header>

    <!-- Section-->
    <section class="container px-4 px-lg-5 py-5">
      <FlashMessages />
      <slot />
    </section>

    <!-- Footer-->
    <footer class="py-5 bg-dark">
      <div class="container"><p class="m-0 text-center text-white">Copyright &copy; The Barrel Store 2022</p></div>
    </footer>
</template>