<template>
  <aside :class="[`${$clsPrefix}-aside`]" :style="{ width }">
    <slot></slot>
  </aside>
</template>

<script>
  export default {
    name: 'Aside',

    componentName: 'Aside',

    props: {
      width: {
        type: String,
        default: '300px'
      }
    }
  };
</script>
