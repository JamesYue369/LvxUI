import Header from './src/main';

/* istanbul ignore next */
Header.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Header.name, Header);
};

export default Header;
