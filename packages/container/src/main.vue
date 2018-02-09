<template>
  <section :class="[`${$clsPrefix}-container`, { 'is-vertical': isVertical }]">
    <slot></slot>
  </section>
</template>

<script>
  export default {
    name: 'Container',

    componentName: 'ElContainer',

    props: {
      direction: String
    },

    computed: {
      isVertical() {
        if (this.direction === 'vertical') {
          return true;
        } else if (this.direction === 'horizontal') {
          return false;
        }
        return this.$slots && this.$slots.default
          ? this.$slots.default.some(vnode => {
            const tag = vnode.componentOptions && vnode.componentOptions.tag;
            return tag === `${this.$clsPrefix}-header` || tag === `${this.$clsPrefix}-footer`;
          })
          : false;
      }
    }
  };
</script>
