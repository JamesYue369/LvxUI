<template>
  <label
    class="el-radio"
    :class="[
      border && radioSize ? 'el-radio--' + radioSize : '',
      { 'is-disabled': isDisabled },
      { 'is-focus': focus },
      { 'is-bordered': border },
      { 'is-checked': model === label }
    ]"
    role="radio"
    :aria-checked="model === label"
    :aria-disabled="isDisabled"
    :tabindex="tabIndex"
    @keydown.space.stop.prevent="model = label"
  >
    <span class="el-radio__input"
      :class="{
        'is-disabled': isDisabled,
        'is-checked': model === label
      }"
    >
      <span class="el-radio__inner" @blur="blurHandle" @mouseover="mouseoverHandle" @mouseleave="mouseleaveHandle"  :style="[model === label ? activeStyle : null, {borderColor: borderColor},model === label ? null : {borderColor: ''}]"></span>
      <input
        class="el-radio__original"
        :value="label"
        type="radio"
        v-model="model"
        @focus="focus = true"
        @blur="focus = false"
        @change="handleChange"
        :name="name"
        :disabled="isDisabled"
        tabindex="-1"
      >
    </span>
    <span class="el-radio__label" :style="model === label ? textActiveStyle : null" >
      <slot></slot>
      <template v-if="!$slots.default">{{label}}</template>
    </span>
  </label>
</template>
<script>
  import Emitter from 'element-ui/src/mixins/emitter';

  export default {
    name: 'ElRadio',

    mixins: [Emitter],

    inject: {
      elFormItem: {
        default: ''
      }
    },

    componentName: 'ElRadio',

    props: {
      value: {},
      label: {},
      disabled: Boolean,
      name: String,
      border: Boolean,
      size: String
    },

    data() {
      return {
        focus: false,
        innerBorderColor: null,
        borderColor: null
      };
    },
    mounted() {
      let radio_inner = this.$el.querySelector('.el-radio__inner');
      this.innerBorderColor = getComputedStyle(radio_inner, null).borderColor;
    },
    computed: {
      isGroup() {
        let parent = this.$parent;
        while (parent) {
          if (parent.$options.componentName !== 'ElRadioGroup') {
            parent = parent.$parent;
          } else {
            // this._radioGroup = parent;
            return true;
          }
        }
        return false;
      },
      model: {
        get() {
          return this.isGroup ? this._radioGroup.value : this.value;
        },
        set(val) {
          if (this.isGroup) {
            this.dispatch('ElRadioGroup', 'input', [val]);
          } else {
            this.$emit('input', val);
          }
        }
      },
      _radioGroup() {
        let parent = this.$parent;
        while (parent) {
          if (parent.$options.componentName !== 'ElRadioGroup') {
            parent = parent.$parent;
          } else {
            return parent;
          }
        }
        return false;
      },
      _elFormItemSize() {
        return (this.elFormItem || {}).elFormItemSize;
      },
      radioSize() {
        const temRadioSize = this.size || this._elFormItemSize || (this.$ELEMENT || {}).size;
        return this.isGroup
          ? this._radioGroup.radioGroupSize || temRadioSize
          : temRadioSize;
      },
      isDisabled() {
        return this.isGroup
          ? this._radioGroup.disabled || this.disabled
          : this.disabled;
      },
      tabIndex() {
        return !this.isDisabled ? (this.isGroup ? (this.model === this.label ? 0 : -1) : 0) : -1;
      },
      activeStyle() {
        return {
          backgroundColor: this._radioGroup.fill || '',
          borderColor: this._radioGroup.fill || '',
          boxShadow: this._radioGroup.fill ? `-1px 0 0 0 ${this._radioGroup.fill}` : ''
        };
      },
      textActiveStyle() {
        return {
          color: this._radioGroup.textColor || ''
        };
      }
    },

    methods: {
      handleChange() {
        this.$nextTick(() => {
          this.$emit('change', this.model);
          this.isGroup && this.dispatch('ElRadioGroup', 'handleChange', this.model);
        });
      },
      mouseoverHandle() {
        this.borderColor = this._radioGroup.fill || '';
      },
      mouseleaveHandle() {
        this.model === this.label ? this.borderColor = this._radioGroup.fill : this.borderColor = this.innerBorderColor;
      },
      blurHandle() {
        this.borderColor = '';
      }
    }
  };
</script>
