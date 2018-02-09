import Switch from './src/component';

/* istanbul ignore next */
Switch.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Switch.name, Switch);
};

export default Switch;

