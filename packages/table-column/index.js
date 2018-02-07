import TableColumn from '../table/src/table-column';

/* istanbul ignore next */
TableColumn.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + TableColumn.name, TableColumn);
};

export default TableColumn;
