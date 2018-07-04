<template>
  <div
    :style="style"
    :class="[
      `${$clsPrefix}-step`,
      !isSimple && `is-${steps.direction}`,
      isSimple && 'is-simple',
      isLast && !space && !isCenter && 'is-flex',
      isCenter && !isVertical && !isSimple && 'is-center'
     ]">
    <!-- icon & line -->
    <div
      :class="[`${$clsPrefix}-step__head`, `is-${currentStatus}`]">
      <div
        :class="[`${$clsPrefix}-step__line`]"
        :style="[(isLast ? '' : { marginRight: steps.stepOffset + 'px' }), borderStyle]"
      >
        <i :class="[`${$clsPrefix}-step__line-inner`]" :style="[lineStyle, {borderStyle: steps.lineType}]"></i>
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
      borderStyle: {borderStyle: `${this.steps.lineType}`, borderColor: '#b4bccc'},
      internalStatus: ''
    };
  },

  created() {
    this.steps.steps.push(this);
  },

  beforeDestroy() {
    const steps = this.steps.steps;
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
      const prevStep = this.steps.steps[this.index - 1];
      return prevStep ? prevStep.currentStatus : 'wait';
    },
    isCenter() {
      return this.steps.alignCenter;
    },
    isVertical() {
      return this.steps.direction === 'vertical';
    },
    isSimple() {
      return this.steps.simple;
    },
    isLast() {
      const parent = this.steps;
      return parent.steps[parent.steps.length - 1] === this;
    },
    stepsCount() {
      return this.steps.steps.length;
    },
    space() {
      const { isSimple, $parent: { space } } = this;
      return isSimple ? '' : space ;
    },
    style: function() {
      const style = {};
      // const parent = this.steps;
      // const len = parent.steps.length;

      // const space = (typeof this.space === 'number'
      //   ? this.space + 'px'
      //   : this.space
      //     ? this.space
      //     : 100 / (len - 1) + '%');
      // style.flexBasis = space;

      if (typeof this.space === 'number') {
        style.width = `${this.space}px`;
      } else if (this.space) {
        style.width = this.space;
      } else {
        style.flex = '1';
      }

      if (this.isLast) {
        style.flex = 'none';
      }
      if (this.isVertical) return style;
      if (this.isLast) {
        // style.maxWidth = 100 / this.stepsCount + '%';
        style.flex = 'none';
        // ie11下最后的节点会有超出部分
      } else {
        style.marginRight = -this.steps.stepOffset + 'px';
      }

      return style;
    }
  },

  methods: {
    updateStatus(val) {
      const prevChild = this.steps.steps[this.index - 1];

      if (val > this.index) {
        this.internalStatus = this.steps.finishStatus;
      } else if (val === this.index && this.prevStatus !== 'error') {
        this.internalStatus = this.steps.processStatus;
      } else {
        this.internalStatus = 'wait';
      }

      if (prevChild) prevChild.calcProgress(this.internalStatus);
    },

    calcProgress(status) {
      let step = 100;
      const style = {};
      style.transitionDelay = 150 * this.index + 'ms';
      if (status === this.steps.processStatus) {
        step = this.currentStatus !== 'error' ? 0 : 0;
      } else if (status === 'wait') {
        step = 0;
        style.transitionDelay = (-150 * this.index) + 'ms';
      }

      style.borderWidth = step ? '1px' : 0;
      this.steps.direction === 'vertical'
        ? style.height = step + '%'
        : style.width = step + '%';

      this.lineStyle = style;
      if (status === 'success' || status === 'finish' || this.isSimple) {
        this.borderStyle.borderStyle = 'none';
        this.borderStyle.borderColor = 'inherit';
      } else {
        this.borderStyle.borderStyle = this.steps.lineType;
        this.borderStyle.borderColor = '#b4bccc';
      }
    }
  },

  mounted() {
    const unwatch = this.$watch('index', val => {
      this.$watch('steps.active', this.updateStatus, { immediate: true });
      unwatch();
    });
  }
};
</script>
