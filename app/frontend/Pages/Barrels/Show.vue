<script>
  import Layout from '@/Layouts/Storefront.vue'

  export default {
    layout: Layout
  }
</script>

<script setup>
  import Currency from '@/Components/Currency.vue'

  defineProps({
    barrel: Object
  })
</script>

<template>
  <section class="py-5">
      <div class="container px-4 px-lg-5 my-5">
          <div class="row gx-4 gx-lg-5 align-items-center">
              <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" :src="barrel.image_url" alt="Barrel image" /></div>
              <div class="col-md-6">
                  <div class="small mb-1">SKU: BRL-{{ ('0000' + barrel.id).slice(-4) }}</div>
                  <h1 class="display-5 fw-bolder">{{ barrel.name }}</h1>
                  <div class="fs-5 mb-5">
                      <span><Currency :value="barrel.price"/></span>
                  </div>
                  <p v-if="barrel.description" class="lead" v-html="barrel.description"></p>
                  <p v-else class="lead">No description provided</p>
                  <div class="d-flex">
                      <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />
                      <button class="btn btn-outline-dark flex-shrink-0" type="button">
                          <i class="bi-cart-fill me-1"></i>
                          Add to cart
                      </button>
                  </div>
              </div>
          </div>
      </div>
  </section>
</template>