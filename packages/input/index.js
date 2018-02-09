import Input from './src/input';

/* istanbul ignore next */
Input.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Input.name, Input);
};

export default Input;
