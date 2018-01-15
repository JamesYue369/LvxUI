<template>
  <div class="el-breadcrumb" aria-label="Breadcrumb" role="navigation">
    <slot></slot>
  </div>
</template>
<script>
  export default {
    name: 'ElBreadcrumb',

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
        elBreadcrumb: this
      };
    },
    beforeMount() {
    },
    mounted() {
      if (this.$slots.default.length > 1) {
        this.$slots.default[this.$slots.default.length - 1].componentInstance.lastItemStyle = this.lastItemStyle;
      }
      const items = this.$el.querySelectorAll('.el-breadcrumb__item');
      if (items.length) {
        items[items.length - 1].setAttribute('aria-current', 'page');
      }
    }
  };
</script>
