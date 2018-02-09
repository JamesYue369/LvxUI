import Dialog from './src/component';

/* istanbul ignore next */
Dialog.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Dialog.name, Dialog);
};

export default Dialog;
