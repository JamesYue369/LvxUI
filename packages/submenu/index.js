import Submenu from '../menu/src/submenu';

/* istanbul ignore next */
Submenu.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Submenu.name, Submenu);
};

export default Submenu;
