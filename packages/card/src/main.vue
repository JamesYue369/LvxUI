<template>
  <div :class="[`${$clsPrefix}-card`]">
    <div :class="[`${$clsPrefix}-card__header`]" v-if="$slots.header || header">
      <slot name="header">{{ header }}</slot>
    </div>
    <div :class="[`${$clsPrefix}-card__body`]" :style="bodyStyle">
      <slot></slot>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'Card',

    props: ['header', 'bodyStyle']
  };
</script>
