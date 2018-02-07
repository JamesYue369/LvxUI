import Pager from './pager.vue';
import Select from '~/packages/select';
import Option from '~/packages/option';
import Input from '~/packages/input';
import Locale from '~/src/mixins/locale';
import { valueEquals } from '~/src/utils/util';

export default {
  name: 'Pagination',

  props: {
    pageSize: {
      type: Number,
      default: 10
    },

    small: Boolean,

    total: Number,

    pageCount: Number,

    currentPage: {
      type: Number,
      default: 1
    },

    layout: {
      default: 'prev, pager, next, jumper, ->, total'
    },

    pageSizes: {
      type: Array,
      default() {
        return [10, 20, 30, 40, 50, 100];
      }
    },

    popperClass: String,

    prevText: String,

    preClass: {
      type: String,
      default: ''
    },

    preStyle: {
      type: Object,
      default: null
    },

    nextText: String,

    nextClass: {
      type: String,
      default: ''
    },

    nextStyle: {
      type: Object,
      default: null
    },

    background: Boolean,

    morePages: {
      type: Number,
      default: 6,
      validator: function(value) {
        return value >= 5;
      }
    },

    moreClass: {
      type: String,
      default: ''
    },

    moreStyle: {
      type: Object,
      default: null
    },

    pagerClass: {
      type: String,
      default: ''
    },

    pagerStyle: {
      type: Object,
      default: null
    },

    activeClass: {
      type: String,
      default: ''
    },

    activeStyle: {
      type: Object,
      default: null
    }
  },

  data() {
    return {
      internalCurrentPage: 1,
      internalPageSize: 0
    };
  },

  render(h) {
    let template = <div class={[`${this.$clsPrefix}-pagination`, {
      'is-background': this.background,
      [`${this.$clsPrefix}-pagination--small`]: this.small
    }] }></div>;
    const layout = this.layout || '';
    if (!layout) return;
    const TEMPLATE_MAP = {
      prev: <prev></prev>,
      jumper: <jumper></jumper>,
      pager: <pager
        currentPage={ this.internalCurrentPage }
        pageCount={ this.internalPageCount }
        more-pages={this.morePages}
        more-class={this.moreClass}
        more-style={this.moreStyle}
        pager-class={this.pagerClass}
        pager-style={this.pagerStyle}
        active-class={this.activeClass}
        active-style={this.activeStyle}
        on-change={ this.handleCurrentChange }></pager>,
      next: <next></next>,
      sizes: <sizes pageSizes={ this.pageSizes }></sizes>,
      slot: <my-slot></my-slot>,
      total: <total></total>
    };
    const components = layout.split(',').map((item) => item.trim());
    const rightWrapper = <div class={`${this.$clsPrefix}-pagination__rightwrapper`}></div>;
    let haveRightWrapper = false;

    components.forEach(compo => {
      if (compo === '->') {
        haveRightWrapper = true;
        return;
      }

      if (!haveRightWrapper) {
        template.children.push(TEMPLATE_MAP[compo]);
      } else {
        rightWrapper.children.push(TEMPLATE_MAP[compo]);
      }
    });

    if (haveRightWrapper) {
      template.children.unshift(rightWrapper);
    }

    return template;
  },

  components: {
    MySlot: {
      render(h) {
        return (
          this.$parent.$slots.default
          ? this.$parent.$slots.default[0]
          : ''
        );
      }
    },
    Prev: {
      render(h) {
        return (
          <button
            type="button"
            class={['btn-prev', { disabled: this.$parent.internalCurrentPage <= 1 }, this.$parent.preClass]}
            style={this.$parent.preStyle}
            on-click={ this.$parent.prev }>
            {
              this.$parent.prevText
                ? <span>{ this.$parent.prevText }</span>
                : <i class={`${this.$clsPrefix}-icon ${this.$clsPrefix}-icon-arrow-left`}></i>
            }
          </button>
        );
      }
    },

    Next: {
      render(h) {
        return (
          <button
            type="button"
            class={[
              'btn-next',
              { disabled: this.$parent.internalCurrentPage === this.$parent.internalPageCount || this.$parent.internalPageCount === 0 },
              this.$parent.nextClass
            ]}
            style={[this.$parent.nextStyle]}
            on-click={ this.$parent.next }>
            {
              this.$parent.nextText
                ? <span>{ this.$parent.nextText }</span>
                : <i class={`${this.$clsPrefix}-icon ${this.$clsPrefix}-icon-arrow-right`}></i>
            }
          </button>
        );
      }
    },

    Sizes: {
      mixins: [Locale],

      props: {
        pageSizes: Array
      },

      watch: {
        pageSizes: {
          immediate: true,
          handler(newVal, oldVal) {
            if (valueEquals(newVal, oldVal)) return;
            if (Array.isArray(newVal)) {
              this.$parent.internalPageSize = newVal.indexOf(this.$parent.pageSize) > -1
                ? this.$parent.pageSize
                : this.pageSizes[0];
            }
          }
        }
      },

      render(h) {
        return (
          <span class={`${this.$clsPrefix}-pagination__sizes`}>
            <lvx-select
              value={ this.$parent.internalPageSize }
              popperClass={ `${this.$parent.popperClass || ''} is-arrow-fixed` }
              on-input={ this.handleChange }>
              {
                this.pageSizes.map(item =>
                  <lvx-option
                    value={ item }
                    label={ item + this.t('lang.pagination.pagesize') }>
                  </lvx-option>
                )
              }
            </lvx-select>
          </span>
        );
      },

      components: {
        'LvxSelect': Select,
        'LvxOption': Option
      },

      methods: {
        handleChange(val) {
          if (val !== this.$parent.internalPageSize) {
            this.$parent.internalPageSize = val = parseInt(val, 10);
            this.$parent.$emit('size-change', val);
          }
        }
      }
    },

    Jumper: {
      mixins: [Locale],

      data() {
        return {
          oldValue: null
        };
      },

      components: {
        'LvxInput': Input
      },

      methods: {
        handleFocus(event) {
          this.oldValue = event.target.value;
        },
        handleBlur({ target }) {
          this.resetValueIfNeed(target.value);
          this.reassignMaxValue(target.value);
        },
        handleChange(value) {
          this.$parent.internalCurrentPage = this.$parent.getValidCurrentPage(value);
          this.oldValue = null;
          this.resetValueIfNeed(value);
        },
        resetValueIfNeed(value) {
          const num = parseInt(value, 10);
          if (!isNaN(num)) {
            if (num < 1) {
              this.$refs.input.$el.querySelector('input').value = 1;
            } else {
              this.reassignMaxValue(value);
            }
          }
        },
        reassignMaxValue(value) {
          if (+value > this.$parent.internalPageCount) {
            this.$refs.input.$el.querySelector('input').value = this.$parent.internalPageCount;
          }
        }
      },

      render(h) {
        return (
          <span class={`${this.$clsPrefix}-pagination__jump`}>
            { this.t('lang.pagination.goto') }
            <lvx-input
              class={`${this.$clsPrefix}-pagination__editor is-in-pagination`}
              min={ 1 }
              max={ this.$parent.internalPageCount }
              value={ this.$parent.internalCurrentPage }
              domPropsValue={ this.$parent.internalCurrentPage }
              type="number"
              ref="input"
              onChange={ this.handleChange }
              onFocus={ this.handleFocus }
              onBlur={ this.handleBlur }/>
            { this.t('lang.pagination.pageClassifier') }
          </span>
        );
      }
    },

    Total: {
      mixins: [Locale],

      render(h) {
        return (
          typeof this.$parent.total === 'number'
            ? <span class={`${this.$clsPrefix}-pagination__total`}>{ this.t('lang.pagination.total', { total: this.$parent.total }) }</span>
            : ''
        );
      }
    },

    Pager
  },

  methods: {
    handleCurrentChange(val) {
      this.internalCurrentPage = this.getValidCurrentPage(val);
    },

    prev() {
      const newVal = this.internalCurrentPage - 1;
      this.internalCurrentPage = this.getValidCurrentPage(newVal);
    },

    next() {
      const newVal = this.internalCurrentPage + 1;
      this.internalCurrentPage = this.getValidCurrentPage(newVal);
    },

    getValidCurrentPage(value) {
      value = parseInt(value, 10);

      const havePageCount = typeof this.internalPageCount === 'number';

      let resetValue;
      if (!havePageCount) {
        if (isNaN(value) || value < 1) resetValue = 1;
      } else {
        if (value < 1) {
          resetValue = 1;
        } else if (value > this.internalPageCount) {
          resetValue = this.internalPageCount;
        }
      }

      if (resetValue === undefined && isNaN(value)) {
        resetValue = 1;
      } else if (resetValue === 0) {
        resetValue = 1;
      }

      return resetValue === undefined ? value : resetValue;
    }
  },

  computed: {
    internalPageCount() {
      if (typeof this.total === 'number') {
        return Math.ceil(this.total / this.internalPageSize);
      } else if (typeof this.pageCount === 'number') {
        return this.pageCount;
      }
      return null;
    }
  },

  watch: {
    currentPage: {
      immediate: true,
      handler(val) {
        this.internalCurrentPage = val;
      }
    },

    pageSize: {
      immediate: true,
      handler(val) {
        this.internalPageSize = val;
      }
    },

    internalCurrentPage(newVal, oldVal) {
      newVal = parseInt(newVal, 10);

      /* istanbul ignore if */
      if (isNaN(newVal)) {
        newVal = oldVal || 1;
      } else {
        newVal = this.getValidCurrentPage(newVal);
      }

      if (newVal !== undefined) {
        this.$nextTick(() => {
          this.internalCurrentPage = newVal;
          if (oldVal !== newVal) {
            this.$emit('update:currentPage', newVal);
            this.$emit('current-change', this.internalCurrentPage);
          }
        });
      } else {
        this.$emit('update:currentPage', newVal);
        this.$emit('current-change', this.internalCurrentPage);
      }
    },

    internalPageCount(newVal) {
      /* istanbul ignore if */
      const oldPage = this.internalCurrentPage;
      if (newVal > 0 && oldPage === 0) {
        this.internalCurrentPage = 1;
      } else if (oldPage > newVal) {
        this.internalCurrentPage = newVal === 0 ? 1 : newVal;
      }
    }
  }
};