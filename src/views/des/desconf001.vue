<template>
  <div >
<!--    <el-breadcrumb class="bread" separator="/">-->
<!--      <el-breadcrumb-item><i class="el-icon-menu"></i>数据脱敏</el-breadcrumb-item>-->
<!--    </el-breadcrumb>-->
<!--  <el-tabs type="border-card">-->
<!--    <el-tab-pane label="用户管理">-->
<!--    <testpart1></testpart1>-->
<!--    <el-button type="primary" @click="test"> 内部跳转 </el-button>-->
<!--    </el-tab-pane>-->
<!--    <el-tab-pane label="配置管理"  >配置管理</el-tab-pane>-->
<!--    <el-tab-pane label="角色管理">角色管理</el-tab-pane>-->
<!--    <el-tab-pane label="定时任务补偿">定时任务补偿</el-tab-pane>-->
<!--  </el-tabs>-->
<!--  <el-row>-->
<!--    <router-view ></router-view>-->
<!--  </el-row>-->
<div class="desbox">
  <el-card class="additem">
    <el-row :gutter="20" >

      <el-col :span="3" :offset="1" class="registfont textalign">数据脱敏</el-col>
      <el-col :span="2" :offset="10">
        <el-tooltip :content="'Switch value: ' + value" >
          <el-switch
            class="switchconf"
            v-model="value"
            active-color="#13ce66"
            inactive-color="#ff4949"
            active-value="1"
            inactive-value="0"
            @change="choice1">
          </el-switch>
        </el-tooltip>

      </el-col>
      <el-col :span="2" >开启/关闭</el-col>
    </el-row>
  </el-card>
  <el-card class="box-card">
    <div slot="header" class="clearfix">
      <span>选择模式</span>
    </div>
    <div v-for="o in 4" :key="o" class="text item">
      {{'列表内容 ' + o }}
    </div>
  </el-card>

</div>





  </div>
</template>

<script>
  // import testpart1  from "./testpart1"
  //   export default {
  //     data() {
  //       return {
  //
  //       }
  //     }, methods: {
  //       test() {
  //         // console.log("")
  //         alert("??/")
  //         this.$router.push({path:"/main/desconf/test"})
  //       }
  //     },
  //     components:{
  //       testpart1
  //     },
  //     mounted() {
  //       // this.test();
  //     }
  //   }
  import axios from "axios";
  export default {
    data() {
      return {
        value: 1
      }
    }, methods: {
      choice1(val) {
        // axios
        //   .post("/todo", {
        //     value: val,
        //   });
       // let aaa =localStorage.getItem("Flag")
        alert(val)
      }
    },
  };
</script>

<style scoped>
  .desbox {
    margin-top: 20px;
    margin-left: 30px;
    margin-right: 30px;
  }
  .textalign{
    line-height: 40px;
    text-align:center
  }
  .registfont{
    font-size: 30px;
  }
  .text {
    font-size: 14px;
  }

  .item {
    margin-bottom: 18px;
  }

  .clearfix:before,
  .clearfix:after {
    display: table;
    content: "";
  }
  .clearfix:after {
    clear: both
  }

  .box-card {
    width: 480px;
  }
  .switchconf{
    width: 100px;
    height: 60px;
  }
</style>
