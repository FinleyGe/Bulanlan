<script setup lang="ts">
import { RouterView } from 'vue-router';
import { NMessageProvider, NConfigProvider, zhCN } from 'naive-ui';
import { inject, onMounted } from 'vue';
import type { VueCookies } from 'vue-cookies';
import { userStore, usePageStore } from './store'
import Footer from './components/Footer.vue'
const $cookies = inject<VueCookies>('$cookies')
const store = userStore()
const pageStore = usePageStore()

function handleResize() {
  var w = document.documentElement.clientWidth || document.body.clientWidth || window.innerWidth;
  if (w < 768) {
    pageStore.setPageSize('small')
  } else {
    pageStore.setPageSize('large')
  }
}
onMounted(() => {
  if ($cookies?.get('token')) {
    store.setLogin(true)
  }
  handleResize()
  addEventListener('resize', (_) => {
    handleResize()
  })
})
</script>

<template>
  <n-config-provider :locale="zhCN">
    <n-message-provider>
      <router-view style="min-height: 95vh"> </router-view>
      <Footer />
    </n-message-provider>
  </n-config-provider>
</template>

<style scoped lang="scss"></style>
