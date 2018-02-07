<template>
  <main :class="[`${$clsPrefix}-main`]">
    <slot></slot>
  </main>
</template>

<script>
  export default {
    name: 'Main',
    componentName: 'Main'
  };
</script>
