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
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="#!">Start Bootstrap</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
            <li class="nav-item">
              <Link href="/" class="nav-link active">Back to Storefront</Link>
            </li>
          </ul>

          <ul class="navbar-nav me-3">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">{{ user.email }}</a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><Link href="/logout" class="dropdown-item">Log Out</Link></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Section-->
    <section class="container px-4 px-lg-5 py-5">
      <FlashMessages />
      <slot />
    </section>
</template>