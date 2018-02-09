import TimeSelect from '../date-picker/src/picker/time-select';

/* istanbul ignore next */
TimeSelect.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + TimeSelect.name, TimeSelect);
};

export default TimeSelect;
