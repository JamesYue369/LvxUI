<template>
  <transition :name="name" @after-leave="doDestroy">
    <div
      v-show="showPopper"
      :class="[
        `${$clsPrefix}-autocomplete-suggestion`,
        `${$clsPrefix}-popper`,
        {'is-loading': parent.loading}
      ]"
      :style="{ width: dropdownWidth }"
      role="region"
    >
      <lvx-scrollbar
        tag="ul"
        :wrap-class="wrapClass"
        :view-class="viewClass"
      >
        <li v-if="parent.loading"><i :class="[`${$clsPrefix}-icon-loading`]"></i></li>
        <slot v-else>
        </slot>
      </lvx-scrollbar>
    </div>
  </transition>
</template>
<script>
  import Popper from '~/src/utils/vue-popper';
  import Emitter from '~/src/mixins/emitter';
  import Scrollbar from '~/packages/scrollbar';
  export default {
    components: {
      'LvxScrollbar': Scrollbar
    },
    mixins: [Popper, Emitter],

    componentName: 'AutocompleteSuggestions',

    data() {
      return {
        parent: this.$parent,
        dropdownWidth: '',
        wrapClass: `${this.$clsPrefix}-autocomplete-suggestion__wrap`,
        viewClass: `${this.$clsPrefix}-autocomplete-suggestion__list`,
        name: `${this.$clsPrefix}-zoom-in-top`
      };
    },

    props: {
      options: {
        default() {
          return {
            gpuAcceleration: false
          };
        }
      },
      id: String
    },

    methods: {
      select(item) {
        this.dispatch('Autocomplete', 'item-click', item);
      }
    },

    updated() {
      this.$nextTick(_ => {
        this.updatePopper();
      });
    },

    mounted() {
      this.$parent.popperElm = this.popperElm = this.$el;
      this.referenceElm = this.$parent.$refs.input.$refs.input;
      this.referenceList = this.$el.querySelector(`.${this.$clsPrefix}-autocomplete-suggestion__list`);
      this.referenceList.setAttribute('role', 'listbox');
      this.referenceList.setAttribute('id', this.id);
    },

    created() {
      this.$on('visible', (val, inputWidth) => {
        this.dropdownWidth = inputWidth + 'px';
        this.showPopper = val;
      });
    }
  };
</script>
