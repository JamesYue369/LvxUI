import Form from './src/form';

/* istanbul ignore next */
Form.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Form.name, Form);
};

export default Form;
