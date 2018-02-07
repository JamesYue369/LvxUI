import CollapseItem from '../collapse/src/collapse-item.vue';

/* istanbul ignore next */
CollapseItem.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + CollapseItem.name, CollapseItem);
};

export default CollapseItem;
