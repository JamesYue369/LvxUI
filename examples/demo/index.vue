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
  .table-header-wrapper1{
    margin: 0px 20px;
    text-align: center;
    overflow-x: auto;
    z-index: 5;
    background: #fff;
    height: 48px;
    line-height: 48px;
  }
  .fl{
    float: left;
  }
  .table-header-wrapper1 .table-column-fixed {
    position: fixed;
    right: 57px;
    background: #fff;
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

        <div class="empty-wraper" slot="empty">
          <img src="assets/imgages/noData.png" alt="">
          <p class="text-bottom" style="margin-right: 45px;">没有找到匹配的记录</p>
        </div>
      </lvx-table>
    </div>
    <div style="height: 400px;overflow: auto" id="popper-wraper" >
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
          :size="1024*30"
          :on-spill="handleAvatarSpill"
          accept="application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document"
          :on-disallow="handleAvatarDisallow"
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
      <div>
        <lvx-input
          type="textarea"
          :rows="2"
          placeholder="请输入内容"
          :maxlength="200"
          >
        </lvx-input>
      </div>
      <div>
         <lvx-table
          :data="tableData1"
          border
          style="width: 100%">
          <lvx-table-column
            prop="date"
            label="日期"
            align="center"
            header-align="center"
            width="180">
          </lvx-table-column>
          <lvx-table-column
            prop="name"
            label="姓名"
            align="center"
            width="180">
          </lvx-table-column>
          <lvx-table-column
            prop="address"
            align="center"
            label="地址">
          </lvx-table-column>
          <lvx-table-column
              fixed="right"
              label="操作"
              align="center"
              width="200">
              <template slot-scope="scope">
                <lvx-popover
                  ref="popover"
                  placement="top"
                  width="160"
                  trigger="click"
                 
                 >
                  
                  <div style="text-align: right; margin: 0">
                    <lvx-button size="mini" type="text" >取消</lvx-button>
                    <lvx-button type="primary" size="mini" >确定</lvx-button>
                  </div>
                </lvx-popover>
                <lvx-button type="text" size="small" v-popover="`popover`">删除</lvx-button>
              </template>

            </lvx-table-column>
        </lvx-table>

        <lvx-upload
          action="https://jsonplaceholder.typicode.com/posts/"
          class="upload-demo"
          ref="upload"
          accept="image/gif,image/jpeg,image/png"
          :total-size="1024*1024*10"
          :multiple="true"
          :on-total-spill="onTotalSpill"
          :auto-upload="false">
          <span slot="ready">等待上传</span>
          <span slot="success">上传成功</span>
          <lvx-button slot="trigger" size="small" type="primary">选取文件</lvx-button>
          <lvx-button style="margin-left: 10px;" size="small" type="success" @click="submitUpload">上传到服务器</lvx-button>
          <div slot="tip" class="lvx-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
        </lvx-upload>

        <lvx-select v-model="selectValue" placeholder="请选择" >
          <lvx-option
            v-for="item in options"
            :key="item.value"
            :label="item.label"
            :value="item.value">
          </lvx-option>
          <i class="lvx-input__icon lvx-icon-date" slot="prefix"></i>
        </lvx-select>
      </div>
    </div>
    <lvx-tree
      ref="treeDemo"
      :data="data2"
      show-checkbox
      node-key="id"
      :default-expanded-keys="[2, 3]"
      :default-checked-keys="[5]"
     >
    </lvx-tree>
    <lvx-button @click="getTreesNode">获取树选择的节点值</lvx-button>

    <div class="table-header-wrapper1" >
      <div class="table-header-fixed clearfix" style="width: 2678px">
        <div class="table-column fl" style="width:48px;">序号</div>
        <div class="table-column fl" style="width:180px;">车辆编号</div>
        <div class="table-column fl" style="width:240px;">VIN</div>
        <div class="table-column fl" style="width:120px;">区域</div>
        <div class="table-column fl" style="width:120px;">商户</div>
        <div class="table-column fl" style="width:120px;">新车/二手车</div>
        <div class="table-column fl" style="width:120px;">车辆状态</div>
        <div class="table-column fl" style="width:150px;">库存天数</div>
        <div class="table-column fl" style="width:180px;">入库时间</div>
        <div class="table-column fl" style="width:200px;">品牌车系</div>
        <div class="table-column fl" style="width:220px;">车型</div>
        <div class="table-column fl" style="width:180px;">首次上牌时间</div>
        <div class="table-column fl" style="width:120px;">表显里程(公里)</div>
        <div class="table-column fl" style="width:120px;">售价(万元)</div>
        <div class="table-column fl" style="width:120px;">估价(万元)</div>
        <div class="table-column fl" style="width:120px;">库存状态</div>
        <div class="table-column fl" style="width:120px;">备注</div>
        <div class="table-column-fixed fl" style="width:200px;">操作</div>
      </div>  
    </div> 
    <lvx-table
      :data="tableData"
      style="width: 100%"
      ref="carTable"
      row-key="id"
      class="repertory-table"
      @body-x-scroll="tableScroll"
      >
      <!-- <lvx-table-column
        fixed
        type="selection"
        width="55">
      </lvx-table-column> -->
      <lvx-table-column
        type="index"
        label="序号"
        align="center"
        min-width="100">
      </lvx-table-column>
      <lvx-table-column
        prop="carNo"
        label="车辆编号"
        align="center"
        width="180">
      </lvx-table-column>
      <lvx-table-column
        prop="vin"
        label="VIN"
        align="center"
        width="240">
        <template slot-scope="scope">
          <lvx-button type="text">{{scope.row.vin}}</lvx-button>
          <!-- <router-link :to="{path: '/repertory/repertory/detail', query: {id: scope.row.id}}" >{{scope.row.vin}}</router-link> -->
        </template>
      </lvx-table-column>
      <lvx-table-column
        prop="areaId"
        label="区域"
        align="center"
        width="120">
        <template slot-scope="scope">
          <span>{{scope.row.areaId}}</span>
        </template>
      </lvx-table-column>
      <lvx-table-column
        prop="tenantName"
        label="商户"
        align="center"
        width="120">
      </lvx-table-column>
      <lvx-table-column
        prop="isNewCar"
        label="新车/二手车"
        align="center"
        width="120">
        <template slot-scope="scope">
          <span>{{scope.row.isNewCar}}</span>
        </template>
      </lvx-table-column>
      <lvx-table-column
        prop="carStatus"
        label="车辆状态"
        align="center"
        width="120">
        <template slot-scope="scope">
          <span>{{scope.row.carStatus}}</span>
        </template>
      </lvx-table-column>
      <lvx-table-column
        prop="stockDays"
        label="库存天数"
        align="center"
        width="150">
      </lvx-table-column>
      <lvx-table-column
        prop="registerTime"
        label="入库时间"
        align="center"
        width="180">
        <template slot-scope="scope">
          <span>{{scope.row.registerTime}}</span>
        </template>
      </lvx-table-column>
      <lvx-table-column
        prop="seriesName"
        label="品牌车系"
        align="center"
        width="200">
        <template slot-scope="scope">
          <span>{{scope.row.brandName}}-{{scope.row.seriesName}}</span>
        </template>
      </lvx-table-column>
      <lvx-table-column
        prop="modelName"
        label="车型"
        align="center"
        width="220">
      </lvx-table-column>
      <lvx-table-column
        prop="initialLicenceTime"
        label="首次上牌时间"
        align="center"
        width="180">
        <template slot-scope="scope">
          <span>{{scope.row.initialLicenceTime}}</span>
        </template>
      </lvx-table-column>
      <lvx-table-column
        prop="mileage"
        label="表显里程(公里)"
        align="center"
        width="120">
      </lvx-table-column>
      <lvx-table-column
        prop="marketPrice"
        label="售价(万元)"
        align="center"
        width="120">
      </lvx-table-column>
      <lvx-table-column
        prop="evaluatePrice"
        label="估价(万元)"
        align="center"
        width="120">
      </lvx-table-column>
      <lvx-table-column
        prop="stockStatus"
        label="库存状态"
        align="center"
        width="120">
        <template slot-scope="scope">
          <span>{{scope.row.stockStatus}}</span>
        </template>
      </lvx-table-column>
      <lvx-table-column
        prop="remark"
        label="备注"
        align="center"
        width="120">
      </lvx-table-column>
      <lvx-table-column
        fixed="right"
        label="操作"
        align="center"
        width="200">
        <template slot-scope="scope">
       
        
        </template>
      </lvx-table-column>
    </lvx-table>
    <lvx-button type="primary" size="mini" @click="clearTableData">清空表格数据</lvx-button>
  </div>
</template>
<script>
  import Vue from 'vue';
  import Button from 'packages/button';
  
  Vue.use(Button);
  export default {
    data() {
      return {
        selectValue: '选项1',
        options: [{
          value: '选项1',
          label: '黄金糕'
        }, {
          value: '选项2',
          label: '双皮奶'
        }, {
          value: '选项3',
          label: '蚵仔煎'
        }, {
          value: '选项4',
          label: '龙须面'
        }, {
          value: '选项5',
          label: '北京烤鸭'
        }],
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
        tableData: [
          {
            'currentPage': 1,
            'pageSize': 20,
            'recordCount': 0,
            'recordList': null,
            'pageCount': 0,
            'beginPageIndex': 0,
            'endPageIndex': 20,
            'id': '18102717223750648639',
            'carNo': '01018102717223750648639',
            'staffId': null,
            'vin': 'LBVNU79049SB81001',
            'rfid': '010000000000002458911001',
            'tenant': '18102716161114852268',
            'tenantName': '蓝氏小仓库餐饮',
            'areaId': '18102716124770240062',
            'isNewCar': 1,
            'carType': 1,
            'stockStatus': 1,
            'carStatus': 2,
            'registerTime': '2018-10-27 17:22:38',
            'isvalid': 1,
            'marketId': '010',
            'brandName': '宝马',
            'brandCode': 'brand-20',
            'seriesName': '宝马5系',
            'seriesCode': 'series-425',
            'modelYear': null,
            'modelName': '2009款 宝马5系 525Li 领先型',
            'modelCode': '38228',
            'mileage': 600,
            'evaluatePrice': 10.17,
            'newPrice': 55.56,
            'color': '铜色',
            'engineVolumeUnitl': 2.5,
            'environmentalStandards': '欧IV',
            'gearBox': '6挡手自一体',
            'ownerName': '',
            'seatNumber': 5,
            'fuelForm': '汽油',
            'fuelNumber': null,
            'checkCompanyId': null,
            'updateOperator': null,
            'insterOperator': null,
            'insertTime': '2018-10-27 17:22:37',
            'updateTime': '2018-10-27 17:22:37',
            'level': '中大型车',
            'carAge': null,
            'stockDays': 2,
            'registerTimeStart': null,
            'registerTimeEnd': null,
            'initialLicenceTime': '2010-01-01 00:00:00.0',
            'remark': '',
            'taobaoId': null,
            'taobaoUrl': null,
            'seats': null,
            'accidentType': 1,
            'listCarPic': null,
            'shelfStatus': null,
            'channelId': null,
            'shelfNum': null,
            'carChannelId': null,
            'initialLicenceTimeStart': null,
            'initialLicenceTimeEnd': null,
            'yearStart': null,
            'yearEnd': null,
            'mileageStart': null,
            'mileageEnd': null,
            'src': null,
            'marketPrice': 10,
            'orderType': null,
            'priceType': null,
            'disType': null,
            'airConditionerControlType': null,
            'displacement1': null,
            'displacement2': null,
            'carChannelVos': null,
            'daSouChe': null
          }
        ],
        tableData1: [{
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
        imageUrl: '',
        data2: [{
          id: 1,
          label: '一级 1',
          children: [{
            id: 4,
            label: '二级 1-1',
            children: [{
              id: 9,
              label: '三级 1-1-1'
            }, {
              id: 10,
              label: '三级 1-1-2'
            }]
          }]
        }, {
          id: 2,
          label: '一级 2',
          children: [{
            id: 5,
            label: '二级 2-1'
          }, {
            id: 6,
            label: '二级 2-2'
          }]
        }, {
          id: 3,
          label: '一级 3',
          children: [{
            id: 7,
            label: '二级 3-1'
          }, {
            id: 8,
            label: '二级 3-2'
          }]
        }],
        scrollLeft: 0
        // imageUrl: require('../assets/images/user.jpg')
      };
    },
    watch: {
    },
    methods: {
      onTotalSpill(files) {
        this.$message({
          dangerouslyUseHTMLString: true,
          message: '<span style="color:#333">总文件大小超过限制<span>',
          type: 'error',
          customStyle: {
            backgroundColor: '#ffedec',
            minWidth: '316px',
            padding: '8px 15px 8px 20px'
          }
        });
      },
      handleAvatarDisallow() {
        this.$message({
          dangerouslyUseHTMLString: true,
          message: '<span style="color:#333">文件类型不符<span>',
          type: 'error',
          customStyle: {
            backgroundColor: '#ffedec',
            minWidth: '316px',
            padding: '8px 15px 8px 20px'
          }
        });
      },
      handleAvatarSpill() {
        this.$message({
          dangerouslyUseHTMLString: true,
          message: '<span style="color:#333">文件大小超过限制<span>',
          type: 'error',
          customStyle: {
            backgroundColor: '#ffedec',
            minWidth: '316px',
            padding: '8px 15px 8px 20px'
          }
        });
      },
      next() {
        if (this.active++ > 2) {
          this.active = 0;
        }
      },
      next1() {
        if (this.active1++ > 2) {
          this.active1 = 0;
        }
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
      },
      submitUpload() {
        this.$refs.upload.submit();
      },
      getTreesNode() {
        console.log(this.$refs['treeDemo'].getCheckedKeys());
      },
      tableScroll(e, eventSource) {
        document.querySelector('.table-header-wrapper1').scrollLeft = e.target.scrollLeft;
      },
      tableHeaderScroll(e) {
        this.$refs['carTable'].setScrollLeft(e.target.scrollLeft);
      },
      clearTableData() {
        this.tableData = [];
      }
    },
    created() {
    },
    mounted() {
      document.querySelector('.table-header-wrapper1').addEventListener('scroll', this.tableHeaderScroll);
    },
    destroyed() {
    },
    beforeDestroy() {
    }
  };
</script>

