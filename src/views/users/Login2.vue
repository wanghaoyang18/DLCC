<template>
    <div >
        <el-container>
        <el-header class="login_header_out" style="height:80px">
            <div class="login_header_left">IBE</div>
            <div class="login_header_right">...</div>
        </el-header>
        <el-main class="login_main ">
              <div class="PPT clearfix" >
                  <el-carousel height="500px"  indicator-position="outside" >
                    <el-carousel-item v-for="item in pic" :key="item" >
    	                <div class="banner_item " :style="{backgroundImage:'url(' + item + ')'}"> </div>
                    </el-carousel-item>
                 </el-carousel>
              </div>
                  <div class="login_form ">
                      <div class="login_title">账号登录</div>
                      <hr class="hr_line">
                      <el-row class="login_detail_username">
                        <el-col :span="3" :offset="3" class="username_align">账号</el-col>
                        <el-col :span="15"><el-input v-model="username" placeholder="请输入账号" clearable ></el-input></el-col>
                      </el-row>
                      <el-row class="login_detail_passwd">
                        <el-col :span="3" :offset="3" class="username_align">密码</el-col>
                        <el-col :span="15"><el-input type="password" v-model="username" placeholder="请输入账号" clearable ></el-input></el-col>
                      </el-row>
                      <el-row class="login_detail_remember">
                          <el-col :span="21"  :offset="3"   class="remember_font"><el-checkbox  v-model="checked"><span class="remember_font">下次自动登录</span></el-checkbox></el-col>
                      </el-row>
                       <el-row class="login_detail_remember">
                        <el-col :span="18" :offset="3" class="username_align"><el-button type="primary" class="login_button" @click="login">登录</el-button></el-col>
                      </el-row >
                       <el-row class="help" :gutter="10">
                        <el-col :span="4"  :offset="12"><router-link to="/forgetpassword" class="help_font">忘记密码</router-link></el-col>
                        <el-col :span="1"  class="help_center"><span class="help_font">|</span></el-col>
                        <el-col :span="5" ><router-link to="/register" class="help_font">注册新账号</router-link></el-col>
                       </el-row>
                  </div>
                  <el-footer class="footer" style="height:40px;">
                      <div class="footer_content">若有问题，联系我们</div></el-footer>
        </el-main>
        </el-container>
    </div>
</template>

<script>
import item1 from "../../static/banner/1.jpg";
import item2 from "../../static/banner/2.jpg";
import item3 from "../../static/banner/3.jpg";

    export default {
        data() {
            return {
                pic: [item1,item2,item3],
                pic1:["../../static/banner/1.jpg","../../static/banner/1.jpg","../../static/banner/1.jpg"]
            }
        },
        methods: {
            login() {
                  this.$router.push({path:"/main/hostlist"})
            }
        },
    }
</script>


<style scoped>

.help_center{
    text-align: center
}
.help_font{
    font-size: 10px;
    text-decoration: None;
}

.help{
    margin-top: 60px
}

.login_button{
    width:100%;
}
.remember_font{
    font-size: 12px
}

.login_detail_remember{
    margin-top: 15px;
}
.username_align{
    line-height: 40px;
}

.hr_line{
    background-color:#9ab4d4;
    height: 1px;
}
.login_form .login_detail_username{
    margin-top: 50px
}

.login_detail_passwd{
    margin-top: 30px
}
.login_title{
    line-height: 50px;
    font-size: 17px;
    text-align: center;
}
.login_main{
    height: 100%;
    min-width: 1300px;
    
}

.login_form{
    height: 400px;
    width: 300px;
    border: #9ab4d4 solid 2px; 
    /* margin-top: 120px; */
    border-radius: 5px;
    min-width: 500px;
    min-height: 400px;
    display: inline-block;
    position: fixed;
    left:1200px;
    top:230px;
}
 .PPT{
        margin-top: 100px;
        min-height: 500px;
        min-width: 900px;
        display: inline-block;
        position: fixed;
        left: 100px;
        top: 100px;    
  }

  .el-carousel__item h3 {
    color: #475669;
    font-size: 14px;
    opacity: 0.75;
    line-height: 150px;
    margin: 0;
  }

 

.login_header_right{
    overflow: hidden;
    margin-top: 16px;
    padding-right: 17px;
    line-height: 50px;
    text-align: right;
    color: #b6b6b6;
    display: inline-block;
    float:right;
   
}
.login_header_left{
    overflow: hidden;
    margin-top: 16px;
    padding-left: 17px;
    line-height: 50px;
    text-align: right;
    color: rgb(43, 146, 248);
    font-size: 45px;
    display: inline-block; 
    float: left;
}
.login_header_out{
    background-color: #eff4fa;;
    border-bottom: 1px solid #d6dfea;
    box-shadow:5px 2px 1px rgb(233, 226, 226);
}
.clearfix:after{  
   content: "";  
   display: block;  
   height: 0;  
   clear: both;  
   visibility: hidden;   

} 
.footer{
    position: absolute;
    bottom: 0px;
    left:0px;
    width:100%;
    background-color: #eff4fa;;
    border-top: 1px solid #d6dfea;
    box-shadow:5px 2px 1px rgb(233, 226, 226);
}

.footer_content{
    text-align: center;
    align-content: center;
    height: 40px;
    line-height: 40px;
    color: #1d5494;
    font-size: 15px;
}
.banner_item{
    background-size: cover;
    height: 100%;
    border-radius: 5px;
}


</style>