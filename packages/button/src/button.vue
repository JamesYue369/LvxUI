<template>
  <button
    class="el-button"
    @click="handleClick"
    @mouseover="mouseoverHandle"
    @mouseleave="mouseleaveHandle"
    :disabled="disabled"
    :autofocus="autofocus"
    :type="nativeType"
    :class="[
      type ? 'el-button--' + type : '',
      buttonSize ? 'el-button--' + buttonSize : '',
      {
        'is-disabled': disabled,
        'is-loading': loading,
        'is-plain': plain,
        'is-round': round
      }
    ]"
    :style="{
      'backgroundColor': fillColor,
      'borderColor': borderColor,
      'color': textColor
    }"
  >
    <i class="el-icon-loading" v-if="loading" @click="handleInnerClick"></i>
    <i :class="icon" v-if="icon && !loading" @click="handleInnerClick"></i>
    <span v-if="$slots.default" @click="handleInnerClick"><slot></slot></span>
  </button>
</template>
<script>
  import Color from 'color';
  import convert from 'color-convert';
  export default {
    name: 'ElButton',

    inject: {
      elFormItem: {
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
      round: Boolean
    },

    computed: {
      _elFormItemSize() {
        return (this.elFormItem || {}).elFormItemSize;
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
      },
      mouseoverHandle() {
        if (this.fillColor) {
          this.fillColor = `#${convert.rgb.hex(Color(this.fill).lighten(0.04).rgbArray())}`;
          this.borderColor = this.fillColor;
        }
      },
      mouseleaveHandle() {
        if (this.fillColor) {
          this.fillColor = this.fill;
          this.borderColor = this.fill;
        }
      }
    }
  };
</script>
