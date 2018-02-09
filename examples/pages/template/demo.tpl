<style>
  .dialog-title{
    background-color: #f0f5ff;
    text-align: center;
    padding: 10px 0;
    color: #84aeff;
  }
  @keyframes ball-beat {
    50% {
      opacity: 0.2;
      -webkit-transform: scale(0.75);
      transform: scale(0.75);
    }
    100% {
      opacity: 1;
      -webkit-transform: scale(1);
      transform: scale(1);
    }
  }
  .loading-spinner{
    width: auto;
    padding: 10px 12px;
    background-color: #e6faff;
    border-radius: 4px;
    font-size: 14px;
    color: #4081ff;
    left: 50%;
    transform: translateX(-50%);
  }
  .spinner-cell{
    background-color: #4081ff;
    width: 2px;
    height: 2px;
    display: inline-block;
    border-radius: 100%;
    margin: 0 2px;
    animation: ball-beat 0.7s linear infinite;
  }
  .spinner-cell:nth-child(odd) {
    animation-delay: -0.35s;
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
  .btn:disabled{
    background-color: #f7f7f7;
    color:#959595;
    border:none;
  }
  .btn:disabled:hover{
    background-color: #f7f7f7;
    color:#959595;
  }
  .radio{
    color: #333;
  }
  .radio .lvx-radio__inner:hover{
    border-color: #6297ff;
  }
  .radio .is-checked .lvx-radio__inner{
    background: none;
    border-color: #4081ff;
  }
  .radio .is-checked .lvx-radio__inner .afterVNode{
    width: 6px;
    height: 6px;
    background-color: #4081ff;
  }
  .radio .lvx-radio__input.is-checked + .lvx-radio__label {
    color: #333;
  }
  .checkbox{
    color: #333;
  }
  .checkbox .lvx-checkbox__inner:hover{
    border-color: #6297ff;
  }
  .checkbox .lvx-checkbox__input.is-checked .lvx-checkbox__inner{
    background-color: #4081ff;
    border-color: #4081ff;
  }
  .checkbox .lvx-checkbox__input.is-checked + .lvx-checkbox__label{
    color: #333;
  }
  .checkbox .lvx-checkbox__input.is-disabled .lvx-checkbox__inner{
    border-color: #d9d9d9;
  }
  .checkbox .lvx-checkbox__input.is-disabled.is-checked .lvx-checkbox__inner{
    background-color: #f7f7f7;
    border-color: #d9d9d9;
  }
  .input{

  }
  .input .lvx-input__inner{
    border-color: #f04143;
  }
  .input.is-disabled .lvx-input__inner {
    background-color: #f7f7f7;
    border-color: #d9d9d9;
  }

  .lvx-carousel__item h3 {
    color: #475669;
    font-size: 14px;
    opacity: 0.75;
    line-height: 200px;
    margin: 0;
  }
  
  .lvx-carousel__item:nth-child(2n) {
    background-color: #99a9bf;
  }
  
  .lvx-carousel__item:nth-child(2n+1) {
    background-color: #d3dce6;
  }
  .pager-style{
   
  }
  .pager-style:not(:last-child){
    margin-right: 5px;
  }
  .page-active-style{
    color: #fff;
    background-color: #4081ff;
    border: none;
  }
  .user-img{
    display: inline-block;
    width: 80px;
  }
  .user-img .avatar{
    width: 100%;
    height: auto;
    border-radius: 80px;
    border: 2px solid #d9d9d9;
  }
  .user-img .avatar-uploader{
    text-align: center;
    margin-top: 5px;
  }
  .user-img .avatar-uploader .lvx-upload {
    font-size: 12px;
    color: #959595;
  }
</style>
<template>
  <div>
    <div>
      <lvx-button>默认按钮</lvx-button>
      <lvx-button class="btn1" >自定义颜色</lvx-button>
      <lvx-button class="btn2">自定义颜色</lvx-button>
      <lvx-button  class="btn3">自定义样式</lvx-button>
      <lvx-button  class="btn4">自定义边框</lvx-button>
    </br>
     </br>
      <lvx-button class="btn1 btn" disabled>自定义颜色</lvx-button>
      <lvx-button class="btn2 btn" disabled>自定义颜色</lvx-button>
      <lvx-button  class="btn3 btn" disabled>自定义样式</lvx-button>
      <lvx-button  class="btn4 btn" disabled>自定义边框</lvx-button>
    </div>
    
    <lvx-radio-group v-model="radio2" >
      <lvx-radio disabled :label="3" class="radio">备选项</lvx-radio>
      <lvx-radio  :label="6" class="radio">备选项</lvx-radio>
      <lvx-radio  :label="9" class="radio">备选项</lvx-radio>
    </lvx-radio-group>
    <lvx-checkbox-group v-model="checkList" >
      <lvx-checkbox label="复选框 A" class="checkbox"></lvx-checkbox>
      <lvx-checkbox label="复选框 B" class="checkbox"></lvx-checkbox>
      <lvx-checkbox label="复选框 C" class="checkbox"></lvx-checkbox>
      <lvx-checkbox label="禁用" class="checkbox" disabled></lvx-checkbox>
      <lvx-checkbox label="选中且禁用" class="checkbox" disabled></lvx-checkbox>
    </lvx-checkbox-group>

    <lvx-breadcrumb separator="/" :item-style="itemStyle" :last-item-style="lastItemStyle">
      <lvx-breadcrumb-item :to="{ path: '/' }">首页</lvx-breadcrumb-item>
      <lvx-breadcrumb-item>活动管理</lvx-breadcrumb-item>
      <lvx-breadcrumb-item>活动列表</lvx-breadcrumb-item>
      <lvx-breadcrumb-item class="item-active">活动详情</lvx-breadcrumb-item>
    </lvx-breadcrumb>
    <div style="width:250px">
      <lvx-input
        class="input"
        size="small"
        placeholder="请选择日期"
        v-model="input22">
        <i slot="suffix" class="lvx-input__icon lvx-icon-date"></i>
      </lvx-input>
       <lvx-input
        class="input"
        :disabled="disabled"
        size="small"
        placeholder="请选择日期"
        >
        <i slot="suffix" class="lvx-input__icon lvx-icon-date"></i>
      </lvx-input>
      
    </div>
    <div>
      <lvx-steps :active="active" finish-status="success" >
        <lvx-step title="步骤 1"></lvx-step>
        <lvx-step title="步骤 2"></lvx-step>
        <lvx-step title="步骤 3"></lvx-step>
      </lvx-steps>

      <lvx-button style="margin-top: 12px;" @click="next">下一步</lvx-button>

      <lvx-steps :active="2" align-center :line-type="lineType">
        <lvx-step title="步骤1" description="这是一段很长很长很长的描述性文字"></lvx-step>
        <lvx-step title="步骤2" description="这是一段很长很长很长的描述性文字"></lvx-step>
        <lvx-step title="步骤3" description="这是一段很长很长很长的描述性文字"></lvx-step>
        <lvx-step title="步骤4" description="这是一段很长很长很长的描述性文字"></lvx-step>
      </lvx-steps>

      <div style="height:300px">
        <lvx-steps direction="vertical" :active="active1" >
          <lvx-step title="步骤 1"></lvx-step>
          <lvx-step title="步骤 2"></lvx-step>
          <lvx-step title="步骤 3"></lvx-step>
        </lvx-steps>
        
      </div> 
      <lvx-button style="margin-top: 12px;" @click="next1">下一步</lvx-button>   
      <div style="height:300px">
        <lvx-steps direction="vertical" :active="active1" :line-type="lineType">
          <lvx-step title="步骤 1"></lvx-step>
          <lvx-step title="步骤 2"></lvx-step>
          <lvx-step title="步骤 3"></lvx-step>
        </lvx-steps>
        
      </div>    
      <lvx-button style="margin-top: 12px;" @click="next1">下一步</lvx-button>
    </div>
    <div>
      <lvx-button :plain="true" @click="open2">成功</lvx-button>
      <lvx-button :plain="true" @click="open3">警告</lvx-button>
      <lvx-button :plain="true" @click="open">消息</lvx-button>
      <lvx-button :plain="true" @click="open4">错误</lvx-button>
    </div>
    <div>
       <lvx-table
        :data="tableData"
        style="width: 100%"
        :headerRowStyle="headerStyle"
        :headerCellStyle="headerCellStyle"
        :cell-style="cellStyle"
        >
        <lvx-table-column
          label="日期"
          width="180"
          >
          <template slot-scope="scope">
            <i class="lvx-icon-time"></i>
            <span style="margin-left: 10px">{{ scope.row.date }}</span>
          </template>
        </lvx-table-column>
        <lvx-table-column
          label="姓名"
          width="180">
          <template slot-scope="scope">
            <lvx-popover trigger="hover" placement="top">
              <p>姓名: {{ scope.row.name }}</p>
              <p>住址: {{ scope.row.address }}</p>
              <div slot="reference" class="name-wrapper">
                <lvx-tag size="medium">{{ scope.row.name }}</lvx-tag>
              </div>
            </lvx-popover>
          </template>
        </lvx-table-column>
        <lvx-table-column label="操作">
          <template slot-scope="scope">
            <lvx-button type="text">编辑</lvx-button>
            <lvx-button type="text">删除</lvx-button>
            
          </template>
        </lvx-table-column>
      </lvx-table>
    </div>
    <div>
      <lvx-button type="text" @click="centerDialogVisible = true">点击打开 Dialog</lvx-button>
      <lvx-button
        type="primary"
        @click="openFullScreen2">
        loading...
      </lvx-button>
      <lvx-dialog
        :visible.sync="centerDialogVisible"
        width="30%"
        titleClass="dialog-title"
        >
        <span slot="title">本地上传</span>
        <i slot="close" class="lvx-icon-circle-close"></i>
        <div class="dialog-content">
          <span>文件上传</span>
          <span>pdf上传</span>
          <span>图片上传</span>
        </div>
      </lvx-dialog>
    </div>
    <div>
      <lvx-pagination
        layout="prev, pager, next"
        :more-pages="morePages"
        :more-style="moreStyle"
        :pre-style="preStyle"
        :next-style="nextStyle"
        pager-class="pager-style"
        :pager-style="pagerStyle"
        active-class="page-active-style"
        :active-style="pagerActiveStyle"
        :total="1000">
      </lvx-pagination>
    </div>
    <div class="user-img">
      <img v-if="imageUrl" :src="imageUrl" class="avatar">
      <lvx-upload
        class="avatar-uploader"
        action="https://jsonplaceholder.typicode.com/posts/"
        :show-file-list="false"
        :on-success="handleAvatarSuccess"
        >
        <i class="lvx-icon-setting"></i>修改头像
      </lvx-upload>
    </div>
    <div>
      <lvx-carousel :interval="4000" type="card" height="200px">
        <lvx-carousel-item v-for="item in 6" :key="item">
          <h3>{{ item }}</h3>
        </lvx-carousel-item>
      </lvx-carousel>
    </div>
  </div>
</template>
<script>
  import Vue from 'vue';
  import Button from 'packages/button';
  
  Vue.use(Button);
  export default {
    data() {
      return {
        radio2: 3,
        checkList: ['选中且禁用', '复选框 A'],
        checkList1: ['选中且禁用', '复选框 A'],
        itemStyle: {
          color: '#eee',
          fontWeight: 'normal'
        },
        lastItemStyle: {
          color: '#000'
        },
        input22: '',
        borderStyle: {
          borderColor: '#f7a7a1'
        },
        disabledStyle: {
          backgroundColor: '#eee'
        },
        disabled: true,
        active: 0,
        active1: 1,
        lineType: 'dashed',
        tableData: [{
          date: '2016-05-02',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1518 弄'
        }, {
          date: '2016-05-04',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1517 弄'
        }, {
          date: '2016-05-01',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1519 弄'
        }, {
          date: '2016-05-03',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1516 弄'
        }],
        headerStyle: {
          backgroundColor: '#e3eaf1',
          color: '#000'
        },
        headerCellStyle: {
          padding: '8px 0'
        },
        cellStyle: {
          padding: '5px 0'
        },
        centerDialogVisible: false,
        button1Style: {
          borderColor: '#4081ff'
        },
        morePages: 5,
        pagerStyle: {
          width: '26px',
          minWidth: '26px',
          height: '26px',
          lineHeight: '26px',
          border: 'solid 1px #d9d9d9',
          borderRadius: '4px',
          fontSize: '12px',
          padding: '0'
        },
        pagerActiveStyle: {
          color: '#fff',
          backgroundColor: '#4081ff',
          border: 'none'
        },
        moreStyle: {
          marginRight: '5px',
          minWidth: 'auto'
        },
        preStyle: {
          width: '26px',
          height: '26px',
          minWidth: '26px',
          border: 'solid 1px #d9d9d9',
          borderRadius: '4px',
          padding: '0',
          marginRight: '5px'
        },
        nextStyle: {
          width: '26px',
          height: '26px',
          minWidth: '26px',
          border: 'solid 1px #d9d9d9',
          borderRadius: '4px',
          padding: '0',
          marginLeft: '5px'
        },
        imageUrl: require('../../assets/images/user.jpg')
      };
    },
    watch: {
    },
    methods: {
      next() {
        if (this.active++ > 2) this.active = 0;
      },
      next1() {
        if (this.active1++ > 2) this.active1 = 0;
      },
      open() {
        this.$message({
          dangerouslyUseHTMLString: true,
          message: '<span style="color:#333">这是一条消息提示<span>',
          customStyle: {
            backgroundColor: '#e6f0ff',
            minWidth: '316px',
            padding: '8px 15px 8px 20px'
          }
        });
      },
      open2() {
        this.$message({
          dangerouslyUseHTMLString: true,
          message: '<span style="color:#333">恭喜你，这是一条成功消息<span>',
          type: 'success',
          customStyle: {
            backgroundColor: '#e6faff',
            minWidth: '316px',
            padding: '8px 15px 8px 20px'
          }
        });
      },

      open3() {
        this.$message({
          dangerouslyUseHTMLString: true,
          message: '<span style="color:#333">警告哦，这是一条警告消息<span>',
          type: 'warning',
          customStyle: {
            backgroundColor: '#fff7de',
            minWidth: '316px',
            padding: '8px 15px 8px 20px'
          }
        });
      },

      open4() {
        this.$message({
          dangerouslyUseHTMLString: true,
          message: '<span style="color:#333">错了哦，这是一条错误消息<span>',
          type: 'error',
          customStyle: {
            backgroundColor: '#ffedec',
            minWidth: '316px',
            padding: '8px 15px 8px 20px'
          }
        });
      },
      openFullScreen2() {
        const loading = this.$loading({
          lock: true,
          spinnerHtml: `
            <span>正在读取数据，请稍后</span>
            <div class="one spinner-cell"></div>
            <div class="two spinner-cell"></div>
            <div class="three spinner-cell"></div>
          `,
          spinnerClass: 'loading-spinner',
          background: 'rgba(198, 198, 198, 0.3)'
        });
        setTimeout(() => {
          loading.close();
        }, 2000);
      },
      handleAvatarSuccess(res, file) {
        this.imageUrl = URL.createObjectURL(file.raw);
      }
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
