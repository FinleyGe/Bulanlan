import { createRouter, createWebHistory } from 'vue-router'
import type { RouteRecordRaw } from 'vue-router'
import { userStore } from './store';

const routes: RouteRecordRaw[] = [{
  path: '/login',
  name: 'login',
  component: () => import('./views/Login.vue'),
  meta: {
    title: 'Bulanlan | 登录',
  },
}, {
  path: '/home',
  name: 'home',
  component: () => import('./views/Home.vue'),
  meta: {
    title: 'Bulanlan | 首页',
  },
  children: [
    {
      path: '/home/me',
      name: 'me',
      component: () => import('./views/Me.vue'),
      meta: {
        title: 'Bulanlan | 我的',
      },
    },
    {
      path: '/home/book',
      name: 'book',
      component: () => import('./views/Book.vue'),
      meta: {
        title: 'Bulanlan | 推荐阅读',
      },
    },
    {
      path: '/test',
      name: 'test',
      component: () => import('./views/Test.vue'),
      meta: {
        title: 'Bulanlan | 测试',
      },
    },
    {
      path: '/tags',
      name: 'tags',
      component: () => import('./views/Tags.vue'),
      meta: {
        title: 'Bulanlan | 标签',
      },
    },
  ],
}, {
  path: '/admin',
  name: 'admin',
  component: () => import('./views/Admin.vue'),
  meta: {
    title: 'Bulanlan | 管理',
  },
},
{
  path: '/',
  redirect: '/home',
}, {
  path: '/:pathMatch(.*)*',
  name: 'not-found',
  component: () => import('./views/NotFound.vue'),
  meta: {
    title: 'Bulanlan | 404',
  },
}
]

const router = createRouter({
  history: createWebHistory(),
  routes,
})


router.beforeEach((to, _) => {
  const store = userStore()
  const title = to.meta.title;
  if (title) {
    document.title = title as string;
  }
  if (!store.isLogin && to.name != 'login') {
    return { name: 'login' }
  }

})

export default router
