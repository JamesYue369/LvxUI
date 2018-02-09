import BreadcrumbItem from '../breadcrumb/src/breadcrumb-item';

/* istanbul ignore next */
BreadcrumbItem.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + BreadcrumbItem.name, BreadcrumbItem);
};

export default BreadcrumbItem;
