<template>
  <header :class="[`${$clsPrefix}-header`]" :style="{ height }">
    <slot></slot>
  </header>
</template>

<script>
  export default {
    name: 'Header',

    componentName: 'Header',

    props: {
      height: {
        type: String,
        default: '60px'
      }
    }
  };
</script>
