export default {
  bind(el, binding, vnode) {
    let pv = binding.arg || binding.value || binding.expression;
    vnode.context.$refs[pv].$refs.reference = el;
  }
};
