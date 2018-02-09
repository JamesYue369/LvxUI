import Badge from './src/main';

/* istanbul ignore next */
Badge.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Badge.name, Badge);
};

export default Badge;
