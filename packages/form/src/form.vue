<template>
  <form  :class="[
    `${$clsPrefix}-form`,
    labelPosition ? `${$clsPrefix}-form--label-` + labelPosition : '',
    { [`${$clsPrefix}-form--inline`]: inline }
  ]">
    <slot></slot>
  </form>
</template>
<script>
  export default {
    name: 'Form',

    componentName: 'Form',

    provide() {
      return {
        lvxForm: this
      };
    },

    props: {
      model: Object,
      rules: Object,
      labelPosition: String,
      labelWidth: String,
      labelSuffix: {
        type: String,
        default: ''
      },
      inline: Boolean,
      inlineMessage: Boolean,
      statusIcon: Boolean,
      showMessage: {
        type: Boolean,
        default: true
      },
      size: String
    },
    watch: {
      rules() {
        this.validate();
      }
    },
    data() {
      return {
        fields: []
      };
    },
    created() {
      this.$on('event.form.addField', (field) => {
        if (field) {
          this.fields.push(field);
        }
      });
      /* istanbul ignore next */
      this.$on('event.form.removeField', (field) => {
        if (field.prop) {
          this.fields.splice(this.fields.indexOf(field), 1);
        }
      });
    },
    methods: {
      resetFields() {
        if (!this.model) {
          process.env.NODE_ENV !== 'production' &&
          console.warn('[Lvx Warn][Form]model is required for resetFields to work.');
          return;
        }
        this.fields.forEach(field => {
          field.resetField();
        });
      },
      clearValidate() {
        this.fields.forEach(field => {
          field.clearValidate();
        });
      },
      validate(callback) {
        if (!this.model) {
          console.warn('[Lvx Warn][Form]model is required for validate to work!');
          return;
        }

        let promise;
        // if no callback, return promise
        if (typeof callback !== 'function' && window.Promise) {
          promise = new window.Promise((resolve, reject) => {
            callback = function(valid) {
              valid ? resolve(valid) : reject(valid);
            };
          });
        }

        let valid = true;
        let count = 0;
        // 如果需要验证的fields为空，调用验证时立刻返回callback
        if (this.fields.length === 0 && callback) {
          callback(true);
        }
        this.fields.forEach((field, index) => {
          field.validate('', errors => {
            if (errors) {
              valid = false;
            }
            if (typeof callback === 'function' && ++count === this.fields.length) {
              callback(valid);
            }
          });
        });

        if (promise) {
          return promise;
        }
      },
      validateField(prop, cb) {
        let field = this.fields.filter(field => field.prop === prop)[0];
        if (!field) { throw new Error('must call validateField with valid prop string!'); }

        field.validate('', cb);
      }
    }
  };
</script>
