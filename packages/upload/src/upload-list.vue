<template>
  <transition-group
    tag="ul"
    :class="[
      `${$clsPrefix}-upload-list`,
      `${$clsPrefix}-upload-list--` + listType,
      { 'is-disabled': disabled }
    ]"
    :name="$clsPrefix+'-list'"
  >
    <li
      v-for="(file, index) in files"
      :class="[`${$clsPrefix}-upload-list__item`, 'is-' + file.status, focusing ? 'focusing' : '']"
      :key="index"
      tabindex="0"
      @keydown.delete="!disabled && $emit('remove', file)"
      @focus="focusing = true"
      @blur="focusing = false"
      @click="focusing = false"
    >
      <img
        :class="[`${$clsPrefix}-upload-list__item-thumbnail`]"
        v-if="file.status !== 'uploading' && ['picture-card', 'picture'].indexOf(listType) > -1"
        :src="file.url" alt=""
      >
      <a :class="[`${$clsPrefix}-upload-list__item-name`]" @click="handleClick(file)">
        <i :class="[`${$clsPrefix}-icon-document`]"></i>{{file.name}}
      </a>
      <label :class="[`${$clsPrefix}-upload-list__item-status-label`]">
        <i :class="{
          [`${$clsPrefix}-icon-upload-success`]: true,
          [`${$clsPrefix}-icon-circle-check`]: listType === 'text',
          [`${$clsPrefix}-icon-check`]: ['picture-card', 'picture'].indexOf(listType) > -1
        }"></i>
      </label>
      <i :class="[`${$clsPrefix}-icon-close`]" v-if="!disabled" @click="$emit('remove', file)"></i>
      <i :class="[`${$clsPrefix}-icon-close-tip`]" v-if="!disabled">{{ t('lang.upload.deleteTip') }}</i> <!--因为close按钮只在li:focus的时候 display, li blur后就不存在了，所以键盘导航时永远无法 focus到 close按钮上-->
      <lvx-progress
        v-if="file.status === 'uploading'"
        :type="listType === 'picture-card' ? 'circle' : 'line'"
        :stroke-width="listType === 'picture-card' ? 6 : 2"
        :percentage="parsePercentage(file.percentage)">
      </lvx-progress>
      <span :class="[`${$clsPrefix}-upload-list__item-actions`]" v-if="listType === 'picture-card'">
        <span
          :class="[`${$clsPrefix}-upload-list__item-preview`]"
          v-if="handlePreview && listType === 'picture-card'"
          @click="handlePreview(file)"
        >
          <i :class="[`${$clsPrefix}-icon-zoom-in`]"></i>
        </span>
        <span
          v-if="!disabled"
          :class="[`${$clsPrefix}-upload-list__item-delete`]"
          @click="$emit('remove', file)"
        >
          <i :class="[`${$clsPrefix}-icon-delete`]"></i>
        </span>
      </span>
    </li>
  </transition-group>
</template>
<script>
  import Locale from '~/src/mixins/locale';
  import Progress from '~/packages/progress';

  export default {
    mixins: [Locale],

    data() {
      return {
        focusing: false
      };
    },
    components: {
      'LvxProgress': Progress
    },

    props: {
      files: {
        type: Array,
        default() {
          return [];
        }
      },
      disabled: {
        type: Boolean,
        default: false
      },
      handlePreview: Function,
      listType: String
    },
    methods: {
      parsePercentage(val) {
        return parseInt(val, 10);
      },
      handleClick(file) {
        this.handlePreview && this.handlePreview(file);
      }
    }
  };
</script>
