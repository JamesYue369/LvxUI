import Container from './src/main';

/* istanbul ignore next */
Container.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Container.name, Container);
};

export default Container;
