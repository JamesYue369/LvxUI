import TabPane from '../tabs/src/tab-pane.vue';

/* istanbul ignore next */
TabPane.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + TabPane.name, TabPane);
};

export default TabPane;
