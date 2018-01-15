<template>
  <ul @click="onPagerClick" class="el-pager">
    <li
      :class="[{ active: currentPage === 1 }, pagerClass, (currentPage === 1 ? activeClass : '')]"
      v-if="pageCount > 0"
      :style="[pagerStyle, currentPage === 1 ? activeStyle : null]"
      class="number">1</li>
    <li
      class="el-icon more btn-quickprev"
      :class="[quickprevIconClass, moreClass]"
      :style="[moreStyle]"
      v-if="showPrevMore"
      @mouseenter="quickprevIconClass = 'el-icon-d-arrow-left'"
      @mouseleave="quickprevIconClass = 'el-icon-more'">
    </li>
    <li
      v-for="pager in pagers"
      :class="[{ active: currentPage === pager }, pagerClass, currentPage === pager ? activeClass : '']"
      class="number"
      :style="[pagerStyle, currentPage === pager ? activeStyle : null]"
      >{{ pager }}</li>
    <li
      class="el-icon more btn-quicknext"
      :class="[quicknextIconClass, moreClass]"
      :style="[moreStyle]"
      v-if="showNextMore"
      @mouseenter="quicknextIconClass = 'el-icon-d-arrow-right'"
      @mouseleave="quicknextIconClass = 'el-icon-more'">
    </li>
    <li
      :class="[{ active: currentPage === pageCount }, pagerClass, currentPage === pageCount ? activeClass : '']"
      class="number"
      :style="[pagerStyle, currentPage === pageCount ? activeStyle : null] "
      v-if="pageCount > 1">{{ pageCount }}</li>
  </ul>
</template>

<script type="text/babel">
  export default {
    name: 'ElPager',

    props: {
      currentPage: Number,

      pageCount: Number,

      morePages: {
        type: Number,
        default: 6,
        validator: function(value) {
          return value >= 5;
        }
      },

      moreClass: {
        type: String,
        default: ''
      },

      moreStyle: {
        type: Object,
        default: null
      },

      pagerClass: {
        type: String,
        default: ''
      },

      pagerStyle: {
        type: Object,
        default: null
      },

      activeClass: {
        type: String,
        default: ''
      },

      activeStyle: {
        type: Object,
        default: null
      }
    },

    watch: {
      showPrevMore(val) {
        if (!val) this.quickprevIconClass = 'el-icon-more';
      },

      showNextMore(val) {
        if (!val) this.quicknextIconClass = 'el-icon-more';
      }
    },

    methods: {
      onPagerClick(event) {
        const target = event.target;
        if (target.tagName === 'UL') {
          return;
        }

        let newPage = Number(event.target.textContent);
        const pageCount = this.pageCount;
        const currentPage = this.currentPage;

        if (target.className.indexOf('more') !== -1) {
          if (target.className.indexOf('quickprev') !== -1) {
            newPage = currentPage - (this.morePages - 1);
          } else if (target.className.indexOf('quicknext') !== -1) {
            newPage = currentPage + (this.morePages - 1);
          }
        }

        /* istanbul ignore if */
        if (!isNaN(newPage)) {
          if (newPage < 1) {
            newPage = 1;
          }

          if (newPage > pageCount) {
            newPage = pageCount;
          }
        }

        if (newPage !== currentPage) {
          this.$emit('change', newPage);
        }
      }
    },

    computed: {
      pagers() {
        const pagerCount = (this.morePages + 1);

        const currentPage = Number(this.currentPage);
        const pageCount = Number(this.pageCount);

        let showPrevMore = false;
        let showNextMore = false;

        if (pageCount > pagerCount) {
          if (currentPage > pagerCount - (this.morePages - 3)) {
            showPrevMore = true;
          }

          if (currentPage < pageCount - (this.morePages - 3)) {
            showNextMore = true;
          }
        }

        const array = [];

        if (showPrevMore && !showNextMore) {
          const startPage = pageCount - (pagerCount - 2);
          for (let i = startPage; i < pageCount; i++) {
            array.push(i);
          }
        } else if (!showPrevMore && showNextMore) {
          for (let i = 2; i < pagerCount; i++) {
            array.push(i);
          }
        } else if (showPrevMore && showNextMore) {
          const offset = Math.floor(pagerCount / 2) - 1;
          for (let i = currentPage - offset ; i <= currentPage + offset; i++) {
            array.push(i);
          }
        } else {
          for (let i = 2; i < pageCount; i++) {
            array.push(i);
          }
        }

        this.showPrevMore = showPrevMore;
        this.showNextMore = showNextMore;

        return array;
      }
    },

    data() {
      return {
        current: null,
        showPrevMore: false,
        showNextMore: false,
        quicknextIconClass: 'el-icon-more',
        quickprevIconClass: 'el-icon-more'
      };
    }
  };
</script>
