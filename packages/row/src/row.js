export default {
  name: 'Row',

  componentName: 'Row',

  props: {
    tag: {
      type: String,
      default: 'div'
    },
    gutter: Number,
    type: String,
    justify: {
      type: String,
      default: 'start'
    },
    align: {
      type: String,
      default: 'top'
    }
  },
  data() {
    return {
      rowFlexClass: `${this.$clsPrefix}-row--flex`
    };
  },
  computed: {
    style() {
      var ret = {};

      if (this.gutter) {
        ret.marginLeft = `-${this.gutter / 2}px`;
        ret.marginRight = ret.marginLeft;
      }

      return ret;
    }
  },

  render(h) {
    return h(this.tag, {
      class: [
        `${this.$clsPrefix}-row`,
        this.justify !== 'start' ? `is-justify-${this.justify}` : '',
        this.align !== 'top' ? `is-align-${this.align}` : '',
        { [this.rowFlexClass]: this.type === 'flex' }
      ],
      style: this.style
    }, this.$slots.default);
  }
};
