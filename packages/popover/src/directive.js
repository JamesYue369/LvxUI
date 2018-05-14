export default {
  bind(el, binding, vnode) {
    let pv = binding.arg || binding.value || binding.expression;
    if(_.isArray(vnode.context.$refs[pv])) {
      vnode.context.$refs[pv][0].$refs.reference = el;
    } else {
      vnode.context.$refs[pv].$refs.reference = el;
    }
  }
};

