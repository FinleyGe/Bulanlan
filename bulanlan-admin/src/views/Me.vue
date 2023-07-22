<script setup lang="ts">
import { inject, onMounted } from 'vue';
import { GetUserInfo } from '../api/api';
import { userStore } from '../store';
import { NTag, NSpace, NCard, NButton, NDivider } from 'naive-ui'
import { useRouter } from 'vue-router';
import { VueCookies } from 'vue-cookies';
const store = userStore();
const $cookie = inject<VueCookies>('cookie');
const router = useRouter();
function flush() {
  GetUserInfo().then((res) => {
    store.userInfo = res.data.data;
  });
}

function logout() {
  $cookie?.remove('token');
  store.isLogin = false;
  router.push('/login');
}
onMounted(() => {
  flush();
})
</script>
<template>
  <n-card title="个人信息">
    <span class="name">{{ store.userInfo?.name }}</span>
    <span class="email">{{ store.userInfo?.email }}</span>
    <n-space>
      <n-button type="info" size="small" style="float: right" :on-click="flush">刷新</n-button>
      <n-button type="warning" size="small" style="float: right" :on-click="logout">退出登陆</n-button>
    </n-space>
    <n-divider />
    <n-space>
      <label>能力等级</label>
      <n-tag type="success">{{ store.userInfo?.level }}</n-tag>
    </n-space>
    <n-divider />
    <label>兴趣标签</label>
    <n-space>
      <n-tag v-for="tag in store.userInfo?.tags" type="info">{{ tag.name }}</n-tag>
    </n-space>
  </n-card>
</template>

<style scoped lang="scss">
.name {
  font-size: 1.5rem;
  font-weight: bold;
}

.email {
  font-size: 1.2rem;
  color: #999;
}

label {
  font-size: 1.2rem;
  font-weight: bold;
}
</style>
