<template>
  <transition :name="$clsPrefix+'-alert-fade'">
    <div
      :class="[`${$clsPrefix}-alert`, typeClass, center ? 'is-center' : '']"
      v-show="visible"
      role="alert"
    >
      <i :class="[`${$clsPrefix}-alert__icon`, iconClass, isBigIcon ]" v-if="showIcon"></i>
      <div :class="[`${$clsPrefix}-alert__content`]">
        <span :class="[`${$clsPrefix}-alert__title`, isBoldTitle ]" v-if="title">{{ title }}</span>
        <slot>
          <p :class="[`${$clsPrefix}-alert__description`]" v-if="description">{{ description }}</p>
        </slot>
        <i :class="[`${$clsPrefix}-alert__closebtn`, { 'is-customed': closeText !== '', [`${$clsPrefix}-icon-close`]: closeText === '' }]" v-show="closable" @click="close()">{{closeText}}</i>
      </div>
    </div>
  </transition>
</template>

<script type="text/babel">
  import config from '~/src/config';
  const TYPE_CLASSES_MAP = {
    'success': `${config.clsPrefix}-icon-success`,
    'warning': `${config.clsPrefix}-icon-warning`,
    'error': `${config.clsPrefix}-icon-error`
  };
  export default {
    name: 'Alert',

    props: {
      title: {
        type: String,
        default: '',
        required: true
      },
      description: {
        type: String,
        default: ''
      },
      type: {
        type: String,
        default: 'info'
      },
      closable: {
        type: Boolean,
        default: true
      },
      closeText: {
        type: String,
        default: ''
      },
      showIcon: Boolean,
      center: Boolean
    },

    data() {
      return {
        visible: true
      };
    },

    methods: {
      close() {
        this.visible = false;
        this.$emit('close');
      }
    },

    computed: {
      typeClass() {
        return `${this.$clsPrefix}-alert--${ this.type }`;
      },

      iconClass() {
        return TYPE_CLASSES_MAP[this.type] || `${this.$clsPrefix}-icon-info`;
      },

      isBigIcon() {
        return this.description || this.$slots.default ? 'is-big' : '';
      },

      isBoldTitle() {
        return this.description || this.$slots.default ? 'is-bold' : '';
      }
    }
  };
</script>
