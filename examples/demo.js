import Vue from 'vue';
import LvxUI from 'main/index.js';
import App from './demo/index.vue';
import 'packages/theme-chalk/src/index.scss';

Vue.use(LvxUI);

new Vue({ // eslint-disable-line
  render: h => h(App)
}).$mount('#app');
