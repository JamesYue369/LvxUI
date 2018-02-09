import Transfer from './src/main';

/* istanbul ignore next */
Transfer.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Transfer.name, Transfer);
};

export default Transfer;
