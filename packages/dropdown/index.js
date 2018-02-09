import Dropdown from './src/dropdown';

/* istanbul ignore next */
Dropdown.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Dropdown.name, Dropdown);
};

export default Dropdown;
