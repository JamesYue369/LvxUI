import DatePicker from './src/picker/date-picker';

/* istanbul ignore next */
DatePicker.install = function install(Vue) {
  Vue.component(Vue.prototype.$prefix + DatePicker.name, DatePicker);
};

export default DatePicker;
