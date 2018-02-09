<template>
  <div :class="[`${$clsPrefix}-button-group`]">
    <slot></slot>
  </div>
</template>
<script>
  export default {
    name: 'ButtonGroup'
  };
</script>
