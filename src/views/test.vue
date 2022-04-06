<template>
 
    <div >
      <!-- <el-container>
        <el-header class="login_header_out" style="height:80px;">
            <div class="login_header_left">IBE</div>
            <div class="login_header_right">...</div>
        </el-header>
        <el-main class="login_main"  style="margin:0px;padding:0px;">
            <div class="background"></div>
                  <div class="login_form ">
                      <div class="login_title">账号登录</div>
                  
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
        </el-main>
            
        </el-container> -->

        
          <div>
          <div id="countdisplay" style="height:500px,width:300px;">
           
          </div>
        </div>

         <div   style="width:300px;height:300px">
          <div id="flowdisplay">
           
          </div>
        </div>
        <el-col :span="18" :offset="3" class="username_align"><el-button type="primary" class="login_button" @click="login">登录</el-button></el-col>
    </div>
</template>

<script>
import echarts from "echarts";
import item1 from "../static/banner/1.jpg";
import item2 from "../static/banner/2.jpg";
import item3 from "../static/banner/3.jpg";

export default {
  data() {
    return {
      pic: [item1, item2, item3],
      Charts: "",
      countdisplayCharts: "",
      pic1: [
        "../../static/banner/1.jpg",
        "../../static/banner/1.jpg",
        "../../static/banner/1.jpg"
      ]
    };
  },
  methods: {
    login() {
      //   this.$router.push({ path: "/main" });
      this.initcharts2();
    },
    initcharts2(xdata, ydata) {
      this.Charts = echarts.init(document.getElementById("countdisplay"));

      var option = {
        title: {
          text: "某地区蒸发量和降水量",
          subtext: "纯属虚构"
        },
        tooltip: {
          trigger: "axis"
        },
        legend: {
          data: ["蒸发量", "降水量"]
        },
        toolbox: {
          show: true,
          feature: {
            mark: { show: true },
            dataView: { show: true, readOnly: false },
            magicType: { show: true, type: ["line", "bar"] },
            restore: { show: true },
            saveAsImage: { show: true }
          }
        },
        calculable: true,
        xAxis: [
          {
            type: "category",
            data: [
              "1月",
              "2月",
              "3月",
              "4月",
              "5月",
              "6月",
              "7月",
              "8月",
              "9月",
              "10月",
              "11月",
              "12月"
            ]
          }
        ],
        yAxis: [
          {
            type: "value"
          }
        ],
        series: [
          {
            name: "蒸发量",
            type: "bar",
            data: [
              2.0,
              4.9,
              7.0,
              23.2,
              25.6,
              76.7,
              135.6,
              162.2,
              32.6,
              20.0,
              6.4,
              3.3
            ],
            markPoint: {
              data: [
                { type: "max", name: "最大值" },
                { type: "min", name: "最小值" }
              ]
            },
            markLine: {
              data: [{ type: "average", name: "平均值" }]
            }
          },
          {
            name: "降水量",
            type: "bar",
            data: [
              2.6,
              5.9,
              9.0,
              26.4,
              28.7,
              70.7,
              175.6,
              182.2,
              48.7,
              18.8,
              6.0,
              2.3
            ],
            markPoint: {
              data: [
                {
                  name: "年最高",
                  value: 182.2,
                  xAxis: 7,
                  yAxis: 183,
                  symbolSize: 18
                },
                { name: "年最低", value: 2.3, xAxis: 11, yAxis: 3 }
              ]
            },
            markLine: {
              data: [{ type: "average", name: "平均值" }]
            }
          }
        ]
      };
      this.Charts.setOption(option);
    }
  }
};
</script>


<style scoped>
.help_center {
  text-align: center;
}
.help_font {
  font-size: 10px;
  text-decoration: None;
}

.help {
  margin-top: 60px;
}

.login_button {
  width: 100%;
}
.remember_font {
  font-size: 12px;
}

.login_detail_remember {
  margin-top: 15px;
}
.username_align {
  line-height: 40px;
}

.hr_line {
  background-color: #9ab4d4;
  height: 1px;
}
.login_form .login_detail_username {
  margin-top: 50px;
}

.login_detail_passwd {
  margin-top: 30px;
}
.login_title {
  line-height: 50px;
  font-size: 17px;
  text-align: center;
}
.login_main {
  /* height: 100%; */
}

.login_form {
  height: 400px;
  width: 300px;
  border: #e6eaee solid 2px;
  border-radius: 5px;
  min-width: 500px;
  min-height: 400px;
  display: block;
  position: relative;
  margin-top: 200px;
  margin: 250px auto;
  background: white;
  opacity: 0.9;
}
.PPT {
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

.login_header_right {
  overflow: hidden;
  margin-top: 16px;
  padding-right: 17px;
  line-height: 50px;
  text-align: right;
  color: #b6b6b6;
  display: inline-block;
  float: right;
}
.login_header_left {
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
.login_header_out {
  width: 100%;
  background-color: #eff4fa;
  border-bottom: 1px solid #d6dfea;
  box-shadow: 5px 2px 1px rgb(233, 226, 226);
  position: relative;
  z-index: 2;
}
.clearfix:after {
  content: "";
  display: block;
  height: 0;
  clear: both;
  visibility: hidden;
}
.footer {
  width: 100%;
  background-color: #eff4fa;
  border-top: 1px solid #d6dfea;
  box-shadow: 5px 2px 1px rgb(233, 226, 226);
}

.footer_content {
  text-align: center;
  align-content: center;
  height: 40px;
  line-height: 40px;
  color: #1d5494;
  font-size: 15px;
}
.banner_item {
  background-size: cover;
  height: 100%;
  border-radius: 5px;
}

.background {
  width: 100%;
  height: 1000px;
  background: url("../static/banner/4.jpg") no-repeat;
  position: absolute;
  background-size: cover;
}
.header {
  position: fixed;
}
.ff {
  border: rgb(43, 146, 248) 1px solid;
}
</style>