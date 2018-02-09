<template>
  <div :class="[`${$clsPrefix}-breadcrumb`]" aria-label="Breadcrumb" role="navigation">
    <slot></slot>
  </div>
</template>
<script>
  export default {
    name: 'Breadcrumb',

    props: {
      separator: {
        type: String,
        default: '/'
      },
      separatorClass: {
        type: String,
        default: ''
      },
      itemStyle: {
        type: Object,
        default: null
      },
      lastItemStyle: {
        type: Object,
        default: null
      }
    },

    provide() {
      return {
        lvxBreadcrumb: this
      };
    },
    beforeMount() {
    },
    mounted() {
      if (this.$slots.default.length > 1) {
        this.$slots.default[this.$slots.default.length - 1].componentInstance.lastItemStyle = this.lastItemStyle;
      }
      const items = this.$el.querySelectorAll(`.${this.$clsPrefix}-breadcrumb__item`);
      if (items.length) {
        items[items.length - 1].setAttribute('aria-current', 'page');
      }
    }
  };
</script>
