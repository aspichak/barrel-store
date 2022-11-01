<script setup>
  defineProps({
    flash: Object
  })
</script>

<template>
  <div v-if="$page.props.flash.notice" class="alert alert-success mx-auto my-3 mb-5" role="alert">
    {{ $page.props.flash.notice }}
  </div>
  
  <div v-if="$page.props.flash.alert" class="alert alert-danger mx-auto my-3 mb-5" role="alert">
    {{ $page.props.flash.alert }}
  </div>
</template>
