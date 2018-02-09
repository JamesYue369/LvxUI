import Step from '../steps/src/step';

/* istanbul ignore next */
Step.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Step.name, Step);
};

export default Step;
