import Tag from './src/tag';

/* istanbul ignore next */
Tag.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Tag.name, Tag);
};

export default Tag;
