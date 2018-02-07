import Radio from './src/radio';

/* istanbul ignore next */
Radio.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Radio.name, Radio);
};

export default Radio;
