<style>
  
</style>
<template>
  <div>
    <el-button>默认按钮</el-button>
    <el-radio-group v-model="radio2" fill="#38c546"  text-color="#38c546">
      <el-radio :label="3">备选项</el-radio>
      <el-radio :label="6">备选项</el-radio>
      <el-radio :label="9">备选项</el-radio>
    </el-radio-group>
  </div>
</template>
<script>
  import Vue from 'vue';
  import Button from 'packages/button';
  
  Vue.use(Button);
  export default {
    data() {
      return {
        radio2: '3'
      };
    },
    watch: {
    },
    methods: {
    },
    created() {
    },
    mounted() {
    },
    destroyed() {
    },
    beforeDestroy() {
    }
  };
</script>
