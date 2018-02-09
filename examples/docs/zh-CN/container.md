<style>
  .lvx-header, .lvx-footer {
    background-color: #B3C0D1;
    color: #333;
    line-height: 60px;
  }
  
  .lvx-aside {
    color: #333;
  }
  
  #chang-jian-ye-mian-bu-ju + .demo-container {
    .lvx-header, .lvx-footer {
      text-align: center;
    }
  
    .lvx-aside {
      background-color: #D3DCE6;
      text-align: center;
      line-height: 200px;
    }
  
    .lvx-main {
      background-color: #E9EEF3;
      color: #333;
      text-align: center;
      line-height: 160px;
    }
    
    & > .source > .lvx-container {
      margin-bottom: 40px;
    
      &:nth-child(5) .lvx-aside,
      &:nth-child(6) .lvx-aside {
        line-height: 260px;
      }

      &:nth-child(7) .lvx-aside {
        line-height: 320px;
      }
    }
  }
</style>

<script>
  export default {
    data() {
      const item = {
        date: '2016-05-02',
        name: '王小虎',
        address: '上海市普陀区金沙江路 1518 弄'
      };
      return {
        tableData: Array(20).fill(item)
      }
    }
  };
</script>

## Container 布局容器
用于布局的容器组件，方便快速搭建页面的基本结构：

`<lvx-container>`：外层容器。当子元素中包含 `<lvx-header>` 或 `<lvx-footer>` 时，全部子元素会垂直上下排列，否则会水平左右排列。

`<lvx-header>`：顶栏容器。

`<lvx-aside>`：侧边栏容器。

`<lvx-main>`：主要区域容器。

`<lvx-footer>`：底栏容器。

:::tip
以上组件采用了 flex 布局，使用前请确定目标浏览器是否兼容。此外，`<lvx-container>` 的子元素只能是后四者，后四者的父元素也只能是 `<lvx-container>`。
:::

### 常见页面布局

::: demo
```html
<lvx-container>
  <lvx-header>Header</lvx-header>
  <lvx-main>Main</lvx-main>
</lvx-container>

<lvx-container>
  <lvx-header>Header</lvx-header>
  <lvx-main>Main</lvx-main>
  <lvx-footer>Footer</lvx-footer>
</lvx-container>

<lvx-container>
  <lvx-aside width="200px">Aside</lvx-aside>
  <lvx-main>Main</lvx-main>
</lvx-container>

<lvx-container>
  <lvx-header>Header</lvx-header>
  <lvx-container>
    <lvx-aside width="200px">Aside</lvx-aside>
    <lvx-main>Main</lvx-main>
  </lvx-container>
</lvx-container>

<lvx-container>
  <lvx-header>Header</lvx-header>
  <lvx-container>
    <lvx-aside width="200px">Aside</lvx-aside>
    <lvx-container>
      <lvx-main>Main</lvx-main>
      <lvx-footer>Footer</lvx-footer>
    </lvx-container>
  </lvx-container>
</lvx-container>

<lvx-container>
  <lvx-aside width="200px">Aside</lvx-aside>
  <lvx-container>
    <lvx-header>Header</lvx-header>
    <lvx-main>Main</lvx-main>
  </lvx-container>
</lvx-container>

<lvx-container>
  <lvx-aside width="200px">Aside</lvx-aside>
  <lvx-container>
    <lvx-header>Header</lvx-header>
    <lvx-main>Main</lvx-main>
    <lvx-footer>Footer</lvx-footer>
  </lvx-container>
</lvx-container>

<style>
  .lvx-header, .lvx-footer {
    background-color: #B3C0D1;
    color: #333;
    text-align: center;
    line-height: 60px;
  }
  
  .lvx-aside {
    background-color: #D3DCE6;
    color: #333;
    text-align: center;
    line-height: 200px;
  }
  
  .lvx-main {
    background-color: #E9EEF3;
    color: #333;
    text-align: center;
    line-height: 160px;
  }
  
  body > .lvx-container {
    margin-bottom: 40px;
  }
  
  .lvx-container:nth-child(5) .lvx-aside,
  .lvx-container:nth-child(6) .lvx-aside {
    line-height: 260px;
  }
  
  .lvx-container:nth-child(7) .lvx-aside {
    line-height: 320px;
  }
</style>
```
:::

### 实例

::: demo
```html
<lvx-container style="height: 500px; border: 1px solid #eee">
  <lvx-aside width="200px" style="background-color: rgb(238, 241, 246)">
    <lvx-menu :default-openeds="['1', '3']">
      <lvx-submenu index="1">
        <template slot="title"><i class="lvx-icon-message"></i>导航一</template>
        <lvx-menu-item-group>
          <template slot="title">分组一</template>
          <lvx-menu-item index="1-1">选项1</lvx-menu-item>
          <lvx-menu-item index="1-2">选项2</lvx-menu-item>
        </lvx-menu-item-group>
        <lvx-menu-item-group title="分组2">
          <lvx-menu-item index="1-3">选项3</lvx-menu-item>
        </lvx-menu-item-group>
        <lvx-submenu index="1-4">
          <template slot="title">选项4</template>
          <lvx-menu-item index="1-4-1">选项4-1</lvx-menu-item>
        </lvx-submenu>
      </lvx-submenu>
      <lvx-submenu index="2">
        <template slot="title"><i class="lvx-icon-menu"></i>导航二</template>
        <lvx-menu-item-group>
          <template slot="title">分组一</template>
          <lvx-menu-item index="2-1">选项1</lvx-menu-item>
          <lvx-menu-item index="2-2">选项2</lvx-menu-item>
        </lvx-menu-item-group>
        <lvx-menu-item-group title="分组2">
          <lvx-menu-item index="2-3">选项3</lvx-menu-item>
        </lvx-menu-item-group>
        <lvx-submenu index="2-4">
          <template slot="title">选项4</template>
          <lvx-menu-item index="2-4-1">选项4-1</lvx-menu-item>
        </lvx-submenu>
      </lvx-submenu>
      <lvx-submenu index="3">
        <template slot="title"><i class="lvx-icon-setting"></i>导航三</template>
        <lvx-menu-item-group>
          <template slot="title">分组一</template>
          <lvx-menu-item index="3-1">选项1</lvx-menu-item>
          <lvx-menu-item index="3-2">选项2</lvx-menu-item>
        </lvx-menu-item-group>
        <lvx-menu-item-group title="分组2">
          <lvx-menu-item index="3-3">选项3</lvx-menu-item>
        </lvx-menu-item-group>
        <lvx-submenu index="3-4">
          <template slot="title">选项4</template>
          <lvx-menu-item index="3-4-1">选项4-1</lvx-menu-item>
        </lvx-submenu>
      </lvx-submenu>
    </lvx-menu>
  </lvx-aside>
  
  <lvx-container>
    <lvx-header style="text-align: right; font-size: 12px">
      <lvx-dropdown>
        <i class="lvx-icon-setting" style="margin-right: 15px"></i>
        <lvx-dropdown-menu slot="dropdown">
          <lvx-dropdown-item>查看</lvx-dropdown-item>
          <lvx-dropdown-item>新增</lvx-dropdown-item>
          <lvx-dropdown-item>删除</lvx-dropdown-item>
        </lvx-dropdown-menu>
      </lvx-dropdown>
      <span>王小虎</span>
    </lvx-header>
    
    <lvx-main>
      <lvx-table :data="tableData">
        <lvx-table-column prop="date" label="日期" width="140">
        </lvx-table-column>
        <lvx-table-column prop="name" label="姓名" width="120">
        </lvx-table-column>
        <lvx-table-column prop="address" label="地址">
        </lvx-table-column>
      </lvx-table>
    </lvx-main>
  </lvx-container>
</lvx-container>

<style>
  .lvx-header {
    background-color: #B3C0D1;
    color: #333;
    line-height: 60px;
  }
  
  .lvx-aside {
    color: #333;
  }
</style>

<script>
  export default {
    data() {
      const item = {
        date: '2016-05-02',
        name: '王小虎',
        address: '上海市普陀区金沙江路 1518 弄'
      };
      return {
        tableData: Array(20).fill(item)
      }
    }
  };
</script>
```
:::

### Container Attributes
| 参数    | 说明     | 类型    | 可选值      | 默认值 |
|---------|----------|---------|-------------|--------|
| direction | 子元素的排列方向 | string | horizontal / vertical | 子元素中有 `lvx-header` 或 `lvx-footer` 时为 vertical，否则为 horizontal |

### Header Attributes
| 参数    | 说明     | 类型    | 可选值      | 默认值 |
|---------|----------|---------|-------------|--------|
| height | 顶栏高度 | string | — | 60px |

### Aside Attributes
| 参数    | 说明     | 类型    | 可选值      | 默认值 |
|---------|----------|---------|-------------|--------|
| width | 侧边栏宽度 | string | — | 300px |

### Footer Attributes
| 参数    | 说明     | 类型    | 可选值      | 默认值 |
|---------|----------|---------|-------------|--------|
| height | 底栏高度 | string | — | 60px |