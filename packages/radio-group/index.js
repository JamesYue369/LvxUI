import RadioGroup from '../radio/src/radio-group.vue';

/* istanbul ignore next */
RadioGroup.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + RadioGroup.name, RadioGroup);
};

export default RadioGroup;
