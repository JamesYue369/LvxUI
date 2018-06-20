<template>
  <div :class="[
    type === 'textarea' ? `${$clsPrefix}-textarea` : `${$clsPrefix}-input`,
    inputSize ? `${$clsPrefix}-input--` + inputSize : '',
    {
      'is-disabled': disabled,
      [inputGroupClass]: $slots.prepend || $slots.append,
      [inputGroupAppend]: $slots.append,
      [inputGroupPrepend]: $slots.prepend,
      [`${$clsPrefix}-input--prefix`]: $slots.prefix || prefixIcon,
      [`${$clsPrefix}-input--suffix`]: $slots.suffix || suffixIcon
    }
    ]"
    @mouseenter="hovering = true"
    @mouseleave="hovering = false"
  >
    <template v-if="type !== 'textarea'">
      <!-- 前置元素 -->
      <div :class="[`${$clsPrefix}-input-group__prepend`]" v-if="$slots.prepend"  tabindex="0">
        <slot name="prepend"></slot>
      </div>
      <input
        v-if="type !== 'textarea'"
        :class="[`${$clsPrefix}-input__inner`]"
        v-bind="$props"
        :autocomplete="autoComplete"
        :value="currentValue"
        ref="input"
        @input="handleInput"
        @focus="handleFocus"
        @blur="handleBlur"
        @change="handleChange"
        :aria-label="label"
        :style="[inputStyle, (disabled ? disabledStyle : null)]"
      >
      <!-- 前置内容 -->
      <span :class="[`${$clsPrefix}-input__prefix`]" v-if="$slots.prefix || prefixIcon" :style="prefixOffset">
        <slot name="prefix"></slot>
        <i 
           v-if="prefixIcon"
           :class="[`${$clsPrefix}-input__icon`, prefixIcon]">
        </i>
      </span>
      <!-- 后置内容 -->
      <span
        :class="[`${$clsPrefix}-input__suffix`]"
        v-if="$slots.suffix || suffixIcon || showClear || validateState && needStatusIcon"
        :style="suffixOffset">
        <span :class="[`${$clsPrefix}-input__suffix-inner`]">
          <template v-if="!showClear">
            <slot name="suffix"></slot>
            <i 
              v-if="suffixIcon"
              :class="[`${$clsPrefix}-input__icon`, suffixIcon]">
            </i>
          </template>
          <i v-else
            :class="[`${$clsPrefix}-input__icon`, `${$clsPrefix}-icon-circle-close`, `${$clsPrefix}-input__clear`]"
            @click="clear"
          ></i>
        </span>
        <i 
          v-if="validateState"
          :class="[`${$clsPrefix}-input__icon`, `e${$clsPrefix}-input__validateIcon`, validateIcon]">
        </i>
      </span>
      <!-- 后置元素 -->
      <div :class="[`${$clsPrefix}-input-group__append`]" v-if="$slots.append">
        <slot name="append"></slot>
      </div>
    </template>
    <textarea
      v-else
      :class="[`${$clsPrefix}-textarea__inner`]"
      :value="currentValue"
      @input="handleInput"
      ref="textarea"
      v-bind="$props"
      :style="[textareaStyle, inputStyle, (disabled ? disabledStyle : null)]"
      @focus="handleFocus"
      @blur="handleBlur"
      @change="handleChange"
      :aria-label="label"
    >

    </textarea>
    <span v-if="maxlength" :class="`${$clsPrefix}-textarea__tip`">{{currentValue?currentValue.length:0}}/{{maxlength}}字</span>
  </div>
</template>
<script>
  import emitter from '~/src/mixins/emitter';
  import Migrating from '~/src/mixins/migrating';
  import calcTextareaHeight from './calcTextareaHeight';
  import merge from '~/src/utils/merge';

  export default {
    name: 'Input',

    componentName: 'Input',

    mixins: [emitter, Migrating],

    inject: {
      lvxForm: {
        default: ''
      },
      lvxFormItem: {
        default: ''
      }
    },

    data() {
      return {
        currentValue: this.value,
        textareaCalcStyle: {},
        prefixOffset: null,
        suffixOffset: null,
        hovering: false,
        focused: false,
        inputGroupClass: `${this.$clsPrefix}-input-group`,
        inputGroupAppend: `${this.$clsPrefix}-input-group--append`,
        inputGroupPrepend: `${this.$clsPrefix}-input-group--prepend`
      };
    },

    props: {
      value: [String, Number],
      placeholder: String,
      size: String,
      resize: String,
      name: String,
      form: String,
      id: String,
      maxlength: Number,
      minlength: Number,
      readonly: Boolean,
      autofocus: Boolean,
      disabled: Boolean,
      type: {
        type: String,
        default: 'text'
      },
      autosize: {
        type: [Boolean, Object],
        default: false
      },
      rows: {
        type: Number,
        default: 2
      },
      autoComplete: {
        type: String,
        default: 'off'
      },
      max: {},
      min: {},
      step: {},
      validateEvent: {
        type: Boolean,
        default: true
      },
      suffixIcon: String,
      prefixIcon: String,
      label: String,
      clearable: {
        type: Boolean,
        default: false
      },
      inputStyle: {
        type: Object,
        default: null
      },
      disabledStyle: {
        type: Object,
        default: null
      }
    },

    computed: {
      _elFormItemSize() {
        return (this.lvxFormItem || {}).elFormItemSize;
      },
      validateState() {
        return this.lvxFormItem ? this.lvxFormItem.validateState : '';
      },
      needStatusIcon() {
        return this.lvxForm ? this.lvxForm.statusIcon : false;
      },
      validateIcon() {
        return {
          validating: `${this.$clsPrefix}-icon-loading`,
          success: `${this.$clsPrefix}-icon-circle-check`,
          error: `${this.$clsPrefix}-icon-circle-close`
        }[this.validateState];
      },
      textareaStyle() {
        return merge({}, this.textareaCalcStyle, { resize: this.resize });
      },
      inputSize() {
        return this.size || this._elFormItemSize || (this.$ELEMENT || {}).size;
      },
      isGroup() {
        return this.$slots.prepend || this.$slots.append;
      },
      showClear() {
        return this.clearable && this.currentValue !== '' && (this.focused || this.hovering);
      }
    },

    watch: {
      'value'(val, oldValue) {
        this.setCurrentValue(val);
      }
    },

    methods: {
      focus() {
        (this.$refs.input || this.$refs.textarea).focus();
      },
      getMigratingConfig() {
        return {
          props: {
            'icon': 'icon is removed, use suffix-icon / prefix-icon instead.',
            'on-icon-click': 'on-icon-click is removed.'
          },
          events: {
            'click': 'click is removed.'
          }
        };
      },
      handleBlur(event) {
        this.focused = false;
        this.$emit('blur', event);
        if (this.validateEvent) {
          this.dispatch('FormItem', 'event.form.blur', [this.currentValue]);
        }
      },
      inputSelect() {
        (this.$refs.input || this.$refs.textarea).select();
      },
      resizeTextarea() {
        if (this.$isServer) return;
        var { autosize, type } = this;
        if (type !== 'textarea') return;
        if (!autosize) {
          this.textareaCalcStyle = {
            minHeight: calcTextareaHeight(this.$refs.textarea).minHeight
          };
          return;
        }
        const minRows = autosize.minRows;
        const maxRows = autosize.maxRows;

        this.textareaCalcStyle = calcTextareaHeight(this.$refs.textarea, minRows, maxRows);
      },
      handleFocus(event) {
        this.focused = true;
        this.$emit('focus', event);
      },
      handleInput(event) {
        const value = event.target.value;
        this.$emit('input', value);
        this.setCurrentValue(value);
      },
      handleChange(event) {
        this.$emit('change', event.target.value);
      },
      setCurrentValue(value) {
        if (value === this.currentValue) return;
        this.$nextTick(_ => {
          this.resizeTextarea();
        });
        this.currentValue = value;
        if (this.validateEvent) {
          this.dispatch('FormItem', 'event.form.change', [value]);
        }
      },
      calcIconOffset(place) {
        const pendantMap = {
          'suf': 'append',
          'pre': 'prepend'
        };

        const pendant = pendantMap[place];

        if (this.$slots[pendant]) {
          return { transform: `translateX(${place === 'suf' ? '-' : ''}${this.$el.querySelector(`.${this.$clsPrefix}-input-group__${pendant}`).offsetWidth}px)` };
        }
      },
      clear() {
        this.$emit('input', '');
        this.$emit('change', '');
        this.setCurrentValue('');
        this.focus();
      }
    },

    created() {

      this.$on('inputSelect', this.inputSelect);
    },

    mounted() {
      this.resizeTextarea();
      if (this.isGroup) {
        this.prefixOffset = this.calcIconOffset('pre');
        this.suffixOffset = this.calcIconOffset('suf');
      }
    }
  };
</script>
