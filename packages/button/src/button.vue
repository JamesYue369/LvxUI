<template>
  <button
    @click="handleClick"
    :disabled="disabled"
    :autofocus="autofocus"
    :type="nativeType"
    :class="[
      `${$clsPrefix}-button`,
      type ? `${$clsPrefix}-button--` + type : '',
      buttonSize ? `${$clsPrefix}-button--` + buttonSize : '',
      {
        'is-disabled': disabled,
        'is-loading': loading,
        'is-plain': plain,
        'is-round': round
      },
      buttonClass
    ]"
    :style="[{
      'backgroundColor': fillColor,
      'borderColor': borderColor,
      'color': textColor
    }, buttonStyle]"
  >
    <i :class="[`${$clsPrefix}-icon-loading`]" v-if="loading" @click="handleInnerClick"></i>
    <i :class="icon" v-if="icon && !loading" @click="handleInnerClick"></i>
    <span v-if="$slots.default" @click="handleInnerClick"><slot></slot></span>
  </button>
</template>
<script>
  export default {
    name: 'Button',
    inject: {
      lvxFormItem: {
        default: ''
      }
    },
    data() {
      return {
        fillColor: this.fill,
        borderColor: this.fillColor
      };
    },
    props: {
      type: {
        type: String,
        default: 'default'
      },
      fill: {
        type: String,
        default: ''
      },
      textColor: {
        type: String,
        default: ''
      },
      size: String,
      icon: {
        type: String,
        default: ''
      },
      nativeType: {
        type: String,
        default: 'button'
      },
      loading: Boolean,
      disabled: Boolean,
      plain: Boolean,
      autofocus: Boolean,
      round: Boolean,
      buttonStyle: {
        type: Object,
        default: null
      },
      buttonClass: {
        type: String,
        default: ''
      }
    },

    computed: {
      _elFormItemSize() {
        return (this.lvxFormItem || {}).elFormItemSize;
      },
      buttonSize() {
        return this.size || this._elFormItemSize || (this.$ELEMENT || {}).size;
      }
    },

    methods: {
      handleClick(evt) {
        this.$emit('click', evt);
      },
      handleInnerClick(evt) {
        if (this.disabled) {
          evt.stopPropagation();
        }
      }
    }
  };
</script>
