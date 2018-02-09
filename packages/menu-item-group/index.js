import MenuItemGroup from '../menu/src/menu-item-group';

/* istanbul ignore next */
MenuItemGroup.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + MenuItemGroup.name, MenuItemGroup);
};

export default MenuItemGroup;
