<template>
  <transition :name="disableTransitions ? '' : `${$clsPrefix}-zoom-in-center`">
    <span
      :class="[
        `${$clsPrefix}-tag`,
        type ? `${$clsPrefix}-tag--` + type : '',
        tagSize && `${$clsPrefix}-tag--${tagSize}`,
        {'is-hit': hit}
      ]"
      :style="{backgroundColor: color}">
      <slot></slot>
      <i :class="[`${$clsPrefix}-tag__close`, `${$clsPrefix}-icon-close`]"
        v-if="closable"
        @click.stop="handleClose"></i>
    </span>
  </transition>
</template>
<script>
  export default {
    name: 'Tag',
    props: {
      text: String,
      closable: Boolean,
      type: String,
      hit: Boolean,
      disableTransitions: Boolean,
      color: String,
      size: String
    },
    methods: {
      handleClose(event) {
        this.$emit('close', event);
      }
    },
    computed: {
      tagSize() {
        return this.size || (this.$ELEMENT || {}).size;
      }
    }
  };
</script>
