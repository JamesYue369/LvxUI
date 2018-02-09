<template>
  <div
    :class="[
    `${$clsPrefix}-upload-dragger`,
    {
      'is-dragover': dragover
    }]"
    @drop.prevent="onDrop"
    @dragover.prevent="onDragover"
    @dragleave.prevent="dragover = false"
  >
    <slot></slot>
  </div>
</template>
<script>
  export default {
    name: 'UploadDrag',
    props: {
      disabled: Boolean
    },
    data() {
      return {
        dragover: false
      };
    },
    methods: {
      onDragover() {
        if (!this.disabled) {
          this.dragover = true;
        }
      },
      onDrop(e) {
        if (!this.disabled) {
          this.dragover = false;
          this.$emit('file', e.dataTransfer.files);
        }
      }
    }
  };
</script>

