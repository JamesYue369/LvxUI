import Rate from './src/main';

/* istanbul ignore next */
Rate.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Rate.name, Rate);
};

export default Rate;
