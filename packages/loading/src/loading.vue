<template>
  <transition :name="$clsPrefix+'-loading-fade'" @after-leave="handleAfterLeave">
    <div
      v-show="visible"
      :style="{ backgroundColor: background || '' }"
      :class="[`${$clsPrefix}-loading-mask`, customClass, { 'is-fullscreen': fullscreen }]">
      <div :style="spinnerStyle" :class="[`${$clsPrefix}-loading-spinner`, spinnerClass]">
        <svg v-if="!spinner && !spinnerHtml" class="circular" viewBox="25 25 50 50">
          <circle class="path" cx="50" cy="50" r="20" fill="none"/>
        </svg>
        <i v-if="spinner" :class="spinner"></i>
        <p v-if="text" :class="[`${$clsPrefix}-loading-text`]">{{ text }}</p>
        <div v-if="spinnerHtml" v-html="spinnerHtml">
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
  export default {
    data() {
      return {
        text: null,
        spinner: null,
        background: null,
        fullscreen: true,
        visible: false,
        customClass: '',
        spinnerStyle: null,
        spinnerClass: '',
        spinnerHtml: ''
      };
    },

    methods: {
      handleAfterLeave() {
        this.$emit('after-leave');
      },
      setText(text) {
        this.text = text;
      }
    }
  };
</script>
