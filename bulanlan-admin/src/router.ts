import { createRouter, createWebHistory } from 'vue-router'
import { userStore } from './store';

const routes = [{
  path: '/login',
  name: 'login',
  component: () => import('./views/Login.vue'),
}, {
  path: '/',
  name: 'home',
  component: () => import('./views/Home.vue'),
},
]

const router = createRouter({
  history: createWebHistory(),
  routes,
})


router.beforeEach((to, from) => {
  const store = userStore()
  if (!store.isLogin && to.name != 'login') {
    return { name: 'login' }
  }
  if (store.isLogin && to.name != 'home') {
    return { name: 'home' }
  }
})

export default router
