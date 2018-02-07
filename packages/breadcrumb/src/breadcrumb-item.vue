<template>
  <span :class="[`${$clsPrefix}-breadcrumb__item`]">
    <span :class="[`${$clsPrefix}-breadcrumb__inner`]" ref="link" role="link" :style="[itemStyle, lastItemStyle]">
      <slot></slot>
    </span>
    <i v-if="separatorClass" :class="[`${$clsPrefix}-breadcrumb__separator`, separatorClass]"></i>
    <span v-else :class="[`${$clsPrefix}-breadcrumb__separator`]" role="presentation">{{separator}}</span>
  </span>
</template>
<script>
  export default {
    name: 'BreadcrumbItem',
    props: {
      to: {},
      replace: Boolean
    },
    data() {
      return {
        separator: '',
        separatorClass: '',
        itemStyle: null,
        lastItemStyle: null
      };
    },

    inject: ['lvxBreadcrumb'],

    mounted() {
      this.separator = this.lvxBreadcrumb.separator;
      this.separatorClass = this.lvxBreadcrumb.separatorClass;
      this.itemStyle = this.lvxBreadcrumb.itemStyle;
      // this.lastItemStyle = this.lvxBreadcrumb.lastItemStyle;
      let self = this;
      if (this.to) {
        let link = this.$refs.link;
        link.setAttribute('role', 'link');
        link.addEventListener('click', _ => {
          let to = this.to;
          self.replace ? self.$router.replace(to)
                       : self.$router.push(to);
        });
      }
    }
  };
</script>
