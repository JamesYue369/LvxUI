import Progress from './src/progress';

/* istanbul ignore next */
Progress.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Progress.name, Progress);
};

export default Progress;
