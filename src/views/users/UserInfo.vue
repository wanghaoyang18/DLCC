<template>
<!--    <div>-->
<!--        <el-row>-->
<!--          <el-col :span="4" :offset=4 class="registfont textalign">账号</el-col>-->
<!--          <el-col :span="8" ><el-input  placeholder="请输入内容" v-model="input10" clearable></el-input></el-col>-->
<!--          <el-col :span="4" :offset=1 class="errorfont" v-show="true">您的账号输入错误</el-col>-->
<!--        </el-row>-->
<!--    </div>-->
  <div>
    <el-card style="margin-right: 10px;margin-left: 10px;margin-top: 15px">
      <el-col span="6">
<!--        <img :src="this.touxiangs[touxiang]" style="width: 150px;height: 150px;border-radius: 50%;margin-left: 10px;margin-top: -10px">-->
        <img src="../../static/touxiang.png" style="width: 150px;height: 150px;border-radius: 50%;margin-left: 10px;margin-top: -10px">
      </el-col>
      <el-col span="18">
        <el-row>
          <el-col span="8">用户名
            <el-input class="dia_input"  v-model="usernameM"style="width:60%" v-bind:disabled="!this.switch_flag"></el-input>

          </el-col>
          <el-col span="8">手机号
            <el-input class="dia_input"  v-model="mobileM"style="width:60%" v-bind:disabled="!this.switch_flag"></el-input>
          </el-col>
          <el-col span="8">邮箱
            <el-input class="dia_input"  v-model="emailM"style="width:60%" v-bind:disabled="!this.switch_flag"></el-input>
          </el-col>
        </el-row>
        <el-row style="margin-top: 2%">
          <el-col span="8">密码
            <el-input class="dia_input"  v-model="passM"style="width:60%;margin-left: 17%" v-bind:disabled="!this.switch_flag"></el-input>
          </el-col>
          <el-col span="8">权限
            <el-input class="dia_input"  v-model="levelM"style="width:60%;margin-left: 17%" v-bind:disabled="!this.switch_flag"></el-input>
          </el-col>
          <el-col span="8">头像
            <el-select v-model="touxiang" style="margin-left: 12%;width: 60%" v-bind:disabled="!this.switch_flag">
              <el-option label="neko"
                         value=0
              ></el-option>
              <el-option label="keai"
                         value=1
              ></el-option>
            </el-select>

          </el-col>
        </el-row>
        <el-row style="margin-top: 1.5%">
          <el-switch
            v-model="switch_flag"
            active-text="启动修改"
            inactive-text="关闭修改"
            active-color="#13ce66"
            inactive-color="#ff4949"
            style="margin-left: 20%;margin-top: 3px"
          >
          </el-switch >
          <el-button type="primary" size="mini" style="margin-left: 25%">
            确定
          </el-button>
        </el-row>
      </el-col>
    </el-card>
  <el-card style="margin-right: 10px;margin-left: 10px;margin-top: 15px">
    <el-row :gutter="50" style="margin-top:5px;margin-bottom:15px;">
      <el-col :span="8" style="margin-left: 5px;font-size: 20px;font-weight: 600;color: #d87a80">添加用户</el-col>
    </el-row>
    <hr style="border:solid 0.5px rgb(222,222,222);margin-bottom: 20px"/>
    <el-row :gutter="50">
      <el-col :span="8">
        <span class="filter_span" style="margin-left: 10px">用户名</span>
        <el-input class="dia_input"  v-model="usernameT" placeholder="请输入未被使用的用户名" style="width:60%"></el-input>
      </el-col>
      <el-col :span="8">
        <span class="filter_span">手机号</span>
        <el-input class="dia_input" v-model="mobileT" placeholder="请输入有效手机号">
        </el-input>
      </el-col>
      <el-col :span="8">
        <span class="filter_span">邮箱</span>
        <el-input  v-model="emailT" placeholder="请输入有效邮箱" style="width:70%;margin-left: 23px"></el-input>
      </el-col>
    </el-row>
    <el-row :gutter="50" style="margin-top: 10px">
      <el-col :span="8">
        <span class="filter_span" style="margin-left: 10px">密码</span>
        <el-input   type="password" v-model="passwordT" style="width: 60%;margin-left: 42px"  placeholder="请设置登录密码" ></el-input>
      </el-col>
      <el-col :span="8">
        <span class="filter_span">确认密码</span>
        <el-input   type="password" v-model="password2T" style="width: 70%;margin-left: 18px" placeholder="请确认登录密码">
        </el-input>
      </el-col>
      <el-col :span="8">
        <span class="filter_span">设置权限</span>
        <el-select style="width: 70%">
          <el-option label="操作员" value="2"></el-option>
          <el-option label="观察员" value="3"></el-option>
        </el-select>
<!--        <el-input   type="password" v-model="password2T" style="width: 70%;margin-left: 18px" placeholder="请确认登录密码">-->
<!--        </el-input>-->
      </el-col>
    </el-row>
    <el-row>
      <el-col span="8" style="margin-left: 10px;margin-top: 15px"><el-button type="primary" @click="adduser()">添加</el-button></el-col>
    </el-row>
  </el-card>

    <el-card style="margin-left: 10px;margin-top: 20px;margin-right: 10px" >



      <el-row :gutter="50" style="margin-top:15px;margin-bottom:15px;">
        <el-col :span="8" style="margin-left: 5px;font-size: 20px;font-weight: 600;color: #409EFF">
          <!--        <el-button  @click="check" >查找</el-button>-->
          <!--        <el-button  @click="addmointoritem" style="margin-left:27px" >添加监控</el-button>-->
          用户列表
        </el-col>
        <el-col :span="4" offset="11"><el-button type="primary" style="margin-left: 30px" @click="getuser()">刷新</el-button></el-col>
      </el-row>

      <hr style="border:solid 0.5px rgb(222,222,222)"/>


      <el-table :data="userdata" style="width:100%;"  fit stripe>
        <el-table-column label="用户名"  >
          <template slot-scope="scope">
            <span > {{scope.row.username}}</span>
          </template>
        </el-table-column>
        <el-table-column label="密码"  >
          <template slot-scope="scope">
            <span v-if="Amod"> {{scope.row.password}}</span>
            <span v-if="Bmod" style="color: red"> ****</span>
          </template>
        </el-table-column>
        <el-table-column label="手机号"  >
          <template slot-scope="scope">
            <span > {{scope.row.mobile}}</span>
          </template>
        </el-table-column>
        <el-table-column label="邮箱"  >
          <template slot-scope="scope">
            <span > {{scope.row.email}}</span>
          </template>
        </el-table-column>


        <el-table-column label="创建日期"  >
          <template slot-scope="scope">
            <span > {{scope.row.cdate}}</span>
          </template>
        </el-table-column>
        <!--      <el-table-column label="用户状态" >-->
        <!--        <template slot-scope="scope">-->
        <!--          <span v-bind:style="{ color: fontcolor(scope.row.ischange)}"> {{scope.row.ischange}}</span>-->
        <!--        </template>-->
        <!--      </el-table-column>-->
        <el-table-column label="操作" >
          <template slot-scope="scope">
            <el-button type="warning" size="small"  @click="deluser(scope.$index,scope.row)">删除</el-button>
            <el-button type="success" size="small" @click="datachange(scope.$index, scope.row)">详情</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>

    <el-dialog
      title="修改条目"
      :visible.sync="dialogVisible"
      width="30%"
      :before-close="dialog_handlehandleClose">
      <el-row class="dia_row">
        <el-col :span="3"><span>用户</span> </el-col>
        <el-col :span="21"><el-input class="dia_input" classv-model="input"  v-model="usernameST" disabled></el-input></el-col>
      </el-row>
      <el-row class="dia_row">
        <el-col :span="3"><span>密码</span> </el-col>
        <el-col :span="21"><el-input class="dia_input" classv-model="input" v-model="passwordST"></el-input></el-col>
      </el-row>
      <el-row class="dia_row">
        <el-col :span="3"><span>电话</span> </el-col>
        <el-col :span="21"><el-input class="dia_input" classv-model="input" v-model="mobileST"></el-input></el-col>
      </el-row>
      <el-row class="dia_row">
        <el-col :span="3"><span>邮箱</span> </el-col>
        <el-col :span="21"><el-input class="dia_input" classv-model="input"  v-model="emailST"></el-input></el-col>
      </el-row>
      <el-row class="dia_row">
        <el-col :span="3"><span>创建</span> </el-col>
        <el-col :span="21"><el-input class="dia_input" classv-model="input"  v-model="cdateST" disabled></el-input></el-col>
      </el-row>


      <span slot="footer" class="dialog-footer">
                <el-button @click="dialogVisible = false" size="small" type="warning" style="text-align:center;">取 消</el-button>
                <el-button   size="small" type="primary"  style="text-align:center;" @click="Achange">确 定</el-button>
            </span>
    </el-dialog>
  </div>
</template>

<script>
import axios from "axios";
// import Qs from "qs"
  export default {
    props:{
      username:String,
      usernameT:String,
      mobileT :String,
      emailT:String,
      passwordT:String,
    },
    data() {
      return {

        usernameM:'admin',
        mobileM:'18846283699',
        emailM:'DmsTestAdmin@qq.com',
        passM:'admin123',
        levelM:'管理员',

        touxiang:0,

        switch_flag:false,
        touxiangs:[
          "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=302537951,2318234966&fm=26&gp=0.jpg",
          "https://imgsa.baidu.com/forum/w%3D580%3B/sign=f7314ccd978fa0ec7fc7640516ac5bee/2934349b033b5bb55c0bae0030d3d539b700bc74.jpg",
        ],

        Amod: false,
        Bmod: true,
        usernameT : "",
        mobileT :"",
        emailT:"",
        passwordT:"",
        password2T:"",
        dialogVisible: false,
        usernameST : "",
        mobileST :"",
        emailST:"",
        passwordST:"",
        cdateST:"",
        userdata: [
          {
            username:"admin",
            password:"111",
            mobile: "1234567890",
            email: "1@1com",
            cdate:"12/12/12",
          },
          {
            username:"ab",
            password:"111",
            mobile: "1234567890",
            email: "1@1com",
            cdate:"12/12/12",
          },
          {
            username:"ccc",
            password:"111",
            mobile: "1234567890",
            email: "1@1com",
            cdate:"12/12/12",
          },
        ],
      }
    },
    methods: {
      adduser() {
        // var curDate = new Date().toLocaleDateString();
        // this.cdateT=curDate.format("YYYY-MM-DD").toLocaleDateString();
        // this.$message.error(curDate);
        // alert("???")
        if(this.usernameT=="" || this.mobileT=="" ||this.emailT==""||this.passwordT==""||this.password2T=="")
        {
          this.$message.error("请完整填写信息")
        }
        else if (this.passwordT!=this.password2T) {
          this.$message.error("两次密码不一致")
        }
        else
        {
          // this.$message.error("kaigewanx")
          // this.$message.error(this.usernameT);
          // var curDate = new Date();
          // this.cdateT=new Date(curDate.getTime() - 15*24*60*60*1000);
          // this.cdateT=moment(this.cdateT).format("YYYY-MM-DD");
          // this.$message.error(this.cdateT);
          var date = new Date();
          var seperator1 = "-";
          var year = date.getFullYear();
          var month = date.getMonth() + 1;
          var strDate = date.getDate();
          if (month >= 1 && month <= 9) {
            month = "0" + month;
          }
          if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
          }
          var currentdate = year + seperator1 + month + seperator1 + strDate;
          axios.post("/sysuser/adduser/",{
            username:this.usernameT,
            password:this.passwordT,
            mobile: this.mobileT,
            email:  this.emailT,
            cdate:currentdate,
            // username:"111",
            // password:"111",
            // mobile:"111",
            // email:"111",
            // cdate:"1998-12-12" ,
          }).then(res=>{
            if (res.status==200){
              this.$message({
                type: "success",
                message: "添加成功!"
              });
            }else{
              this.$message.error("添加失败")
            }
          })
            .catch((error)=>{
            console.log(error)
          })
        }
      },
      getuser() {
        axios.get("/sysuser/listuser").then(res=>{
          var nowuser = sessionStorage.getItem("Flag");
          if(nowuser ==="admin"){
            this.Bmod = false;
            this.Amod = true;
            this.userdata=res.data.res
          }else{
            this.userdata=res.data.res
          }


        })

      },
      deluser(index,row) {
          this.$confirm("确定删除此用户吗?"+index, "提示", {
                confirmButtonText: "确定",
                cancelButtonText: "取消",
                type: "warning"
              })
                .then(() => {
                axios.post("/sysuser/deluser/",{
                  username:row.username
                }).then(res=>{
                  if (res.status==200){
                    this.$message({
                      type: "success",
                      message: "删除成功!"
                    });
                  }else{
                    this.$message.error("删除失败")
                  }
                })
            })
            .catch(() => {
              this.$message({
                type: "info",
                message: "已取消"
              });
            });
      },
      datachange(index,row){
        var nowuser = localStorage.getItem("Flag");
        if(nowuser ==="admin"){
          this.usernameST = row.username;
          this.passwordST = row.password;
          this.mobileST = row.mobile;
          this.emailST = row.email;
          this.cdateST = row.cdate;
          this.dialogVisible = true;

        }
        else if(nowuser ===row.username){
          this.usernameST = row.username;
          this.passwordST = row.password;
          this.mobileST = row.mobile;
          this.emailST = row.email;
          this.cdateST = row.cdate;
          this.dialogVisible = true;
        }else{
          this.$message({
            type: "error",
            message: nowuser+"没有权限"
          });
        }
      },
      Achange(){
        axios.post("/sysuser/deluser/",{
          username:this.usernameST
        });
        axios.post("/sysuser/adduser/",{
          username:this.usernameST,
          password:this.passwordST,
          mobile: this.mobileST,
          email:  this.emailST,
          cdate:this.cdateST,

        }).then(res=>{
          if (res.status==200){
            this.$message({
              type: "success",
              message: "修改成功!"
            });
          }else{
            this.$message.error("修改失败")
          }
        })
      }


    },

    mounted() {
      this.getuser()
    },

  }
</script>

<style scoped>

.dia_input {
  margin-left: 30px;
  width: 70%;

}

.filter_span{
  line-height: 40px;
  display: inline-block;
  margin-right: 20px;
  color: rgb(112, 112, 112)
}
</style>
