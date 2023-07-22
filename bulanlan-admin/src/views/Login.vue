<script setup lang="ts">
import { NSpace, NInput, NCard, NButton, useMessage, NForm, NFormItem, FormRules, FormInst } from 'naive-ui'
import { ref } from 'vue';
import { Login, CheckAdmin, Register } from '../api/api';
import router from '../router';
import { userStore } from '../store';
const message = useMessage();
const store = userStore();
const mode = ref<'login' | 'register'>('login')
const registerFormRef = ref<FormInst | null>(null);

const loginForm = ref<{
  email: string
  password: string
}>({
  email: '',
  password: ''
})

const registerForm = ref<{
  email: string
  name: string
  password: string
  confirmPassword: string
}>({
  email: '',
  name: '',
  password: '',
  confirmPassword: ''
})

const registerRules: FormRules = {
  email: {
    required: true,
    type: 'email',
    validator: (_, value) => {
      if (value.match(/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/) == null) {
        return new Error('电子邮箱地址格式有误')
      }
    }
  },
  name: {
    required: true,
    type: 'string',
    validator: (_, value: String) => {
      if (value.length > 10) {
        return new Error('用户名长度不能超过10个字符')
      }
    }
  },
  password: {
    required: true,
    type: 'string',
    validator: (_, value) => {
      // 包含数字、字母、特殊符号中的两种，且不少于8位
      if (value.match(/^(?![0-9]+$)(?![a-zA-Z]+$)(?![!@#$%^&*]+$)[0-9A-Za-z!@#$%^&*]{8,}$/) == null) {
        return new Error('用户名必须包含数字、字母、特殊字符中的两种，且不少于8位')
      }
    }
  },
  confirmPassword: {
    required: true,
    type: 'string',
    validator: (_, value) => {
      if (value !== registerForm.value.password) {
        return new Error('两次输入的密码不一致')
      }
    }
  }
}

async function handleRegister() {
  registerFormRef.value?.validate(
    (error) => {
      if (error) {
        message.error('请检查输入')
        return
      } else {
        Register(
          registerForm.value.email,
          registerForm.value.password,
          registerForm.value.name,
        ).then(
          (_) => {
            message.success("注册成功")
            mode.value = 'login'
            loginForm.value.email = registerForm.value.email
            loginForm.value.password = registerForm.value.password
            handleLogin()
          }
        ).catch(
          (_) => {
            message.error("注册失败, 请检查输入")
          }
        )
      }
    }
  )
}
async function handleLogin() {
  Login(loginForm.value.email, loginForm.value.password).then(
    (_) => {
      message.success("登陆成功")
      store.setLogin(true)
      router.push("/")
      CheckAdmin().then(
        (_) => {
          store.setAdmin(true)
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
    <n-card title="登陆" hoverable size="small" class="card" v-show="mode == 'login'">
      <n-space verical>
        <n-form :model="loginForm">
          <n-form-item label="Email" path="email">
            <n-input v-model:value="loginForm.email" type="text" placeholder="Email" />
          </n-form-item>
          <n-form-item label="密码" path="password">
            <n-input v-model:value="loginForm.password" type="password" placeholder="密码" />
          </n-form-item>
        </n-form>
        <n-space>
          <n-button type="primary" @click="handleLogin">登陆</n-button>
          <n-button type="primary" @click="mode = 'register'" secondary>没有账号</n-button>
        </n-space>
      </n-space>
    </n-card>
    <n-card title="注册" hoverable size="small" class="card" v-show="mode == 'register'">
      <n-space verical>
        <n-form ref="registerFormRef" :model="registerForm" :rules="registerRules">
          <n-form-item label="Email" path="email">
            <n-input v-model:value="registerForm.email" type="text" placeholder="Email" />
          </n-form-item>
          <n-form-item label="用户名" path="name">
            <n-input v-model:value="registerForm.name" type="text" placeholder="用户名" />
          </n-form-item>
          <n-form-item label="密码" path="password">
            <n-input v-model:value="registerForm.password" type="password" placeholder="密码" />
          </n-form-item>
          <n-form-item label="确认密码" path="confirmPassword">
            <n-input v-model:value="registerForm.confirmPassword" type="password" placeholder="确认密码" />
          </n-form-item>
        </n-form>
        <n-space>
          <n-button type="primary" @click="handleRegister">注册</n-button>
          <n-button type="primary" @click="mode = 'login'" secondary>已有账号</n-button>
        </n-space>
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
