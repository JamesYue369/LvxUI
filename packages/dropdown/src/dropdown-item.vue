<template>
  <li
    :class="[
    `${$clsPrefix}-dropdown-menu__item`,
    {
      'is-disabled': disabled,
      [`${$clsPrefix}-dropdown-menu__item--divided`]: divided
    }]"
    @click="handleClick"
    :aria-disabled="disabled"
    :tabindex="disabled ? null : -1"
  >
    <slot></slot>
  </li>
</template>
<script>
  import Emitter from '~/src/mixins/emitter';

  export default {
    name: 'DropdownItem',

    mixins: [Emitter],

    props: {
      command: {},
      disabled: Boolean,
      divided: Boolean
    },

    methods: {
      handleClick(e) {
        this.dispatch('Dropdown', 'menu-item-click', [this.command, this]);
      }
    }
  };
</script>
