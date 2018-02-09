import Alert from './src/main';

/* istanbul ignore next */
Alert.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Alert.name, Alert);
};

export default Alert;
