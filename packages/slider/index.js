import Slider from './src/main';

/* istanbul ignore next */
Slider.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Slider.name, Slider);
};

export default Slider;
