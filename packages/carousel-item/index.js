import CarouselItem from '../carousel/src/item';

/* istanbul ignore next */
CarouselItem.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + CarouselItem.name, CarouselItem);
};

export default CarouselItem;
