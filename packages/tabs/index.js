import Tabs from './src/tabs';

/* istanbul ignore next */
Tabs.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Tabs.name, Tabs);
};

export default Tabs;
