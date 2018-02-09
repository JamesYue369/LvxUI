<template>
  <transition name="dialog-fade">
    <div :class="[`${$clsPrefix}-dialog__wrapper`]" v-show="visible" @click.self="handleWrapperClick">
      <div
        :class="[`${$clsPrefix}-dialog`, { 'is-fullscreen': fullscreen, [`${$clsPrefix}-dialog--center`]: center }, customClass]"
        ref="dialog"
        :style="style">
        <div :style="titleStyle" :class="[`${$clsPrefix}-dialog__header`, titleClass]">
          <slot name="title">
            <span :class="[`${$clsPrefix}-dialog__title`]">{{ title }}</span>
          </slot>
          <button
            type="button"
            :class="[`${$clsPrefix}-dialog__headerbtn`]"
            aria-label="Close"
            v-if="showClose"
            @click="handleClose">
            <slot name="close">
            </slot>
            <i :class="[`${$clsPrefix}-dialog__close ${$clsPrefix}-icon ${$clsPrefix}-icon-close`]" v-if="!$slots.close"></i>
          </button>
        </div>
        <div :class="[`${$clsPrefix}-dialog__body`]" v-if="rendered"><slot></slot></div>
        <div :class="[`${$clsPrefix}-dialog__footer`]" v-if="$slots.footer">
          <slot name="footer"></slot>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
  import Popup from '~/src/utils/popup';
  import Migrating from '~/src/mixins/migrating';
  import emitter from '~/src/mixins/emitter';

  export default {
    name: 'Dialog',

    mixins: [Popup, emitter, Migrating],

    props: {
      title: {
        type: String,
        default: ''
      },

      modal: {
        type: Boolean,
        default: true
      },

      modalAppendToBody: {
        type: Boolean,
        default: true
      },

      appendToBody: {
        type: Boolean,
        default: false
      },

      lockScroll: {
        type: Boolean,
        default: true
      },

      closeOnClickModal: {
        type: Boolean,
        default: true
      },

      closeOnPressEscape: {
        type: Boolean,
        default: true
      },

      showClose: {
        type: Boolean,
        default: true
      },

      width: String,

      fullscreen: Boolean,

      customClass: {
        type: String,
        default: ''
      },

      top: {
        type: String,
        default: '15vh'
      },
      beforeClose: Function,
      center: {
        type: Boolean,
        default: false
      },
      titleStyle: {
        type: Object,
        default: null
      },
      titleClass: {
        type: String,
        default: ''
      }
    },

    data() {
      return {
        closed: false
      };
    },

    watch: {
      visible(val) {
        if (val) {
          this.closed = false;
          this.$emit('open');
          this.$el.addEventListener('scroll', this.updatePopper);
          this.$nextTick(() => {
            this.$refs.dialog.scrollTop = 0;
          });
          if (this.appendToBody) {
            document.body.appendChild(this.$el);
          }
        } else {
          this.$el.removeEventListener('scroll', this.updatePopper);
          if (!this.closed) this.$emit('close');
        }
      }
    },

    computed: {
      style() {
        let style = {};
        if (this.width) {
          style.width = this.width;
        }
        if (!this.fullscreen) {
          style.marginTop = this.top;
        }
        return style;
      }
    },

    methods: {
      getMigratingConfig() {
        return {
          props: {
            'size': 'size is removed.'
          }
        };
      },
      handleWrapperClick() {
        if (!this.closeOnClickModal) return;
        this.handleClose();
      },
      handleClose() {
        if (typeof this.beforeClose === 'function') {
          this.beforeClose(this.hide);
        } else {
          this.hide();
        }
      },
      hide(cancel) {
        if (cancel !== false) {
          this.$emit('update:visible', false);
          this.$emit('close');
          this.closed = true;
        }
      },
      updatePopper() {
        this.broadcast('SelectDropdown', 'updatePopper');
        this.broadcast('DropdownMenu', 'updatePopper');
      }
    },

    mounted() {
      if (this.visible) {
        this.rendered = true;
        this.open();
        if (this.appendToBody) {
          document.body.appendChild(this.$el);
        }
      }
    }
  };
</script>
