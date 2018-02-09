<template>
  <div
    :class="[
       `${$clsPrefix}-steps`,
       !simple && `${$clsPrefix}-steps--` + direction,
       simple && `${$clsPrefix}-steps--simple`
     ]">
      <slot></slot>
  </div>
</template>

<script>
import Migrating from '~/src/mixins/migrating';

export default {
  name: 'Steps',

  mixins: [Migrating],

  provide() {
    return {
      steps: this
    };
  },

  props: {
    space: [Number, String],
    active: Number,
    direction: {
      type: String,
      default: 'horizontal'
    },
    alignCenter: Boolean,
    simple: Boolean,
    finishStatus: {
      type: String,
      default: 'finish'
    },
    processStatus: {
      type: String,
      default: 'process'
    },
    lineType: {
      type: String,
      default: 'solid'
    }
  },

  data() {
    return {
      steps: [],
      stepOffset: 0
    };
  },

  methods: {
    getMigratingConfig() {
      return {
        props: {
          'center': 'center is removed.'
        }
      };
    }
  },

  watch: {
    active(newVal, oldVal) {
      this.$emit('change', newVal, oldVal);
    },

    steps(steps) {
      steps.forEach((child, index) => {
        child.index = index;
      });
    }
  }
};
</script>
