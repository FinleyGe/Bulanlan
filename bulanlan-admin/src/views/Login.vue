<script setup lang="ts">
import { NSpace, NInput, NCard, NButton, useMessage } from 'naive-ui'
import { inject, ref } from 'vue';
import { Login, CheckAdmin } from '../api/api';
import router from '../router';
import { userStore } from '../store';
import type { VueCookies } from 'vue-cookies';
const email = ref<string>('');
const password = ref<string>('');
const message = useMessage();
const store = userStore();
const $cookies = inject<VueCookies>('$cookies')

async function handleLogin() {
  Login(email.value, password.value).then(
    (_) => {
      CheckAdmin().then(
        (_) => {
          message.success("登陆成功")
          store.setLogin(true)
          router.push("/")
          console.log($cookies?.keys())
        }
      ).catch(
        (_) => {
          message.error("您不是管理员")
        }
      )
    }
  ).catch(
    (_) => {
      message.error("电子邮箱地址或密码有误")
    }
  )
}

</script>
<template>
  <div class="page">
    <n-card title="登陆" hoverable size="small" class="card">
      <n-space verical>
        <n-input v-model:value="email" type="text" placeholder="Email" />
        <n-input v-model:value="password" type="password" placeholder="Password" />
        <n-button type="primary" @click="handleLogin">登陆</n-button>
      </n-space>
    </n-card>
  </div>
</template>

<style scoped lang="scss">
.page {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #333;

  .card {
    max-width: 400px;
  }
}
</style>
