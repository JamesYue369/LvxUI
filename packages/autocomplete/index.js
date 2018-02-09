import Autocomplete from './src/autocomplete';

/* istanbul ignore next */
Autocomplete.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Autocomplete.name, Autocomplete);
};

export default Autocomplete;
