import Breadcrumb from './src/breadcrumb';

/* istanbul ignore next */
Breadcrumb.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Breadcrumb.name, Breadcrumb);
};

export default Breadcrumb;
