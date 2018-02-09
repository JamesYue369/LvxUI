import Tooltip from './src/main';

/* istanbul ignore next */
Tooltip.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Tooltip.name, Tooltip);
};

export default Tooltip;
