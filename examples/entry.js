import Vue from 'vue';
import entry from './app';
import VueRouter from 'vue-router';
import Lvx from 'main/index.js';
import 'packages/theme-chalk/src/index.scss';
import routes from './route.config';
import demoBlock from './components/demo-block.vue';
import MainHeader from './components/header.vue';
import SideNav from './components/side-nav';
import title from './i18n/title.json';

Vue.use(Lvx);
Vue.use(VueRouter);
Vue.component('demo-block', demoBlock);
Vue.component('main-header', MainHeader);
Vue.component('side-nav', SideNav);

const router = new VueRouter({
  mode: 'hash',
  base: __dirname,
  routes
});

router.afterEach(route => {
  const data = title[route.meta.lang];
  for (let val in data) {
    if (new RegExp('^' + val, 'g').test(route.name)) {
      document.title = data[val];
      return;
    }
  }
  document.title = 'LvxUI';
});

new Vue({ // eslint-disable-line
  render: h => h(entry),
  router
}).$mount('#app');
