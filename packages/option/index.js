import Option from '../select/src/option';

/* istanbul ignore next */
Option.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Option.name, Option);
};

export default Option;
