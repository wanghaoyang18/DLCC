<template>
  <div>
  <el-breadcrumb class="bread" separator="/" style="margin:20px">
  <el-breadcrumb-item><i class="el-icon-menu"></i>数据脱敏</el-breadcrumb-item>
</el-breadcrumb>
  <div class="desbox">
    <el-col span="12">
    <el-card class="box-card0">
      <el-row :gutter="20" >
        <span class="registfont textalign">数据脱敏</span>
<!--        <el-col :span="4"  class="registfont textalign">数据脱敏</el-col>-->
      </el-row>
    </el-card>
    </el-col>

    <el-col span="12">
    <el-card class="box-card" >
      <div slot="header" class="clearfix">
        <div class="mod01">选择脱敏模式</div>
      </div>
      <div >
        <template>
          <el-select v-model="value" placeholder="请选择" class="sel">
            <el-option
              v-for="item in options"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </template>
        <el-button style="margin-left: 20%" type="primary" @click="desgo(value)">执行</el-button>
      </div>
    </el-card>
    </el-col>

    <el-card style="margin-top: 2px">
      <el-collapse v-model="activeName" accordion style="margin-top: -21px;margin-bottom: -21px">
        <el-collapse-item title="在线测试 " name="1" class="collapse ">
          <el-row style="margin-left: 5px;font-size: 20px;font-weight: 600">
            <hr style="border:solid 0.2px rgb(233,233,233)"/>
            <el-col :span="9">
              <el-row style="margin-top: 20px">
                <span style="font-size: 15px;font-weight: 400;margin-left: 5%">姓名</span>
                <el-input v-model="Dname" placeholder="例：王小明" style="width:80%;margin-left: 5%"></el-input>
              </el-row>
              <el-row style="margin-top: 20px">
                <span style="font-size: 15px;font-weight: 400;margin-left: 5%">手机</span>
                <el-input v-model="Dmobile" placeholder="例：1234567890" style="width:80%;margin-left: 5%"></el-input>
              </el-row>
              <el-row style="margin-top: 20px">
                <span style="font-size: 15px;font-weight: 400;margin-left: 5%">地址</span>
                <el-input v-model="Daddress" placeholder="例：辽宁省大连市甘井子区道理街21号" style="width:80%;margin-left: 5%"></el-input>
              </el-row>
              <el-row style="margin-top: 20px">
                <span style="font-size: 15px;font-weight: 400;margin-left: 5%">邮箱</span>
                <el-input v-model="Demail" placeholder="例：12345678@qq.com" style="width:80%;margin-left: 5%"></el-input>
              </el-row>
            </el-col>
            <el-col :span="6">
              <el-button type="primary" style="margin-top: 30%;margin-left: 40%" round @click="destest()">执行脱敏</el-button>
              <el-button type="success" style="margin-top: 5%;margin-left: 36%" round plain @click="showJson()">查看json数据</el-button>
            </el-col>
            <el-col :span="9">
              <el-row style="margin-top: 20px">
                <span style="font-size: 15px;font-weight: 400;margin-left: 5%">姓名</span>
                <el-input v-model="Ddname" placeholder="脱敏结果" style="width:80%;margin-left: 5%" disabled></el-input>
              </el-row>
              <el-row style="margin-top: 20px">
                <span style="font-size: 15px;font-weight: 400;margin-left: 5%">手机</span>
                <el-input v-model="Ddmobile" placeholder="脱敏结果" style="width:80%;margin-left: 5%" disabled></el-input>
              </el-row>
              <el-row style="margin-top: 20px">
                <span style="font-size: 15px;font-weight: 400;margin-left: 5%">地址</span>
                <el-input v-model="Ddaddress" placeholder="脱敏结果" style="width:80%;margin-left: 5%" disabled></el-input>
              </el-row>
              <el-row style="margin-top: 20px">
                <span style="font-size: 15px;font-weight: 400;margin-left: 5%">邮箱</span>
                <el-input v-model="Ddemail" placeholder="脱敏结果" style="width:80%;margin-left: 5%" disabled></el-input>
              </el-row>
            </el-col>
          </el-row>
        </el-collapse-item>
      </el-collapse>
    </el-card>


    <el-card style="margin-top: 10px">
      <el-row style="margin-bottom: 10px">
        <span class="descri" >脱敏级别注释：</span>
      </el-row>
      <el-col span="12">
      <el-card style="margin-left: 30px;margin-right: 3px;margin-top: 0px" shadow="never">
        <el-row class="desrow1">
          <el-col span="8" offset="1" class="destext1" style="margin-top: 10px;font-size: 18px;font-weight: 600">遮蔽一级:</el-col>
        </el-row>
        <el-row class="desrow1">
          <el-col span="12" offset="1" class="destext1" style="margin-top: 10px;font-size: 18px"><span class="destext1s">(对数据进行部分遮蔽处理)</span></el-col>
        </el-row>
        <el-row>
          <el-col :span="3" offset="1" style="margin-top: 10px;color: #409EFF;font-size: 15px"><strong>示例：</strong></el-col>
        </el-row>
        <el-divider></el-divider>
        <el-row class="desrow1" style="margin-top: 10px;">
          <el-col :span="2" offset="1" class="destext1" style="margin-right: 0px;padding-right: 0px;font-size: 14px;color: #9ab4d4">原始数据:</el-col>
          <el-col :span="6" offset="1" class="desdesc1" style="margin-right: 0px;padding-right: 0px"><span class="destesc1">{辽宁省大连市开发区图强街，19203672987}</span></el-col>
          <el-col :span="2" offset="1" class="destext2" style="margin-left: 50px;color: green;font-size: 14px">经过脱敏:</el-col>
          <el-col :span="6" offset="1"><span class="desdesc2">{辽宁省大连市<span class="despart">**</span>区<span class="despart">**</span>街，</span><span class="desdesc2">19203<span class="despart">***</span>87}</span></el-col>
        </el-row>
      </el-card>
      </el-col>
      <el-col span="12">
      <el-card style="margin-left: 0px;margin-right: 30px;margin-top: 0px" shadow="never">
        <el-row class="desrow1">
          <el-col span="8" offset="1" class="destext1" style="margin-top: 10px;font-size: 18px;font-weight: 600">遮蔽二级:</el-col>
        </el-row>
        <el-row class="desrow1">
          <el-col span="12" offset="1" class="destext1" style="margin-top: 10px;font-size: 18px"><span class="destext1s">(对数据进行更多遮蔽处理)</span></el-col>
        </el-row>
        <el-row>
          <el-col :span="3" offset="1" style="margin-top: 10px;color: #409EFF;font-size: 15px"><strong>示例：</strong></el-col>
        </el-row>
        <el-divider></el-divider>
        <el-row class="desrow1" style="margin-top: 10px;">
          <el-col :span="2" offset="1" class="destext1" style="margin-right: 0px;padding-right: 0px;font-size: 14px;color: #9ab4d4">原始数据:</el-col>
          <el-col :span="6" offset="1" class="desdesc1" style="margin-right: 0px;padding-right: 0px"><span class="destesc1">{辽宁省大连市开发区图强街，19203672987}</span></el-col>
          <el-col :span="2" offset="1" class="destext2" style="margin-left: 50px;color: green;font-size: 14px">经过脱敏:</el-col>
          <el-col :span="6" offset="1"><span class="desdesc2">{<span class="despart">**</span>省<span class="despart">**</span>市<span class="despart">**</span>区<span class="despart">**</span>街，</span><span class="desdesc2">192<span class="despart">***</span>87}</span></el-col>
        </el-row>
      </el-card>
      </el-col>
      <el-col span="12">
      <el-card style="margin-left: 30px;margin-right: 3px;margin-top: 3px" shadow="never">
        <el-row class="desrow1">
          <el-col span="8" offset="1" class="destext1" style="margin-top: 10px;font-size: 18px;font-weight: 600">拟真一级:</el-col>
        </el-row>
        <el-row class="desrow1">
          <el-col span="12" offset="1" class="destext1" style="margin-top: 10px;font-size: 18px"><span class="destext1s">(对数据进行部分仿真伪造)</span></el-col>
        </el-row>
        <el-row>
          <el-col :span="3" offset="1" style="margin-top: 10px;color: #409EFF;font-size: 15px"><strong>示例：</strong></el-col>
        </el-row>
        <el-divider></el-divider>
        <el-row class="desrow1" style="margin-top: 10px;">
          <el-col :span="2" offset="1" class="destext1" style="margin-right: 0px;padding-right: 0px;font-size: 14px;color: #9ab4d4">原始数据:</el-col>
          <el-col :span="6" offset="1" class="desdesc1" style="margin-right: 0px;padding-right: 0px"><span class="destesc1">{辽宁省大连市开发区图强街，19203672987}</span></el-col>
          <el-col :span="2" offset="1" class="destext2" style="margin-left: 50px;color: green;font-size: 14px">经过脱敏:</el-col>
          <el-col :span="6" offset="1"><span class="desdesc2">{辽宁省大连市<span class="despart">道理</span>区<span class="despart">湾里</span>街，</span><span class="desdesc2">19203<span class="despart">47027</span>87}</span></el-col>
        </el-row>
      </el-card>
      </el-col>
      <el-col span="12">
      <el-card style="margin-left: 0px;margin-right: 30px;margin-top: 3px;margin-bottom: 30px" shadow="never">
        <el-row class="desrow1">
          <el-col span="8" offset="1" class="destext1" style="margin-top: 10px;font-size: 18px;font-weight: 600">拟真二级:</el-col>
        </el-row>
        <el-row class="desrow1">
          <el-col span="12" offset="1" class="destext1" style="margin-top: 10px;font-size: 18px"><span class="destext1s">(对数据进行更多仿真伪造)</span></el-col>
        </el-row>
        <el-row>
          <el-col :span="3" offset="1" style="margin-top: 10px;color: #409EFF;font-size: 15px"><strong>示例：</strong></el-col>
        </el-row>
        <el-divider></el-divider>
        <el-row class="desrow1" style="margin-top: 10px;">
          <el-col :span="2" offset="1" class="destext1" style="margin-right: 0px;padding-right: 0px;font-size: 14px;color: #9ab4d4">原始数据:</el-col>
          <el-col :span="6" offset="1" class="desdesc1" style="margin-right: 0px;padding-right: 0px"><span class="destesc1">{辽宁省大连市开发区图强街，19203672987}</span></el-col>
          <el-col :span="2" offset="1" class="destext2" style="margin-left: 50px;color: green;font-size: 14px">经过脱敏:</el-col>
          <el-col :span="6" offset="1"><span class="desdesc2">{<span class="despart">吉林</span>省<span class="despart">海湾</span>市<span class="despart">南巷</span>区<span class="despart">富源</span>街，</span><span class="desdesc2">192<span class="despart">7835016</span>87}</span></el-col>
        </el-row>
      </el-card>
      </el-col>

    </el-card>
  </div>

    <el-dialog
      title="Json数据"
      :visible.sync="dialogVisible"
      width="30%"
      :before-close="handleClose">
      <el-row>
        <el-col style="margin-right: 0px;padding-right: 0px">
          <span style="display:inline-block;width:100%;word-wrap:break-word;white-space:normal;">{{Djson}}</span>
      </el-col>
      </el-row>
      <el-col><i class="el-icon-sort-down item" style="font-size: 200%;margin-left: 45%;margin-top: 2%;color: darkblue">      </i>
      </el-col>
      <el-row>
        <el-col style="margin-right: 0px;padding-right: 0px">
          <span style="display:inline-block;width:100%;word-wrap:break-word;white-space:normal;">{{Ddjson}}</span>
        </el-col>
      </el-row>

      <span slot="footer" class="dialog-footer">
  </span>
    </el-dialog>
  </div>

</template>

<script>
  import axios from "axios";
  export default {
    data() {
      return {
        options: [{
          value: 1,
          label: '遮蔽一级'
        }, {
          value: 2,
          label: '遮蔽二级'
        }, {
          value: 3,
          label: '拟真一级'
        }, {
          value: 4,
          label: '拟真二级'
        }],
        value: '',
        value1: 1,
        injson :'{}',
        Dname: '王小明',
        Dmobile:'1234567890',
        Daddress:'辽宁省大连市甘井子区道理街21号',
        Demail:'12345678@qq.com',
        Ddname:'',
        Ddmobile:'',
        Ddaddress:'',
        Ddemail:'',
        Djson:'{"name":"王小明","phonenumber":"12345678901","address":"辽宁省大连市甘井子区道理街21号","email":"12345678@qq.com"}',
        Ddjson:'',
        dialogVisible: false,
        activeName:'1',
      }
    }, methods: {
      desgo(value) {
        //请求修改脱敏级别
        if (value==1)
          axios.
            get("/setlevel1/").then(res =>{
            this.$message({
              type: "success",
              message: "设置成功!"
            });
          });
        else if (value==2)
          axios.
            get("/setlevel2/").then(res =>{
            this.$message({
              type: "success",
              message: "设置成功!"
            });
          });
        else if (value==3)
          axios.
            get("/setlevel3/").then(res =>{
            this.$message({
              type: "success",
              message: "设置成功!"
            });
          });
        else if (value==4)
          axios.
            get("/setlevel4/").then(res =>{
            this.$message({
              type: "success",
              message: "设置成功!"
            });
          });
        else
          alert("设置失败"+ value)

      },
      getlv() {
        axios.
          get("/Desens/getlevel/").then(res =>{
            this.value = res.data.res
        })
      },
      destest() {
        axios.
          post("/Desens/des1/",{
          name:this.Dname,
          phonenumber:this.Dmobile,
          address:this.Daddress,
          email:this.Demail
        }).then(res=>{
          if(res.status==200){
            this.Ddjson=
              "{\"name\":"+res.data.res.name+","+
              "\"phonenumber:\""+res.data.res.phonenumber+","+
              "\"address:\""+res.data.res.address+","+
              "\"email:\""+res.data.res.email+"}";
            this.Ddname=res.data.res.name;
            this.Ddmobile=res.data.res.phonenumber;
            this.Ddaddress=res.data.res.address;
            this.Ddemail=res.data.res.email;
          }else {
            this.$message({
              type: "warning",
              message: 发生意外错误
            });
          }
        })

      },
      showJson(){
        this.Djson=
          "{\"name\":"+this.Dname+","+
          "\"phonenumber:\""+this.Dmobile+","+
          "\"address:\""+this.Daddress+","+
          "\"email:\""+this.Demail+"}";
        this.dialogVisible = true;
      }

    },
    mounted() {
      this.getlv()
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
    font-style: initial;
    color: #475669;
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
    width: 100%;
    margin-bottom: 10px;
    /*margin-left: 5px;*/
    margin-right: 5px;
  }
  .box-card0 {
    width: 99%;
    margin-bottom: 10px;
    margin-right: 5px;
  }
  .switchconf{
    width: 50px;
    height: 50px;
  }
  .testoo{
    margin-top: 17px;
    margin-left: 5px;
    padding-left: 5px;
    font-size: 15px;
    color: #1d5494;
  }
  .mod01{
    font-size: 20px;
    margin-left: 45px;
    font-weight: 600;
  }
  .sel{
    margin-left: 50px;
  }
  .descri{
    font-size: 15px;
    color: cornflowerblue;
    margin-left: 0px;
    margin-top: 0px;
    padding-left: 0px;
    padding-top: 0px;
  }
  .desdesc1{
    font-size: 15px;
  }
  .desdesc2{
    font-size: 15px;
  }
  .despart{
    font-size: 15px;
    color: #409EFF;
  }


  .collapse >>>.el-collapse-item__header{
    margin-left: 20px;
    margin-top: 10px;
    padding-bottom: 55px;
    color: #303133;
    font-size: 20px;
    font-weight: 600;
  }
  /*.collapseline >>>.el-collapse{*/
  /*  border-top: 0px solid #ebeef5;*/
  /*  border-bottom: 0px solid #ebeef5;*/
  /*}*/
</style>
