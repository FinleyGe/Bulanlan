import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import { createPinia } from 'pinia';
import VueCookies from 'vue-cookies';
const pinia = createPinia()
createApp(App)
  .use(pinia)
  .use(router)
  .use(VueCookies)
  .mount('#app')