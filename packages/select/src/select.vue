<template>
  <div
    :class="[`${$clsPrefix}-select`, selectSize ? `${$clsPrefix}-select--` + selectSize : '']"
    v-clickoutside="handleClose">
    <div
      :class="[`${$clsPrefix}-select__tags`]"
      v-if="multiple"
      @click.stop="toggleMenu"
      ref="tags"
      :style="{ 'max-width': inputWidth - 32 + 'px' }">
      <span
        :class="[`${$clsPrefix}-select__multiple-text`]"
        v-show="multipleText"
        v-if="collapseTags">
        {{ multipleText }}
      </span>
      <transition-group @after-leave="resetInputHeight" v-if="!collapseTags">
        <lvx-tag
          v-for="item in selected"
          :key="getValueKey(item)"
          :closable="!disabled"
          size="small"
          :hit="item.hitState"
          type="info"
          @close="deleteTag($event, item)"
          disable-transitions>
          <span :class="[`${$clsPrefix}-select__tags-text`]">{{ item.currentLabel }}</span>
        </lvx-tag>
      </transition-group>

      <input
        type="text"
        :class="[`${$clsPrefix}-select__input`, selectSize ? `is-${ selectSize }` : '']"
        :disabled="disabled"
        @focus="handleFocus"
        @click.stop
        @keyup="managePlaceholder"
        @keydown="resetInputState"
        @keydown.down.prevent="navigateOptions('next')"
        @keydown.up.prevent="navigateOptions('prev')"
        @keydown.enter.prevent="selectOption"
        @keydown.esc.stop.prevent="visible = false"
        @keydown.delete="deletePrevTag"
        v-model="query"
        @input="e => handleQueryChange(e.target.value)"
        :debounce="remote ? 300 : 0"
        v-if="filterable"
        :style="{ width: inputLength + 'px', 'max-width': inputWidth - 42 + 'px' }"
        ref="input">
    </div>
    <lvx-input
      ref="reference"
      v-model="selectedLabel"
      type="text"
      :placeholder="currentPlaceholder"
      :name="name"
      :id="id"
      :size="selectSize"
      :disabled="disabled"
      :readonly="!filterable || multiple"
      :validate-event="false"
      :class="{ 'is-focus': visible }"
      :prefix-icon="prefixIcon"
      @focus="handleFocus"
      @blur="handleBlur"
      @mousedown.native="handleMouseDown"
      @keyup.native="debouncedOnInputChange"
      @keydown.native.down.stop.prevent="navigateOptions('next')"
      @keydown.native.up.stop.prevent="navigateOptions('prev')"
      @keydown.native.enter.prevent="selectOption"
      @keydown.native.esc.stop.prevent="visible = false"
      @keydown.native.tab="visible = false"
      @paste.native="debouncedOnInputChange"
      @mouseenter.native="inputHovering = true"
      @mouseleave.native="inputHovering = false">
      <template slot="prefix"><slot name="prefix"></slot></template>
      
      <i slot="suffix"
       :class="[`${$clsPrefix}-select__caret`, `${$clsPrefix}-input__icon`, `${$clsPrefix}-icon-` + iconClass]"
       @click="handleIconClick"
      ></i>
    </lvx-input>
    <transition
      :name="$clsPrefix+'-zoom-in-top'"
      @before-enter="handleMenuEnter"
      @after-leave="doDestroy">
      <lvx-select-menu
        ref="popper"
        v-show="visible && emptyText !== false">
        <lvx-scrollbar
          tag="ul"
          :wrap-class="wrapClass"
          :view-class="viewClass"
          ref="scrollbar"
          :class="{ 'is-empty': !allowCreate && query && filteredOptionsCount === 0 }"
          v-show="options.length > 0 && !loading">
          <lvx-option
            :value="query"
            created
            v-if="showNewOption">
          </lvx-option>
          <slot></slot>
        </lvx-scrollbar>
        <p :class="[`${$clsPrefix}-select-dropdown__empty`]" v-if="emptyText && (allowCreate && options.length === 0 || !allowCreate)">{{ emptyText }}</p>
      </lvx-select-menu>
    </transition>
  </div>
</template>

<script type="text/babel">
  import Emitter from '~/src/mixins/emitter';
  import Focus from '~/src/mixins/focus';
  import Locale from '~/src/mixins/locale';
  import Input from '~/packages/input';
  import SelectMenu from './select-dropdown.vue';
  import Option from './option.vue';
  import Tag from '~/packages/tag';
  import Scrollbar from '~/packages/scrollbar';
  import debounce from 'throttle-debounce/debounce';
  import Clickoutside from '~/src/utils/clickoutside';
  import { addClass, removeClass, hasClass } from '~/src/utils/dom';
  import { addResizeListener, removeResizeListener } from '~/src/utils/resize-event';
  import { t } from '~/src/locale';
  import scrollIntoView from '~/src/utils/scroll-into-view';
  import { getValueByPath } from '~/src/utils/util';
  import { valueEquals } from '~/src/utils/util';
  import NavigationMixin from './navigation-mixin';

  const sizeMap = {
    'medium': 36,
    'small': 32,
    'mini': 28
  };

  export default {
    mixins: [Emitter, Locale, Focus('reference'), NavigationMixin],

    name: 'Select',

    componentName: 'Select',

    inject: {
      lvxFormItem: {
        default: ''
      }
    },

    provide() {
      return {
        'select': this
      };
    },

    computed: {
      _elFormItemSize() {
        return (this.lvxFormItem || {}).elFormItemSize;
      },
      iconClass() {
        let criteria = this.clearable &&
          !this.disabled &&
          this.inputHovering &&
          !this.multiple &&
          this.value !== undefined &&
          this.value !== '';
        return criteria ? 'circle-close is-show-close' : (this.remote && this.filterable ? '' : 'arrow-up');
      },

      debounce() {
        return this.remote ? 300 : 0;
      },

      emptyText() {
        if (this.loading) {
          return this.loadingText || this.t('lang.select.loading');
        } else {
          if (this.remote && this.query === '' && this.options.length === 0) return false;
          if (this.filterable && this.query && this.options.length > 0 && this.filteredOptionsCount === 0) {
            return this.noMatchText || this.t('lang.select.noMatch');
          }
          if (this.options.length === 0) {
            return this.noDataText || this.t('lang.select.noData');
          }
        }
        return null;
      },

      showNewOption() {
        let hasExistingOption = this.options.filter(option => !option.created)
          .some(option => option.currentLabel === this.query);
        return this.filterable && this.allowCreate && this.query !== '' && !hasExistingOption;
      },

      selectSize() {
        return this.size || this._elFormItemSize || (this.$ELEMENT || {}).size;
      },

      multipleText() {
        const selected = this.selected;
        if (!selected || !selected.length) return '';
        const length = selected.length;
        const countText = length > 1 ? `(+${ selected.length - 1 })` : '';
        return `${ selected[0].currentLabel } ${ countText }`;
      }
    },

    components: {
      'LvxInput': Input,
      'LvxSelectMenu': SelectMenu,
      'LvxOption': Option,
      'LvxTag': Tag,
      'LvxScrollbar': Scrollbar
    },

    directives: { Clickoutside },

    props: {
      name: String,
      id: String,
      value: {
        required: true
      },
      size: String,
      disabled: Boolean,
      clearable: Boolean,
      filterable: Boolean,
      allowCreate: Boolean,
      loading: Boolean,
      popperClass: String,
      remote: Boolean,
      loadingText: String,
      noMatchText: String,
      noDataText: String,
      remoteMethod: Function,
      filterMethod: Function,
      multiple: Boolean,
      multipleLimit: {
        type: Number,
        default: 0
      },
      placeholder: {
        type: String,
        default() {
          return t('lang.select.placeholder');
        }
      },
      defaultFirstOption: Boolean,
      reserveKeyword: Boolean,
      valueKey: {
        type: String,
        default: 'value'
      },
      collapseTags: Boolean,
      prefixIcon: String
    },

    data() {
      return {
        options: [],
        cachedOptions: [],
        createdLabel: null,
        createdSelected: false,
        selected: this.multiple ? [] : {},
        inputLength: 20,
        inputWidth: 0,
        cachedPlaceHolder: '',
        optionsCount: 0,
        filteredOptionsCount: 0,
        visible: false,
        selectedLabel: '',
        hoverIndex: -1,
        query: '',
        previousQuery: '',
        inputHovering: false,
        currentPlaceholder: '',
        wrapClass: `${this.$clsPrefix}-select-dropdown__wrap`,
        viewClass: `${this.$clsPrefix}-select-dropdown__list`
      };
    },

    watch: {
      disabled() {
        this.$nextTick(() => {
          this.resetInputHeight();
        });
      },

      placeholder(val) {
        this.cachedPlaceHolder = this.currentPlaceholder = val;
      },

      value(val) {
        if (this.multiple) {
          this.resetInputHeight();
          if (val.length > 0 || (this.$refs.input && this.query !== '')) {
            this.currentPlaceholder = '';
          } else {
            this.currentPlaceholder = this.cachedPlaceHolder;
          }
          if (this.filterable && !this.reserveKeyword) {
            this.query = '';
            this.handleQueryChange(this.query);
          }
        }
        this.setSelected();
        if (this.filterable && !this.multiple) {
          this.inputLength = 20;
        }
      },

      visible(val) {
        if (!val) {
          this.$refs.reference.$el.querySelector('input').blur();
          this.handleIconHide();
          this.broadcast('SelectDropdown', 'destroyPopper');
          if (this.$refs.input) {
            this.$refs.input.blur();
          }
          this.query = '';
          this.selectedLabel = '';
          this.inputLength = 20;
          this.resetHoverIndex();
          this.$nextTick(() => {
            if (this.$refs.input &&
              this.$refs.input.value === '' &&
              this.selected.length === 0) {
              this.currentPlaceholder = this.cachedPlaceHolder;
            }
          });
          if (!this.multiple) {
            if (this.selected) {
              if (this.filterable && this.allowCreate &&
                this.createdSelected && this.createdOption) {
                this.selectedLabel = this.createdLabel;
              } else {
                this.selectedLabel = this.selected.currentLabel;
              }
              if (this.filterable) this.query = this.selectedLabel;
            }
          }
        } else {
          this.handleIconShow();
          this.broadcast('SelectDropdown', 'updatePopper');
          if (this.filterable) {
            this.query = this.remote ? '' : this.selectedLabel;
            this.handleQueryChange(this.query);
            if (this.multiple) {
              this.$refs.input.focus();
            } else {
              if (!this.remote) {
                this.broadcast('Option', 'queryChange', '');
                this.broadcast('OptionGroup', 'queryChange');
              }
              this.broadcast('Input', 'inputSelect');
            }
          }
        }
        this.$emit('visible-change', val);
      },

      options() {
        if (this.$isServer) return;
        if (this.multiple) {
          this.resetInputHeight();
        }
        let inputs = this.$el.querySelectorAll('input');
        if ([].indexOf.call(inputs, document.activeElement) === -1) {
          this.setSelected();
        }
        if (this.defaultFirstOption && (this.filterable || this.remote) && this.filteredOptionsCount) {
          this.checkDefaultFirstOption();
        }
      }
    },

    methods: {
      handleQueryChange(val) {
        if (this.previousQuery === val) return;
        this.previousQuery = val;
        this.$nextTick(() => {
          if (this.visible) this.broadcast('SelectDropdown', 'updatePopper');
        });
        this.hoverIndex = -1;
        if (this.multiple && this.filterable) {
          const length = this.$refs.input.value.length * 15 + 20;
          this.inputLength = this.collapseTags ? Math.min(50, length) : length;
          this.managePlaceholder();
          this.resetInputHeight();
        }
        if (this.remote && typeof this.remoteMethod === 'function') {
          this.hoverIndex = -1;
          this.remoteMethod(val);
        } else if (typeof this.filterMethod === 'function') {
          this.filterMethod(val);
          this.broadcast('OptionGroup', 'queryChange');
        } else {
          this.filteredOptionsCount = this.optionsCount;
          this.broadcast('Option', 'queryChange', val);
          this.broadcast('OptionGroup', 'queryChange');
        }
        if (this.defaultFirstOption && (this.filterable || this.remote) && this.filteredOptionsCount) {
          this.checkDefaultFirstOption();
        }
      },

      handleIconHide() {
        let icon = this.$el.querySelector(`.${this.$clsPrefix}-input__icon`);
        if (icon) {
          removeClass(icon, 'is-reverse');
        }
      },

      handleIconShow() {
        let icon = this.$el.querySelector(`.${this.$clsPrefix}-input__icon`);
        if (icon && !hasClass(icon, `${this.$clsPrefix}-icon-circle-close`)) {
          addClass(icon, 'is-reverse');
        }
      },

      scrollToOption(option) {
        const target = Array.isArray(option) && option[0] ? option[0].$el : option.$el;
        if (this.$refs.popper && target) {
          const menu = this.$refs.popper.$el.querySelector(`.${this.$clsPrefix}-select-dropdown__wrap`);
          scrollIntoView(menu, target);
        }
        this.$refs.scrollbar && this.$refs.scrollbar.handleScroll();
      },

      handleMenuEnter() {
        this.$nextTick(() => this.scrollToOption(this.selected));
      },

      emitChange(val) {
        if (!valueEquals(this.value, val)) {
          this.$emit('change', val);
          this.dispatch('FormItem', 'event.form.change', val);
        }
      },

      getOption(value) {
        let option;
        const isObject = Object.prototype.toString.call(value).toLowerCase() === '[object object]';
        for (let i = this.cachedOptions.length - 1; i >= 0; i--) {
          const cachedOption = this.cachedOptions[i];
          const isEqual = isObject
            ? getValueByPath(cachedOption.value, this.valueKey) === getValueByPath(value, this.valueKey)
            : cachedOption.value === value;
          if (isEqual) {
            option = cachedOption;
            break;
          }
        }
        if (option) return option;
        const label = !isObject
          ? value : '';
        let newOption = {
          value: value,
          currentLabel: label
        };
        if (this.multiple) {
          newOption.hitState = false;
        }
        return newOption;
      },

      setSelected() {
        if (!this.multiple) {
          let option = this.getOption(this.value);
          if (option.created) {
            this.createdLabel = option.currentLabel;
            this.createdSelected = true;
          } else {
            this.createdSelected = false;
          }
          this.selectedLabel = option.currentLabel;
          this.selected = option;
          if (this.filterable) this.query = this.selectedLabel;
          return;
        }
        let result = [];
        if (Array.isArray(this.value)) {
          this.value.forEach(value => {
            result.push(this.getOption(value));
          });
        }
        this.selected = result;
        this.$nextTick(() => {
          this.resetInputHeight();
        });
      },

      handleFocus(event) {
        this.visible = true;
        this.$emit('focus', event);
      },

      handleBlur(event) {
        this.$emit('blur', event);
      },

      handleIconClick(event) {
        if (this.iconClass.indexOf('circle-close') > -1) {
          this.deleteSelected(event);
        } else {
          this.toggleMenu();
        }
      },

      handleMouseDown(event) {
        if (event.target.tagName !== 'INPUT') return;
        if (this.visible) {
          this.handleClose();
          event.preventDefault();
        }
      },

      doDestroy() {
        this.$refs.popper && this.$refs.popper.doDestroy();
      },

      handleClose() {
        this.visible = false;
      },

      toggleLastOptionHitState(hit) {
        if (!Array.isArray(this.selected)) return;
        const option = this.selected[this.selected.length - 1];
        if (!option) return;

        if (hit === true || hit === false) {
          option.hitState = hit;
          return hit;
        }

        option.hitState = !option.hitState;
        return option.hitState;
      },

      deletePrevTag(e) {
        if (e.target.value.length <= 0 && !this.toggleLastOptionHitState()) {
          const value = this.value.slice();
          value.pop();
          this.$emit('input', value);
          this.emitChange(value);
        }
      },

      managePlaceholder() {
        if (this.currentPlaceholder !== '') {
          this.currentPlaceholder = this.$refs.input.value ? '' : this.cachedPlaceHolder;
        }
      },

      resetInputState(e) {
        if (e.keyCode !== 8) this.toggleLastOptionHitState(false);
        this.inputLength = this.$refs.input.value.length * 15 + 20;
        this.resetInputHeight();
      },

      resetInputHeight() {
        if (this.collapseTags) return;
        this.$nextTick(() => {
          if (!this.$refs.reference) return;
          let inputChildNodes = this.$refs.reference.$el.childNodes;
          let input = [].filter.call(inputChildNodes, item => item.tagName === 'INPUT')[0];
          const tags = this.$refs.tags;
          input.style.height = this.selected.length === 0
            ? (sizeMap[this.selectSize] || 40) + 'px'
            : Math.max(tags ? (tags.clientHeight + 10) : 0, sizeMap[this.selectSize] || 40) + 'px';
          if (this.visible && this.emptyText !== false) {
            this.broadcast('SelectDropdown', 'updatePopper');
          }
        });
      },

      resetHoverIndex() {
        setTimeout(() => {
          if (!this.multiple) {
            this.hoverIndex = this.options.indexOf(this.selected);
          } else {
            if (this.selected.length > 0) {
              this.hoverIndex = Math.min.apply(null, this.selected.map(item => this.options.indexOf(item)));
            } else {
              this.hoverIndex = -1;
            }
          }
        }, 300);
      },

      handleOptionSelect(option) {
        if (this.multiple) {
          const value = this.value.slice();
          const optionIndex = this.getValueIndex(value, option.value);
          if (optionIndex > -1) {
            value.splice(optionIndex, 1);
          } else if (this.multipleLimit <= 0 || value.length < this.multipleLimit) {
            value.push(option.value);
          }
          this.$emit('input', value);
          this.emitChange(value);
          if (option.created) {
            this.query = '';
            this.handleQueryChange('');
            this.inputLength = 20;
          }
          if (this.filterable) this.$refs.input.focus();
        } else {
          this.$emit('input', option.value);
          this.emitChange(option.value);
          this.visible = false;
        }
        this.$nextTick(() => this.scrollToOption(option));
      },

      getValueIndex(arr = [], value) {
        const isObject = Object.prototype.toString.call(value).toLowerCase() === '[object object]';
        if (!isObject) {
          return arr.indexOf(value);
        } else {
          const valueKey = this.valueKey;
          let index = -1;
          arr.some((item, i) => {
            if (getValueByPath(item, valueKey) === getValueByPath(value, valueKey)) {
              index = i;
              return true;
            }
            return false;
          });
          return index;
        }
      },

      toggleMenu() {
        if (!this.disabled) {
          this.visible = !this.visible;
          if (this.visible) {
            (this.$refs.input || this.$refs.reference).focus();
          }
        }
      },

      selectOption() {
        if (this.options[this.hoverIndex]) {
          this.handleOptionSelect(this.options[this.hoverIndex]);
        }
      },

      deleteSelected(event) {
        event.stopPropagation();
        this.$emit('input', '');
        this.emitChange('');
        this.visible = false;
        this.$emit('clear');
      },

      deleteTag(event, tag) {
        let index = this.selected.indexOf(tag);
        if (index > -1 && !this.disabled) {
          const value = this.value.slice();
          value.splice(index, 1);
          this.$emit('input', value);
          this.emitChange(value);
          this.$emit('remove-tag', tag);
        }
        event.stopPropagation();
      },

      onInputChange() {
        if (this.filterable && this.query !== this.selectedLabel) {
          this.query = this.selectedLabel;
          this.handleQueryChange(this.query);
        }
      },

      onOptionDestroy(index) {
        if (index > -1) {
          this.optionsCount--;
          this.filteredOptionsCount--;
          this.options.splice(index, 1);
        }
      },

      resetInputWidth() {
        this.inputWidth = this.$refs.reference.$el.getBoundingClientRect().width;
      },

      handleResize() {
        this.resetInputWidth();
        if (this.multiple) this.resetInputHeight();
      },

      checkDefaultFirstOption() {
        this.hoverIndex = -1;
        for (let i = 0; i !== this.options.length; ++i) {
          const option = this.options[i];
          if (this.query) {
            // pick first options that passes the filter
            if (!option.disabled && !option.groupDisabled && option.visible) {
              this.hoverIndex = i;
              break;
            }
          } else {
            // pick currently selected option
            if (option.itemSelected) {
              this.hoverIndex = i;
              break;
            }
          }
        }
      },

      getValueKey(item) {
        if (Object.prototype.toString.call(item.value).toLowerCase() !== '[object object]') {
          return item.value;
        } else {
          return getValueByPath(item.value, this.valueKey);
        }
      }
    },

    created() {
      this.cachedPlaceHolder = this.currentPlaceholder = this.placeholder;
      if (this.multiple && !Array.isArray(this.value)) {
        this.$emit('input', []);
      }
      if (!this.multiple && Array.isArray(this.value)) {
        this.$emit('input', '');
      }

      this.debouncedOnInputChange = debounce(this.debounce, () => {
        this.onInputChange();
      });

      this.$on('handleOptionClick', this.handleOptionSelect);
      this.$on('setSelected', this.setSelected);
    },

    mounted() {
      if (this.multiple && Array.isArray(this.value) && this.value.length > 0) {
        this.currentPlaceholder = '';
      }
      addResizeListener(this.$el, this.handleResize);
      if (this.remote && this.multiple) {
        this.resetInputHeight();
      }
      this.$nextTick(() => {
        if (this.$refs.reference && this.$refs.reference.$el) {
          this.inputWidth = this.$refs.reference.$el.getBoundingClientRect().width;
        }
      });
      this.setSelected();
    },

    beforeDestroy() {
      if (this.$el && this.handleResize) removeResizeListener(this.$el, this.handleResize);
    }
  };
</script>
