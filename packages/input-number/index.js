import InputNumber from './src/input-number';

/* istanbul ignore next */
InputNumber.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + InputNumber.name, InputNumber);
};

export default InputNumber;
