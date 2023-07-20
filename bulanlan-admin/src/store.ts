import { defineStore } from 'pinia'
import { ref } from 'vue'


export const userStore = defineStore('user', () => {
  const isLogin = ref<Boolean>(false);
  function setLogin(state: Boolean) {
    isLogin.value = state
  }

  return { isLogin, setLogin }
})
