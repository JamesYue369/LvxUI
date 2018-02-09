import Spinner from './src/spinner';

/* istanbul ignore next */
Spinner.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Spinner.name, Spinner);
};

export default Spinner;
