import Row from './src/row';

/* istanbul ignore next */
Row.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Row.name, Row);
};

export default Row;

