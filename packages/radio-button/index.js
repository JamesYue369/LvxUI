import RadioButton from '../radio/src/radio-button.vue';

/* istanbul ignore next */
RadioButton.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + RadioButton.name, RadioButton);
};

export default RadioButton;
