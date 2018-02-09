import Col from './src/col';

/* istanbul ignore next */
Col.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Col.name, Col);
};

export default Col;

