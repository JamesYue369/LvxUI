import CheckboxGroup from '../checkbox/src/checkbox-group.vue';

/* istanbul ignore next */
CheckboxGroup.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + CheckboxGroup.name, CheckboxGroup);
};

export default CheckboxGroup;
