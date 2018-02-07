import config from '../config';
function broadcast(componentName, eventName, params) {
  this.$children.forEach(child => {
    var name = config.prefix + child.$options.componentName;

    if (name === componentName) {
      child.$emit.apply(child, [eventName].concat(params));
    } else {
      broadcast.apply(child, [componentName, eventName].concat([params]));
    }
  });
}
export default {
  methods: {
    dispatch(componentName, eventName, params) {
      componentName = config.prefix + componentName;
      var parent = this.$parent || this.$root;
      var name = config.prefix + parent.$options.componentName;

      while (parent && (!name || name !== componentName)) {
        parent = parent.$parent;

        if (parent) {
          name = config.prefix + parent.$options.componentName;
        }
      }
      if (parent) {
        parent.$emit.apply(parent, [eventName].concat(params));
      }
    },
    broadcast(componentName, eventName, params) {
      componentName = config.prefix + componentName;
      broadcast.call(this, componentName, eventName, params);
    }
  }
};
