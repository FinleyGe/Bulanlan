import { defineStore } from 'pinia'
import { ref } from 'vue'
import { User } from './type/type';


export const userStore = defineStore('user', () => {
  const isLogin = ref<Boolean>(false);
  const isAdmin = ref<Boolean>(false);
  const userInfo = ref<User>({
    name: '未登陆',
    email: '未登陆',
    tags: [],
    level: '未登陆',
  });
  function setLogin(state: Boolean) {
    isLogin.value = state
  }
  function setAdmin(state: Boolean) {
    isAdmin.value = state
  }
  function setUserInfo(user: User) {
    userInfo.value = user
  }

  return { isLogin, setLogin, isAdmin, setAdmin, userInfo, setUserInfo }
})

export const usePageStore = defineStore('page', () => {
  const pageSize = ref<'small' | 'large'>('small');
  const setPageSize = (size: 'small' | 'large') => {
    pageSize.value = size
  }
  return { pageSize, setPageSize }
})
