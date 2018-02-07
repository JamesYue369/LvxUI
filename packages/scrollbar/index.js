import Scrollbar from './src/main';

/* istanbul ignore next */
Scrollbar.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Scrollbar.name, Scrollbar);
};

export default Scrollbar;
