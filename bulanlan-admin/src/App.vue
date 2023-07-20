<script setup lang="ts">
import { RouterView } from 'vue-router';
import { NMessageProvider } from 'naive-ui';
import { inject, onMounted } from 'vue';
import type { VueCookies } from 'vue-cookies';
import { userStore } from './store'
const $cookies = inject<VueCookies>('$cookies')
const store = userStore()
onMounted(() => {
  console.log($cookies)
  if ($cookies?.get('token')) {
    store.setLogin(true)
  }
})
</script>

<template>
  <n-message-provider>
    <router-view></router-view>
  </n-message-provider>
</template>

<style scoped lang="scss"></style>
