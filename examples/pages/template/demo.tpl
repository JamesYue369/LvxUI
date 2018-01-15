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
  .radio .el-radio__inner:hover{
    border-color: #6297ff;
  }
  .radio .is-checked .el-radio__inner{
    background: none;
    border-color: #4081ff;
  }
  .radio .is-checked .el-radio__inner .afterVNode{
    width: 6px;
    height: 6px;
    background-color: #4081ff;
  }
  .radio .el-radio__input.is-checked + .el-radio__label {
    color: #333;
  }
  .checkbox{
    color: #333;
  }
  .checkbox .el-checkbox__inner:hover{
    border-color: #6297ff;
  }
  .checkbox .el-checkbox__input.is-checked .el-checkbox__inner{
    background-color: #4081ff;
    border-color: #4081ff;
  }
  .checkbox .el-checkbox__input.is-checked + .el-checkbox__label{
    color: #333;
  }
  .checkbox .el-checkbox__input.is-disabled .el-checkbox__inner{
    border-color: #d9d9d9;
  }
  .checkbox .el-checkbox__input.is-disabled.is-checked .el-checkbox__inner{
    background-color: #f7f7f7;
    border-color: #d9d9d9;
  }
  .input{

  }
  .input .el-input__inner{
    border-color: #f04143;
  }
  .input.is-disabled .el-input__inner {
    background-color: #f7f7f7;
    border-color: #d9d9d9;
  }

  .el-carousel__item h3 {
    color: #475669;
    font-size: 14px;
    opacity: 0.75;
    line-height: 200px;
    margin: 0;
  }
  
  .el-carousel__item:nth-child(2n) {
    background-color: #99a9bf;
  }
  
  .el-carousel__item:nth-child(2n+1) {
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
  .user-img .avatar-uploader .el-upload {
    font-size: 12px;
    color: #959595;
  }
</style>
<template>
  <div>
    <div>
      <el-button>默认按钮</el-button>
      <el-button class="btn1" >自定义颜色</el-button>
      <el-button class="btn2">自定义颜色</el-button>
      <el-button  class="btn3">自定义样式</el-button>
      <el-button  class="btn4">自定义边框</el-button>
    </br>
     </br>
      <el-button class="btn1 btn" disabled>自定义颜色</el-button>
      <el-button class="btn2 btn" disabled>自定义颜色</el-button>
      <el-button  class="btn3 btn" disabled>自定义样式</el-button>
      <el-button  class="btn4 btn" disabled>自定义边框</el-button>
    </div>
    
    <el-radio-group v-model="radio2" >
      <el-radio disabled :label="3" class="radio">备选项</el-radio>
      <el-radio  :label="6" class="radio">备选项</el-radio>
      <el-radio  :label="9" class="radio">备选项</el-radio>
    </el-radio-group>
    <el-checkbox-group v-model="checkList" >
      <el-checkbox label="复选框 A" class="checkbox"></el-checkbox>
      <el-checkbox label="复选框 B" class="checkbox"></el-checkbox>
      <el-checkbox label="复选框 C" class="checkbox"></el-checkbox>
      <el-checkbox label="禁用" class="checkbox" disabled></el-checkbox>
      <el-checkbox label="选中且禁用" class="checkbox" disabled></el-checkbox>
    </el-checkbox-group>

    <el-breadcrumb separator="/" :item-style="itemStyle" :last-item-style="lastItemStyle">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>活动管理</el-breadcrumb-item>
      <el-breadcrumb-item>活动列表</el-breadcrumb-item>
      <el-breadcrumb-item class="item-active">活动详情</el-breadcrumb-item>
    </el-breadcrumb>
    <div style="width:250px">
      <el-input
        class="input"
        size="small"
        placeholder="请选择日期"
        v-model="input22">
        <i slot="suffix" class="el-input__icon el-icon-date"></i>
      </el-input>
       <el-input
        class="input"
        :disabled="disabled"
        size="small"
        placeholder="请选择日期"
        >
        <i slot="suffix" class="el-input__icon el-icon-date"></i>
      </el-input>
      
    </div>
    <div>
      <el-steps :active="active" finish-status="success" >
        <el-step title="步骤 1"></el-step>
        <el-step title="步骤 2"></el-step>
        <el-step title="步骤 3"></el-step>
      </el-steps>

      <el-button style="margin-top: 12px;" @click="next">下一步</el-button>

      <el-steps :active="2" align-center :line-type="lineType">
        <el-step title="步骤1" description="这是一段很长很长很长的描述性文字"></el-step>
        <el-step title="步骤2" description="这是一段很长很长很长的描述性文字"></el-step>
        <el-step title="步骤3" description="这是一段很长很长很长的描述性文字"></el-step>
        <el-step title="步骤4" description="这是一段很长很长很长的描述性文字"></el-step>
      </el-steps>

      <div style="height:300px">
        <el-steps direction="vertical" :active="active1" >
          <el-step title="步骤 1"></el-step>
          <el-step title="步骤 2"></el-step>
          <el-step title="步骤 3"></el-step>
        </el-steps>
        
      </div> 
      <el-button style="margin-top: 12px;" @click="next1">下一步</el-button>   
      <div style="height:300px">
        <el-steps direction="vertical" :active="active1" :line-type="lineType">
          <el-step title="步骤 1"></el-step>
          <el-step title="步骤 2"></el-step>
          <el-step title="步骤 3"></el-step>
        </el-steps>
        
      </div>    
      <el-button style="margin-top: 12px;" @click="next1">下一步</el-button>
    </div>
    <div>
      <el-button :plain="true" @click="open2">成功</el-button>
      <el-button :plain="true" @click="open3">警告</el-button>
      <el-button :plain="true" @click="open">消息</el-button>
      <el-button :plain="true" @click="open4">错误</el-button>
    </div>
    <div>
       <el-table
        :data="tableData"
        style="width: 100%"
        :headerRowStyle="headerStyle"
        :headerCellStyle="headerCellStyle"
        :cell-style="cellStyle"
        >
        <el-table-column
          label="日期"
          width="180"
          >
          <template slot-scope="scope">
            <i class="el-icon-time"></i>
            <span style="margin-left: 10px">{{ scope.row.date }}</span>
          </template>
        </el-table-column>
        <el-table-column
          label="姓名"
          width="180">
          <template slot-scope="scope">
            <el-popover trigger="hover" placement="top">
              <p>姓名: {{ scope.row.name }}</p>
              <p>住址: {{ scope.row.address }}</p>
              <div slot="reference" class="name-wrapper">
                <el-tag size="medium">{{ scope.row.name }}</el-tag>
              </div>
            </el-popover>
          </template>
        </el-table-column>
        <el-table-column label="操作">
          <template slot-scope="scope">
            <el-button type="text">编辑</el-button>
            <el-button type="text">删除</el-button>
            
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div>
      <el-button type="text" @click="centerDialogVisible = true">点击打开 Dialog</el-button>
      <el-button
        type="primary"
        @click="openFullScreen2">
        loading...
      </el-button>
      <el-dialog
        :visible.sync="centerDialogVisible"
        width="30%"
        titleClass="dialog-title"
        >
        <span slot="title">本地上传</span>
        <i slot="close" class="el-icon-circle-close"></i>
        <div class="dialog-content">
          <span>文件上传</span>
          <span>pdf上传</span>
          <span>图片上传</span>
        </div>
      </el-dialog>
    </div>
    <div>
      <el-pagination
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
      </el-pagination>
    </div>
    <div class="user-img">
      <img v-if="imageUrl" :src="imageUrl" class="avatar">
      <el-upload
        class="avatar-uploader"
        action="https://jsonplaceholder.typicode.com/posts/"
        :show-file-list="false"
        :on-success="handleAvatarSuccess"
        >
        <i class="el-icon-setting"></i>修改头像
      </el-upload>
    </div>
    <div>
      <el-carousel :interval="4000" type="card" height="200px">
        <el-carousel-item v-for="item in 6" :key="item">
          <h3>{{ item }}</h3>
        </el-carousel-item>
      </el-carousel>
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
