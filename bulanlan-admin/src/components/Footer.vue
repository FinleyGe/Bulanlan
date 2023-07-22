<script setup lang="ts">
import { useRouter } from 'vue-router';
import { userStore } from '../store';

const store = userStore();
const router = useRouter();
function handleClick() {
  if (store.isAdmin) {
    router.push('/admin');
  } else {
    return;
  }
}
</script>
<template>
  <div @click="handleClick" class="copyright">
    Bulanlan &copy; 2023 all rights reserved
  </div>
</template>

<style scoped lang="scss">
.copyright {
  text-align: center;
  height: 20px;
  color: #999;
  font-size: 14px;
  cursor: pointer;
}
</style>
