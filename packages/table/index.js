import Table from './src/table';

/* istanbul ignore next */
Table.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Table.name, Table);
};

export default Table;
