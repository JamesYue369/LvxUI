<template>
  <div
    :style="style"
    :class="[
      `${$clsPrefix}-step`,
      !isSimple && `is-${$parent.direction}`,
      isSimple && 'is-simple',
      isLast && !space && !isCenter && 'is-flex',
      isCenter && !isVertical && !isSimple && 'is-center'
     ]">
    <!-- icon & line -->
    <div
      :class="[`${$clsPrefix}-step__head`, `is-${currentStatus}`]">
      <div
        :class="[`${$clsPrefix}-step__line`]"
        :style="[(isLast ? '' : { marginRight: $parent.stepOffset + 'px' }), borderStyle]"
      >
        <i :class="[`${$clsPrefix}-step__line-inner`]" :style="[lineStyle, {borderStyle: $parent.lineType}]"></i>
      </div>

      <div :class="[`${$clsPrefix}-step__icon`, `is-${icon ? 'icon' : 'text'}`]">
        <slot
          v-if="currentStatus !== 'success' && currentStatus !== 'error'"
          name="icon">
          <i v-if="icon" :class="[`${$clsPrefix}-step__icon-inner`, icon]" ></i>
          <div :class="[`${$clsPrefix}-step__icon-inner`]" v-if="!icon && !isSimple">{{ index + 1 }}</div>
        </slot>
        <i
          v-else
          :class="[`${$clsPrefix}-icon-` + (currentStatus === 'success' ? 'check' : 'close'), `${$clsPrefix}-step__icon-inner is-status`]"
        >
        </i>
      </div>
    </div>
    <!-- title & description -->
    <div :class="[`${$clsPrefix}-step__main`]">
      <div
        ref="title"
        :class="[`${$clsPrefix}-step__title`, 'is-' + currentStatus]">
        <slot name="title">{{ title }}</slot>
      </div>
      <div v-if="isSimple" :class="[`${$clsPrefix}-step__arrow`]"></div>
      <div
        v-else
        :class="[`${$clsPrefix}-step__description`, 'is-' + currentStatus]">
        <slot name="description">{{ description }}</slot>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Step',

  props: {
    title: String,
    icon: String,
    description: String,
    status: String
  },

  inject: ['steps'],

  data() {
    return {
      index: -1,
      lineStyle: {},
      borderStyle: {borderStyle: `${this.$parent.lineType}`, borderColor: '#b4bccc'},
      internalStatus: ''
    };
  },

  created() {
    this.$parent.steps.push(this);
  },

  beforeDestroy() {
    const steps = this.$parent.steps;
    const index = steps.indexOf(this);
    if (index >= 0) {
      steps.splice(index, 1);
    }
  },

  computed: {
    currentStatus() {
      return this.status || this.internalStatus;
    },
    prevStatus() {
      const prevStep = this.$parent.steps[this.index - 1];
      return prevStep ? prevStep.currentStatus : 'wait';
    },
    isCenter() {
      return this.$parent.alignCenter;
    },
    isVertical() {
      return this.$parent.direction === 'vertical';
    },
    isSimple() {
      return this.$parent.simple;
    },
    isLast() {
      const parent = this.$parent;
      return parent.steps[parent.steps.length - 1] === this;
    },
    stepsCount() {
      return this.$parent.steps.length;
    },
    space() {
      const { isSimple, $parent: { space } } = this;
      return isSimple ? '' : space ;
    },
    style: function() {
      const style = {};
      const parent = this.$parent;
      const len = parent.steps.length;

      const space = (typeof this.space === 'number'
        ? this.space + 'px'
        : this.space
          ? this.space
          : 100 / (len - 1) + '%');
      style.flexBasis = space;
      if (this.isVertical) return style;
      if (this.isLast) {
        style.maxWidth = 100 / this.stepsCount + '%';
      } else {
        style.marginRight = -this.$parent.stepOffset + 'px';
      }

      return style;
    }
  },

  methods: {
    updateStatus(val) {
      const prevChild = this.$parent.$children[this.index - 1];

      if (val > this.index) {
        this.internalStatus = this.$parent.finishStatus;
      } else if (val === this.index && this.prevStatus !== 'error') {
        this.internalStatus = this.$parent.processStatus;
      } else {
        this.internalStatus = 'wait';
      }

      if (prevChild) prevChild.calcProgress(this.internalStatus);
    },

    calcProgress(status) {
      let step = 100;
      const style = {};
      style.transitionDelay = 150 * this.index + 'ms';
      if (status === this.$parent.processStatus) {
        step = this.currentStatus !== 'error' ? 0 : 0;
      } else if (status === 'wait') {
        step = 0;
        style.transitionDelay = (-150 * this.index) + 'ms';
      }

      style.borderWidth = step ? '1px' : 0;
      this.$parent.direction === 'vertical'
        ? style.height = step + '%'
        : style.width = step + '%';

      this.lineStyle = style;
      if (status === 'success' || status === 'finish' || this.isSimple) {
        this.borderStyle.borderStyle = 'none';
        this.borderStyle.borderColor = 'inherit';
      } else {
        this.borderStyle.borderStyle = this.$parent.lineType;
        this.borderStyle.borderColor = '#b4bccc';
      }
    }
  },

  mounted() {
    const unwatch = this.$watch('index', val => {
      this.$watch('$parent.active', this.updateStatus, { immediate: true });
      unwatch();
    });
  }
};
</script>
