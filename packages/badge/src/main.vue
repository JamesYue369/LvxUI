<template>
  <div :class="[`${$clsPrefix}-badge`]">
    <slot></slot>
    <transition :name="$clsPrefix + '-zoom-in-center'">
      <sup
        v-show="!hidden && ( content || isDot )"
        v-text="content"
        :class="[`${$clsPrefix}-badge__content`, { 'is-fixed': $slots.default, 'is-dot': isDot }]">
      </sup>
    </transition>
  </div>
</template>

<script>
export default {
  name: 'Badge',

  props: {
    value: {},
    max: Number,
    isDot: Boolean,
    hidden: Boolean
  },

  computed: {
    content() {
      if (this.isDot) return;

      const value = this.value;
      const max = this.max;

      if (typeof value === 'number' && typeof max === 'number') {
        return max < value ? `${max}+` : value;
      }

      return value;
    }
  }
};
</script>
