<template>
  <transition name="msgbox-fade">
    <div
      :class="[`${$clsPrefix}-message-box__wrapper`]"
      tabindex="-1"
      v-show="visible"
      @click.self="handleWrapperClick"
      role="dialog"
      aria-modal="true"
      :aria-label="title || 'dialog'"
    >
      <div :class="[`${$clsPrefix}-message-box`, customClass, center && `${$clsPrefix}-message-box--center`]">
        <div :class="[`${$clsPrefix}-message-box__header`]" v-if="title !== undefined">
          <div :class="[`${$clsPrefix}-message-box__title`]">
            <div :class="[`${$clsPrefix}-message-box__status`, typeClass ]" v-if="typeClass && center"></div>
            <span>{{ title }}</span>
          </div>
          <button type="button"
                  :class="[`${$clsPrefix}-message-box__headerbtn`]"
                  aria-label="Close"
                  v-if="showClose"
                  @click="handleAction('cancel')"
                  @keydown.enter="handleAction('cancel')"
          >
            <i :class="[`${$clsPrefix}-message-box__close ${$clsPrefix}-icon-close`]"></i>
          </button>
        </div>
        <div :class="[`${$clsPrefix}-message-box__content`]" v-if="message !== ''">
          <div :class="[`${$clsPrefix}-message-box__status`, typeClass ]" v-if="typeClass && !center"></div>
          <div :class="[`${$clsPrefix}-message-box__message`]">
            <slot>
              <p v-if="!dangerouslyUseHTMLString">{{ message }}</p>
              <p v-else v-html="message"></p>
            </slot>
          </div>
          <div :class="[`${$clsPrefix}-message-box__input`]" v-show="showInput">
            <lvx-input
              v-model="inputValue"
              :type="inputType"
              @compositionstart.native="handleComposition"
              @compositionupdate.native="handleComposition"
              @compositionend.native="handleComposition"
              @keyup.enter.native="handleKeyup"
              :placeholder="inputPlaceholder"
              ref="input"></lvx-input>
            <div :class="[`${$clsPrefix}-message-box__errormsg`]" :style="{ visibility: !!editorErrorMessage ? 'visible' : 'hidden' }">{{ editorErrorMessage }}</div>
          </div>
        </div>
        <div :class="[`${$clsPrefix}-message-box__btns`]">
          <lvx-button
            :loading="cancelButtonLoading"
            :class="[ cancelButtonClasses ]"
            v-show="showCancelButton"
            :round="roundButton"
            size="small"
            @click.native="handleAction('cancel')"
            @keydown.enter="handleAction('cancel')"
          >
            {{ cancelButtonText || t('lang.messagebox.cancel') }}
          </lvx-button>
          <lvx-button
            :loading="confirmButtonLoading"
            ref="confirm"
            :class="[ confirmButtonClasses ]"
            v-show="showConfirmButton"
            :round="roundButton"
            size="small"
            @click.native="handleAction('confirm')"
            @keydown.enter="handleAction('confirm')"
          >
            {{ confirmButtonText || t('lang.messagebox.confirm') }}
          </lvx-button>
        </div>
      </div>
    </div>
  </transition>
</template>

<script type="text/babel">
  import Popup from '~/src/utils/popup';
  import Locale from '~/src/mixins/locale';
  import Input from '~/packages/input';
  import Button from '~/packages/button';
  import { addClass, removeClass } from '~/src/utils/dom';
  import { t } from '~/src/locale';
  import Dialog from '~/src/utils/aria-dialog';

  let messageBox;
  let typeMap = {
    success: 'success',
    info: 'info',
    warning: 'warning',
    error: 'error'
  };

  export default {
    mixins: [Popup, Locale],

    props: {
      modal: {
        default: true
      },
      lockScroll: {
        default: true
      },
      showClose: {
        type: Boolean,
        default: true
      },
      closeOnClickModal: {
        default: true
      },
      closeOnPressEscape: {
        default: true
      },
      closeOnHashChange: {
        default: true
      },
      center: {
        default: false,
        type: Boolean
      },
      roundButton: {
        default: false,
        type: Boolean
      }
    },

    components: {
      'LvxInput': Input,
      'LvxButton': Button
    },

    computed: {
      typeClass() {
        return this.type && typeMap[this.type] ? `${this.$clsPrefix}-icon-${ typeMap[this.type] }` : '';
      },

      confirmButtonClasses() {
        return `${this.$clsPrefix}-button--primary ${ this.confirmButtonClass }`;
      },
      cancelButtonClasses() {
        return `${ this.cancelButtonClass }`;
      }
    },

    methods: {
      handleComposition(event) {
        if (event.type === 'compositionend') {
          setTimeout(() => {
            this.isOnComposition = false;
          }, 100);
        } else {
          this.isOnComposition = true;
        }
      },
      handleKeyup() {
        !this.isOnComposition && this.handleAction('confirm');
      },
      getSafeClose() {
        const currentId = this.uid;
        return () => {
          this.$nextTick(() => {
            if (currentId === this.uid) this.doClose();
          });
        };
      },
      doClose() {
        if (!this.visible) return;
        this.visible = false;
        this._closing = true;

        this.onClose && this.onClose();
        messageBox.closeDialog(); // 解绑
        if (this.lockScroll) {
          setTimeout(() => {
            if (this.modal && this.bodyOverflow !== 'hidden') {
              document.body.style.overflow = this.bodyOverflow;
              document.body.style.paddingRight = this.bodyPaddingRight;
            }
            this.bodyOverflow = null;
            this.bodyPaddingRight = null;
          }, 200);
        }
        this.opened = false;

        if (!this.transition) {
          this.doAfterClose();
        }
        setTimeout(() => {
          if (this.action) this.callback(this.action, this);
        });
      },

      handleWrapperClick() {
        if (this.closeOnClickModal) {
          this.handleAction('cancel');
        }
      },

      handleAction(action) {
        if (this.$type === 'prompt' && action === 'confirm' && !this.validate()) {
          return;
        }
        this.action = action;
        if (typeof this.beforeClose === 'function') {
          this.close = this.getSafeClose();
          this.beforeClose(action, this, this.close);
        } else {
          this.doClose();
        }
      },

      validate() {
        if (this.$type === 'prompt') {
          var inputPattern = this.inputPattern;
          if (inputPattern && !inputPattern.test(this.inputValue || '')) {
            this.editorErrorMessage = this.inputErrorMessage || t('lang.messagebox.error');
            addClass(this.getInputElement(), 'invalid');
            return false;
          }
          var inputValidator = this.inputValidator;
          if (typeof inputValidator === 'function') {
            var validateResult = inputValidator(this.inputValue);
            if (validateResult === false) {
              this.editorErrorMessage = this.inputErrorMessage || t('lang.messagebox.error');
              addClass(this.getInputElement(), 'invalid');
              return false;
            }
            if (typeof validateResult === 'string') {
              this.editorErrorMessage = validateResult;
              return false;
            }
          }
        }
        this.editorErrorMessage = '';
        removeClass(this.getInputElement(), 'invalid');
        return true;
      },
      getFistFocus() {
        const $btns = this.$el.querySelector(`.${this.$clsPrefix}-message-box__btns .${this.$clsPrefix}-button`);
        const $title = this.$el.querySelector(`.${this.$clsPrefix}-message-box__btns .${this.$clsPrefix}-message-box__title`);
        return $btns && $btns[0] || $title;
      },
      getInputElement() {
        const inputRefs = this.$refs.input.$refs;
        return inputRefs.input || inputRefs.textarea;
      }
    },

    watch: {
      inputValue: {
        immediate: true,
        handler(val) {
          this.$nextTick(_ => {
            if (this.$type === 'prompt' && val !== null) {
              this.validate();
            }
          });
        }
      },

      visible(val) {
        if (val) {
          this.uid++;
          if (this.$type === 'alert' || this.$type === 'confirm') {
            this.$nextTick(() => {
              this.$refs.confirm.$el.focus();
            });
          }
          this.focusAfterClosed = document.activeElement;
          messageBox = new Dialog(this.$el, this.focusAfterClosed, this.getFistFocus());
        }

        // prompt
        if (this.$type !== 'prompt') return;
        if (val) {
          setTimeout(() => {
            if (this.$refs.input && this.$refs.input.$el) {
              this.getInputElement().focus();
            }
          }, 500);
        } else {
          this.editorErrorMessage = '';
          removeClass(this.getInputElement(), 'invalid');
        }
      }
    },

    mounted() {
      if (this.closeOnHashChange) {
        window.addEventListener('hashchange', this.close);
      }
    },

    beforeDestroy() {
      if (this.closeOnHashChange) {
        window.removeEventListener('hashchange', this.close);
      }
      setTimeout(() => {
        messageBox.closeDialog();
      });
    },

    data() {
      return {
        uid: 1,
        title: undefined,
        message: '',
        type: '',
        customClass: '',
        showInput: false,
        inputValue: null,
        inputPlaceholder: '',
        inputType: 'text',
        inputPattern: null,
        inputValidator: null,
        inputErrorMessage: '',
        showConfirmButton: true,
        showCancelButton: false,
        action: '',
        confirmButtonText: '',
        cancelButtonText: '',
        confirmButtonLoading: false,
        cancelButtonLoading: false,
        confirmButtonClass: '',
        confirmButtonDisabled: false,
        cancelButtonClass: '',
        editorErrorMessage: null,
        callback: null,
        dangerouslyUseHTMLString: false,
        focusAfterClosed: null,
        isOnComposition: false
      };
    }
  };
</script>
