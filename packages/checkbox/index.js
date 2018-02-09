import Checkbox from './src/checkbox';

/* istanbul ignore next */
Checkbox.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Checkbox.name, Checkbox);
};

export default Checkbox;
