import Upload from './src';

/* istanbul ignore next */
Upload.install = function(Vue) {
  Vue.component(Vue.prototype.$prefix + Upload.name, Upload);
};

export default Upload;
