import ColorPicker from './src/main';

/* istanbul ignore next */
ColorPicker.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + ColorPicker.name, ColorPicker);
};

export default ColorPicker;
