import OptionGroup from '../select/src/option-group';

/* istanbul ignore next */
OptionGroup.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + OptionGroup.name, OptionGroup);
};

export default OptionGroup;
