import Icon from './src/icon.vue';

/* istanbul ignore next */
Icon.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Icon.name, Icon);
};

export default Icon;
