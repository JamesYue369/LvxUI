import Footer from './src/main';

/* istanbul ignore next */
Footer.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Footer.name, Footer);
};

export default Footer;
