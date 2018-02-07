<template>
  <transition :name="$clsPrefix+'-zoom-in-top'">
    <div :class="[`${$clsPrefix}-table-filter`]" v-if="multiple" v-show="showPopper">
      <div :class="[`${$clsPrefix}-table-filter__content`]">
        <lvx-checkbox-group :class="[`${$clsPrefix}-table-filter__checkbox-group`]" v-model="filteredValue">
          <lvx-checkbox
            v-for="filter in filters"
            :key="filter.value"
            :label="filter.value">{{ filter.text }}</lvx-checkbox>
        </lvx-checkbox-group>
      </div>
      <div :class="[`${$clsPrefix}-table-filter__bottom`]">
        <button @click="handleConfirm"
          :class="{ 'is-disabled': filteredValue.length === 0 }"
          :disabled="filteredValue.length === 0">{{ t('lang.table.confirmFilter') }}</button>
        <button @click="handleReset">{{ t('lang.table.resetFilter') }}</button>
      </div>
    </div>
    <div :class="[`${$clsPrefix}-table-filter`]" v-else v-show="showPopper">
      <ul :class="[`${$clsPrefix}-table-filter__list`]">
        <li 
            :class="[`${$clsPrefix}-table-filter__list-item`, { 'is-active': filterValue === undefined || filterValue === null }]"
            @click="handleSelect(null)">{{ t('lang.table.clearFilter') }}</li>
        <li 
            v-for="filter in filters"
            :label="filter.value"
            :key="filter.value"
            :class="[`${$clsPrefix}-table-filter__list-item`, { 'is-active': isActive(filter) }]"
            @click="handleSelect(filter.value)" >{{ filter.text }}</li>
      </ul>
    </div>
  </transition>
</template>

<script type="text/babel">
  import Popper from '~/src/utils/vue-popper';
  import { PopupManager } from '~/src/utils/popup';
  import Locale from '~/src/mixins/locale';
  import Clickoutside from '~/src/utils/clickoutside';
  import Dropdown from './dropdown';
  import Checkbox from '~/packages/checkbox';
  import CheckboxGroup from '~/packages/checkbox-group';

  export default {
    name: 'TableFilterPanel',

    mixins: [Popper, Locale],

    directives: {
      Clickoutside
    },

    components: {
      'LvxCheckbox': Checkbox,
      'LvxCheckboxGroup': CheckboxGroup
    },

    props: {
      placement: {
        type: String,
        default: 'bottom-end'
      }
    },

    customRender(h) {
      return (<div class={`${this.$clsPrefix}-table-filter`}>
        <div class={`${this.$clsPrefix}-table-filter__content`}>
        </div>
        <div class={`${this.$clsPrefix}-table-filter__bottom`}>
          <button on-click={ this.handleConfirm }>{ this.t('lang.table.confirmFilter') }</button>
          <button on-click={ this.handleReset }>{ this.t('lang.table.resetFilter') }</button>
        </div>
      </div>);
    },

    methods: {
      isActive(filter) {
        return filter.value === this.filterValue;
      },

      handleOutsideClick() {
        this.showPopper = false;
      },

      handleConfirm() {
        this.confirmFilter(this.filteredValue);
        this.handleOutsideClick();
      },

      handleReset() {
        this.filteredValue = [];
        this.confirmFilter(this.filteredValue);
        this.handleOutsideClick();
      },

      handleSelect(filterValue) {
        this.filterValue = filterValue;

        if ((typeof filterValue !== 'undefined') && (filterValue !== null)) {
          this.confirmFilter(this.filteredValue);
        } else {
          this.confirmFilter([]);
        }

        this.handleOutsideClick();
      },

      confirmFilter(filteredValue) {
        this.table.store.commit('filterChange', {
          column: this.column,
          values: filteredValue
        });
      }
    },

    data() {
      return {
        table: null,
        cell: null,
        column: null
      };
    },

    computed: {
      filters() {
        return this.column && this.column.filters;
      },

      filterValue: {
        get() {
          return (this.column.filteredValue || [])[0];
        },
        set(value) {
          if (this.filteredValue) {
            if ((typeof value !== 'undefined') && (value !== null)) {
              this.filteredValue.splice(0, 1, value);
            } else {
              this.filteredValue.splice(0, 1);
            }
          }
        }
      },

      filteredValue: {
        get() {
          if (this.column) {
            return this.column.filteredValue || [];
          }
          return [];
        },
        set(value) {
          if (this.column) {
            this.column.filteredValue = value;
          }
        }
      },

      multiple() {
        if (this.column) {
          return this.column.filterMultiple;
        }
        return true;
      }
    },

    mounted() {
      this.popperElm = this.$el;
      this.referenceElm = this.cell;
      this.table.bodyWrapper.addEventListener('scroll', () => {
        this.updatePopper();
      });

      this.$watch('showPopper', (value) => {
        if (this.column) this.column.filterOpened = value;
        if (value) {
          Dropdown.open(this);
        } else {
          Dropdown.close(this);
        }
      });
    },
    watch: {
      showPopper(val) {
        if (val === true && parseInt(this.popperJS._popper.style.zIndex, 10) < PopupManager.zIndex) {
          this.popperJS._popper.style.zIndex = PopupManager.nextZIndex();
        }
      }
    }
  };
</script>
