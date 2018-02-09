<template>
  <div :class="[`${$clsPrefix}-collapse-item`, {'is-active': isActive}]">
    <div
      role="tab"
      :aria-expanded="isActive"
      :aria-controls="`${$clsPrefix}-collapse-content-${id}`"
      :aria-describedby ="`${$clsPrefix}-collapse-content-${id}`"
    >
      <div
        @click="handleHeaderClick"
        role="button"
        :id="`${$clsPrefix}-collapse-head-${id}`"
        tabindex="0"
        @keyup.space.enter.stop="handleEnterClick"
        :class="[`${$clsPrefix}-collapse-item__header`, {'focusing': focusing}]"
        @focus="handleFocus"
        @blur="focusing = false"
      >
        <i :class="[`${$clsPrefix}-collapse-item__arrow ${$clsPrefix}-icon-arrow-right`]"></i>
        <slot name="title">{{title}}</slot>
      </div>
    </div>
    <lvx-collapse-transition>
      <div
        :class="[`${$clsPrefix}-collapse-item__wrap`]"
        v-show="isActive"
        role="tabpanel"
        :aria-hidden="!isActive"
        :aria-labelledby="`${$clsPrefix}-collapse-head-${id}`"
        :id="`${$clsPrefix}-collapse-content-${id}`"
      >
        <div :class="[`${$clsPrefix}-collapse-item__content`]">
          <slot></slot>
        </div>
      </div>
    </lvx-collapse-transition>
  </div>
</template>
<script>
  import CollapseTransition from '~/src/transitions/collapse-transition';
  import Emitter from '~/src/mixins/emitter';
  import { generateId } from '~/src/utils/util';

  export default {
    name: 'CollapseItem',

    componentName: 'CollapseItem',

    mixins: [Emitter],

    components: {
      'LvxCollapseTransition': CollapseTransition
    },

    data() {
      return {
        contentWrapStyle: {
          height: 'auto',
          display: 'block'
        },
        contentHeight: 0,
        focusing: false,
        isClick: false
      };
    },

    inject: ['collapse'],

    props: {
      title: String,
      name: {
        type: [String, Number],
        default() {
          return this._uid;
        }
      }
    },

    computed: {
      isActive() {
        return this.collapse.activeNames.indexOf(this.name) > -1;
      },
      id() {
        return generateId();
      }
    },

    methods: {
      handleFocus() {
        setTimeout(() => {
          if (!this.isClick) {
            this.focusing = true;
          } else {
            this.isClick = false;
          }
        }, 50);
      },
      handleHeaderClick() {
        this.dispatch('Collapse', 'item-click', this);
        this.focusing = false;
        this.isClick = true;
      },
      handleEnterClick() {
        this.dispatch('Collapse', 'item-click', this);
      }
    }
  };
</script>
