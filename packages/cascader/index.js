import Cascader from './src/main';

/* istanbul ignore next */
Cascader.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Cascader.name, Cascader);
};

export default Cascader;
