import Pagination from './src/pagination';

/* istanbul ignore next */
Pagination.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Pagination.name, Pagination);
};

export default Pagination;
