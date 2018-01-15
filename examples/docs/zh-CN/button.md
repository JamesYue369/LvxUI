<style>
  .demo-box.demo-button {
    .el-row {
      margin-bottom: 10px;
    }
    .el-button + .el-button {
      margin-left: 10px;
    }
    .el-button-group {
      margin-bottom: 20px;

      .el-button + .el-button {
        margin-left: 0;
      }

      & + .el-button-group {
        margin-left: 10px;
      }
    }
    .btn:disabled{
      background-color: #f7f7f7;
      color:#959595;
      border: solid 1px #f7f7f7;
    }
    .btn:disabled:hover{
      background-color: #f7f7f7;
      color:#959595;
      border: solid 1px #f7f7f7;
    }
    .btn1{
      background-color: #fff;
      color: #333;
      border-color: #d9d9d9;
      padding: 9px 20px;
    }
    .btn1:hover{
      border-color: #6297ff;
      color: #6297ff;
      background-color: #fff;
    }
    .btn1:active{
      border-color: #6297ff;
      color: #6297ff;
      background-color: #fff;
    }
    .btn1:focus{
      border-color: #6297ff;
      color: #6297ff;
      background-color: #fff;
    }
    .btn2{
      background-color: #4081ff;
      color: #fff;
      border-color: #4081ff;
      padding: 9px 20px;
    }
    .btn2:hover{
      border-color: #6297ff;
      color: #fff;
      background-color: #6297ff;
    }
    .btn2:active{
      border-color: #6297ff;
      color: #fff;
      background-color: #6297ff;
    }
    .btn2:focus{
      border-color: #6297ff;
      color: #fff;
      background-color: #6297ff;
    }
    .btn3{
      background-color: #fff;
      color: #4081ff;
      border-color: #4081ff;
      padding: 9px 20px;
    }
    .btn3:hover{
      border-color: #6297ff;
      color: #6297ff;
      background-color: #fff;
    }
    .btn3:active{
      border-color: #6297ff;
      color: #6297ff;
      background-color: #fff;
    }
    .btn3:focus{
      border-color: #6297ff;
      color: #6297ff;
      background-color: #fff;
    }
    .btn4{
      background-color: #fff;
      color: #4081ff;
      border-color: #4081ff;
      border-style: dashed;
      padding: 9px 20px;
    }
    .btn4:hover{
      border-color: #6297ff;
      color: #6297ff;
      background-color: #fff;
    }
    .btn4:active{
      border-color: #6297ff;
      color: #6297ff;
      background-color: #fff;
    }
    .btn4:focus{
      border-color: #6297ff;
      color: #6297ff;
      background-color: #fff;
    }
  }
</style>

## Button 按钮
常用的操作按钮。

### 基础用法

基础的按钮用法。

:::demo 使用`type`、`plain`和`round`属性来定义 Button 的样式。

```html
<div>
  <el-button>默认按钮</el-button>
  <el-button type="primary">主要按钮</el-button>
  <el-button type="success">成功按钮</el-button>
  <el-button type="info">信息按钮</el-button>
  <el-button type="warning">警告按钮</el-button>
  <el-button type="danger">危险按钮</el-button>
</div>

<div style="margin: 20px 0">
  <el-button plain>朴素按钮</el-button>
  <el-button type="primary" plain>主要按钮</el-button>
  <el-button type="success" plain>成功按钮</el-button>
  <el-button type="info" plain>信息按钮</el-button>
  <el-button type="warning" plain>警告按钮</el-button>
  <el-button type="danger" plain>危险按钮</el-button>
</div>

<div>
  <el-button round>圆形按钮</el-button>
  <el-button type="primary" round>主要按钮</el-button>
  <el-button type="success" round>成功按钮</el-button>
  <el-button type="info" round>信息按钮</el-button>
  <el-button type="warning" round>警告按钮</el-button>
  <el-button type="danger" round>危险按钮</el-button>
</div>
```
:::

### 自定义类名
可以添加class来自定义背景颜色、字体颜色、边框等属性
:::demo 
```html
<div>
  <el-button class="btn1" >自定义颜色</el-button>
  <el-button class="btn2">自定义颜色</el-button>
  <el-button  class="btn3">自定义样式</el-button>
  <el-button  class="btn4">自定义边框</el-button>
  <el-button class="btn1 btn" disabled>自定义颜色</el-button>
</div>
<style type="text/css">
  .btn:disabled{
    background-color: #f7f7f7;
    color:#959595;
    border:none;
  }
  .btn:disabled:hover{
    background-color: #f7f7f7;
    color:#959595;
  }
  .btn1{
    background-color: #fff;
    color: #333;
    border-color: #d9d9d9;
    padding: 9px 20px;
  }
  .btn1:hover{
    border-color: #6297ff;
    color: #6297ff;
    background-color: #fff;
  }
  .btn1:active{
    border-color: #6297ff;
    color: #6297ff;
    background-color: #fff;
  }
  .btn1:focus{
    border-color: #6297ff;
    color: #6297ff;
    background-color: #fff;
  }
  .btn2{
    background-color: #4081ff;
    color: #fff;
    border-color: #4081ff;
    padding: 9px 20px;
  }
  .btn2:hover{
    border-color: #6297ff;
    color: #fff;
    background-color: #6297ff;
  }
  .btn2:active{
    border-color: #6297ff;
    color: #fff;
    background-color: #6297ff;
  }
  .btn2:focus{
    border-color: #6297ff;
    color: #fff;
    background-color: #6297ff;
  }
  .btn3{
    background-color: #fff;
    color: #4081ff;
    border-color: #4081ff;
    padding: 9px 20px;
  }
  .btn3:hover{
    border-color: #6297ff;
    color: #6297ff;
    background-color: #fff;
  }
  .btn3:active{
    border-color: #6297ff;
    color: #6297ff;
    background-color: #fff;
  }
  .btn3:focus{
    border-color: #6297ff;
    color: #6297ff;
    background-color: #fff;
  }
  .btn4{
    background-color: #fff;
    color: #4081ff;
    border-color: #4081ff;
    border-style: dashed;
    padding: 9px 20px;
  }
  .btn4:hover{
    border-color: #6297ff;
    color: #6297ff;
    background-color: #fff;
  }
  .btn4:active{
    border-color: #6297ff;
    color: #6297ff;
    background-color: #fff;
  }
  .btn4:focus{
    border-color: #6297ff;
    color: #6297ff;
    background-color: #fff;
  }
</style>
```
:::

### 禁用状态

按钮不可用状态。

:::demo 你可以使用`disabled`属性来定义按钮是否可用，它接受一个`Boolean`值。

```html
<div>
  <el-button disabled>默认按钮</el-button>
  <el-button type="primary" disabled>主要按钮</el-button>
  <el-button type="success" disabled>成功按钮</el-button>
  <el-button type="info" disabled>信息按钮</el-button>
  <el-button type="warning" disabled>警告按钮</el-button>
  <el-button type="danger" disabled>危险按钮</el-button>
</div>

<div style="margin-top: 20px">
  <el-button plain disabled>朴素按钮</el-button>
  <el-button type="primary" plain disabled>主要按钮</el-button>
  <el-button type="success" plain disabled>成功按钮</el-button>
  <el-button type="info" plain disabled>信息按钮</el-button>
  <el-button type="warning" plain disabled>警告按钮</el-button>
  <el-button type="danger" plain disabled>危险按钮</el-button>
</div>
```
:::

### 文字按钮

没有边框和背景色的按钮。

:::demo
```html
<el-button type="text">文字按钮</el-button>
<el-button type="text" disabled>文字按钮</el-button>
```
:::

### 图标按钮

带图标的按钮可增强辨识度（有文字）或节省空间（无文字）。

:::demo 设置`icon`属性即可，icon 的列表可以参考 Element 的 icon 组件，也可以设置在文字右边的 icon ，只要使用`i`标签即可，可以使用自定义图标。

```html
<el-button type="primary" icon="el-icon-edit"></el-button>
<el-button type="primary" icon="el-icon-share"></el-button>
<el-button type="primary" icon="el-icon-delete"></el-button>
<el-button type="primary" icon="el-icon-search">搜索</el-button>
<el-button type="primary">上传<i class="el-icon-upload el-icon--right"></i></el-button>
```
:::

### 按钮组

以按钮组的方式出现，常用于多项类似操作。

:::demo 使用`<el-button-group>`标签来嵌套你的按钮。

```html
<el-button-group>
  <el-button type="primary" icon="el-icon-arrow-left">上一页</el-button>
  <el-button type="primary">下一页<i class="el-icon-arrow-right el-icon--right"></i></el-button>
</el-button-group>
<el-button-group>
  <el-button type="primary" icon="el-icon-edit"></el-button>
  <el-button type="primary" icon="el-icon-share"></el-button>
  <el-button type="primary" icon="el-icon-delete"></el-button>
</el-button-group>
```
:::

### 加载中

点击按钮后进行数据加载操作，在按钮上显示加载状态。

:::demo 要设置为 loading 状态，只要设置`loading`属性为`true`即可。

```html
<el-button type="primary" :loading="true">加载中</el-button>
```
:::

### 不同尺寸

Button 组件提供除了默认值以外的三种尺寸，可以在不同场景下选择合适的按钮尺寸。

:::demo 额外的尺寸：`medium`、`small`、`mini`，通过设置`size`属性来配置它们。

```html
<div>
  <el-button>默认按钮</el-button>
  <el-button size="medium">中等按钮</el-button>
  <el-button size="small">小型按钮</el-button>
  <el-button size="mini">超小按钮</el-button>
</div>
<div style="margin-top: 20px">
  <el-button round>默认按钮</el-button>
  <el-button size="medium" round>中等按钮</el-button>
  <el-button size="small" round>小型按钮</el-button>
  <el-button size="mini" round>超小按钮</el-button>
</div>
```
:::

### Attributes
| 参数      | 说明    | 类型      | 可选值       | 默认值   |
|---------- |-------- |---------- |-------------  |-------- |
| size     | 尺寸   | string  |   medium / small / mini            |    —     |
| type     | 类型   | string    |   primary / success / warning / danger / info / text |     —    |
| plain     | 是否朴素按钮   | boolean    | — | false   |
| round     | 是否圆形按钮   | boolean    | — | false   |
| loading     | 是否加载中状态   | boolean    | — | false   |
| disabled  | 是否禁用状态    | boolean   | —   | false   |
| icon  | 图标类名 | string   |  —  |  —  |
| autofocus  | 是否默认聚焦 | boolean   |  —  |  false  |
| native-type | 原生 type 属性 | string | button / submit / reset | button |
| button-style | 自定义按钮样式,内联样式优先级高 | object| — | null | 
