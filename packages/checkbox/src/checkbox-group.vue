<script>
  import Emitter from '~/src/mixins/emitter';

  export default {
    name: 'CheckboxGroup',

    componentName: 'CheckboxGroup',

    mixins: [Emitter],

    inject: {
      lvxFormItem: {
        default: ''
      }
    },

    props: {
      value: {},
      disabled: Boolean,
      min: Number,
      max: Number,
      size: String
    },

    computed: {
      _elFormItemSize() {
        return (this.lvxFormItem || {}).elFormItemSize;
      },
      checkboxGroupSize() {
        return this.size || this._elFormItemSize || (this.$ELEMENT || {}).size;
      }
    },

    watch: {
      value(value) {
        this.dispatch('FormItem', 'event.form.change', [value]);
      }
    }
  };
</script>

<template>
  <div :class="[`${$clsPrefix}-checkbox-group`]" role="group" aria-label="checkbox-group">
    <slot></slot>
  </div>
</template>
