<script>
  import Layout from '@/Layouts/Storefront.vue'

  export default {
    layout: Layout
  }
</script>

<script setup>
  import { Link } from '@inertiajs/inertia-vue3'
  import Currency from '@/Components/Currency.vue'

  defineProps({
    inventory: Array
  })
</script>

<template>
  <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
    
    <!-- Product card-->
    <div class="col mb-5" v-for="b in inventory">
        <div class="card h-100">
            <!-- Product image-->
            <Link :href="`/barrel/${b.id}`">
              <img class="card-img-top" :src="b.image_url" alt="..." />
            </Link>
            <!-- Product details-->
            <div class="card-body p-4">
                <div class="text-center">
                    <!-- Product name-->
                    <Link :href="`/barrel/${b.id}`">
                      <h5 class="fw-bolder">{{ b.name }}</h5>
                    </Link>
                    <!-- Product price-->
                    <Currency :value="b.price"/>
                </div>
            </div>
        </div>
    </div>
  
  </div>
</template>
