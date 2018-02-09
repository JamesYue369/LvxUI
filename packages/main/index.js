import Main from './src/main';

/* istanbul ignore next */
Main.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Main.name, Main);
};

export default Main;
