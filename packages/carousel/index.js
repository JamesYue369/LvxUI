import Carousel from './src/main';

/* istanbul ignore next */
Carousel.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Carousel.name, Carousel);
};

export default Carousel;
