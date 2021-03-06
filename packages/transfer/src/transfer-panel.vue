<template>
  <div :class="[`${$clsPrefix}-transfer-panel`]">
    <p :class="[`${$clsPrefix}-transfer-panel__header`]">
      <lvx-checkbox
        v-model="allChecked"
        @change="handleAllCheckedChange"
        :indeterminate="isIndeterminate">
        {{ title }}
        <span>{{ checkedSummary }}</span>
      </lvx-checkbox>
    </p>
    
    <div :class="[`${$clsPrefix}-transfer-panel__body`, hasFooter ? 'is-with-footer' : '']">
      <lvx-input
        :class="[`${$clsPrefix}-transfer-panel__filter`]"
        v-model="query"
        size="small"
        :placeholder="placeholder"
        @mouseenter.native="inputHover = true"
        @mouseleave.native="inputHover = false"
        v-if="filterable">
        <i slot="prefix"
          :class="[`${$clsPrefix}-input__icon`, `${$clsPrefix}-icon-` + inputIcon]"
          @click="clearQuery"
        ></i>
      </lvx-input>
      <lvx-checkbox-group
        v-model="checked"
        v-show="!hasNoMatch && data.length > 0"
        :class="[{ 'is-filterable': filterable }, `${$clsPrefix}-transfer-panel__list`]"
        >
        <lvx-checkbox
          :class="[`${$clsPrefix}-transfer-panel__item`]"
          :label="item[keyProp]"
          :disabled="item[disabledProp]"
          :key="item[keyProp]"
          v-for="item in filteredData">
          <option-content :option="item"></option-content>
        </lvx-checkbox>
      </lvx-checkbox-group>
      <p
        :class="[`${$clsPrefix}-transfer-panel__empty`]"
        v-show="hasNoMatch">{{ t('lang.transfer.noMatch') }}</p>
      <p
        :class="[`${$clsPrefix}-transfer-panel__empty`]"
        v-show="data.length === 0 && !hasNoMatch">{{ t('lang.transfer.noData') }}</p>
    </div>
    <p :class="[`${$clsPrefix}-transfer-panel__footer`]" v-if="hasFooter">
      <slot></slot>
    </p>
  </div>
</template>

<script>
  import CheckboxGroup from '~/packages/checkbox-group';
  import Checkbox from '~/packages/checkbox';
  import Input from '~/packages/input';
  import Locale from '~/src/mixins/locale';

  export default {
    mixins: [Locale],

    name: 'TransferPanel',

    componentName: 'TransferPanel',

    components: {
      'LvxCheckboxGroup': CheckboxGroup,
      'LvxCheckbox': Checkbox,
      'LvxInput': Input,
      OptionContent: {
        props: {
          option: Object
        },
        render(h) {
          const getParent = vm => {
            if (vm.$options.componentName === 'TransferPanel') {
              return vm;
            } else if (vm.$parent) {
              return getParent(vm.$parent);
            } else {
              return vm;
            }
          };
          const parent = getParent(this);
          return parent.renderContent
            ? parent.renderContent(h, this.option)
            : <span>{ this.option[parent.labelProp] || this.option[parent.keyProp] }</span>;
        }
      }
    },

    props: {
      data: {
        type: Array,
        default() {
          return [];
        }
      },
      renderContent: Function,
      placeholder: String,
      title: String,
      filterable: Boolean,
      format: Object,
      filterMethod: Function,
      defaultChecked: Array,
      props: Object
    },

    data() {
      return {
        checked: [],
        allChecked: false,
        query: '',
        inputHover: false
      };
    },

    watch: {
      checked(val) {
        this.updateAllChecked();
        this.$emit('checked-change', val);
      },

      data() {
        const checked = [];
        const filteredDataKeys = this.filteredData.map(item => item[this.keyProp]);
        this.checked.forEach(item => {
          if (filteredDataKeys.indexOf(item) > -1) {
            checked.push(item);
          }
        });
        this.checked = checked;
      },

      checkableData() {
        this.updateAllChecked();
      },

      defaultChecked: {
        immediate: true,
        handler(val, oldVal) {
          if (oldVal && val.length === oldVal.length &&
            val.every(item => oldVal.indexOf(item) > -1)) return;
          const checked = [];
          const checkableDataKeys = this.checkableData.map(item => item[this.keyProp]);
          val.forEach(item => {
            if (checkableDataKeys.indexOf(item) > -1) {
              checked.push(item);
            }
          });
          this.checked = checked;
        }
      }
    },

    computed: {
      filteredData() {
        return this.data.filter(item => {
          if (typeof this.filterMethod === 'function') {
            return this.filterMethod(this.query, item);
          } else {
            const label = item[this.labelProp] || item[this.keyProp].toString();
            return label.toLowerCase().indexOf(this.query.toLowerCase()) > -1;
          }
        });
      },

      checkableData() {
        return this.filteredData.filter(item => !item[this.disabledProp]);
      },

      checkedSummary() {
        const checkedLength = this.checked.length;
        const dataLength = this.data.length;
        const { noChecked, hasChecked } = this.format;
        if (noChecked && hasChecked) {
          return checkedLength > 0
            ? hasChecked.replace(/\${checked}/g, checkedLength).replace(/\${total}/g, dataLength)
            : noChecked.replace(/\${total}/g, dataLength);
        } else {
          return `${ checkedLength }/${ dataLength }`;
        }
      },

      isIndeterminate() {
        const checkedLength = this.checked.length;
        return checkedLength > 0 && checkedLength < this.checkableData.length;
      },

      hasNoMatch() {
        return this.query.length > 0 && this.filteredData.length === 0;
      },

      inputIcon() {
        return this.query.length > 0 && this.inputHover
          ? 'circle-close'
          : 'search';
      },

      labelProp() {
        return this.props.label || 'label';
      },

      keyProp() {
        return this.props.key || 'key';
      },

      disabledProp() {
        return this.props.disabled || 'disabled';
      },

      hasFooter() {
        return !!this.$slots.default;
      }
    },

    methods: {
      updateAllChecked() {
        const checkableDataKeys = this.checkableData.map(item => item[this.keyProp]);
        this.allChecked = checkableDataKeys.length > 0 &&
          checkableDataKeys.every(item => this.checked.indexOf(item) > -1);
      },

      handleAllCheckedChange(value) {
        this.checked = value
          ? this.checkableData.map(item => item[this.keyProp])
          : [];
      },

      clearQuery() {
        if (this.inputIcon === 'circle-close') {
          this.query = '';
        }
      }
    }
  };
</script>
