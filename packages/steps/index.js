import Steps from './src/steps';

/* istanbul ignore next */
Steps.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Steps.name, Steps);
};

export default Steps;
