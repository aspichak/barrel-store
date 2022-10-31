<script setup>
  defineProps({
    flash: Object
  })
</script>

<template>
  <div v-if="$page.props.flash.notice" class="alert alert-success col-10 mx-auto my-3 mb-5" role="alert">
    {{ $page.props.flash.notice }}
  </div>
  
  <div v-if="$page.props.flash.alert" class="alert alert-danger col-10 mx-auto my-3 mb-5" role="alert">
    {{ $page.props.flash.alert }}
  </div>
</template>
