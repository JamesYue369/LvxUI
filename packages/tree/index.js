import Tree from './src/tree.vue';

/* istanbul ignore next */
Tree.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Tree.name, Tree);
};

export default Tree;
