## 自定义主题
LvxUI 默认提供一套主题，CSS 命名采用 BEM 的风格，方便使用者覆盖样式。我们提供了三种方法，可以进行不同程度的样式自定义。


### 在项目中改变 SCSS 变量
LvxUI 的 theme-chalk 使用 SCSS 编写，如果你的项目也使用了 SCSS，那么可以直接在项目中改变 LvxUI 的样式变量。新建一个样式文件，例如 `lvx-variables.scss`，写入以下内容：
```html
/* 改变主题色变量 */
$--color-primary: teal;

/* 改变 icon 字体路径变量，必需 */
$--font-path: '../node_modules/lvx-ui/lib/theme-chalk/fonts';

@import "../node_modules/lvx-ui/packages/theme-chalk/src/index";
```

之后，在项目的入口文件中，直接引入以上样式文件即可（无需引入 LvxUI 编译好的 CSS 文件）：
```JS
import Vue from 'vue'
import LvxUI from 'lvx-ui'
import './lvx-variables.scss'

Vue.use(LvxUI)
```

:::tip
需要注意的是，覆盖字体路径变量是必需的，将其赋值为 LvxUI 中 icon 图标所在的相对路径即可。
:::



如果不清楚 `babel-plugin-component` 是什么，请阅读 <a href="./#/zh-CN/component/quickstart">快速上手</a> 一节。