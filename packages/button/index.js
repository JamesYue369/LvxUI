import Button from './src/button';

/* istanbul ignore next */
Button.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Button.name, Button);
};

export default Button;
