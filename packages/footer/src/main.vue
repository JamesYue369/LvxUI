<template>
  <footer :class="[`${$clsPrefix}-footer`]" :style="{ height }">
    <slot></slot>
  </footer>
</template>

<script>
  export default {
    name: 'Footer',

    componentName: 'Footer',

    props: {
      height: {
        type: String,
        default: '60px'
      }
    }
  };
</script>
