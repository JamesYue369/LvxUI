import Collapse from './src/collapse';

/* istanbul ignore next */
Collapse.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Collapse.name, Collapse);
};

export default Collapse;

