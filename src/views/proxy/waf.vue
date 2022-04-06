<template>
    <div>
        <!-- 面包屑 -->
         <el-breadcrumb class="bread" separator="/">
                    <el-breadcrumb-item><i class="el-icon-menu"></i>代理服务</el-breadcrumb-item>
                    <el-breadcrumb-item>网络防火墙</el-breadcrumb-item>
        </el-breadcrumb>
     <div >
     <el-card class="cardstyle"> 
       <el-row>
         <el-col :span="8" >
            <el-card class="box-card" >
           <div @click="touaattack">
            <div class="pic uaurl"></div>
            <div class="cardspan">ua 异常攻击</div>
            <div class="number">{{data.ua}}</div>
            </div>
          </el-card>
         </el-col>

         <el-col :span="8" >
            <el-card class="box-card" >
            <div @click="tofileattack">
            <div class="pic fileurl"></div>
            <div class="cardspan">文件包含攻击</div>
            <div class="number">{{data.file}}</div>
            </div>
            </el-card>
         </el-col>
         <el-col :span="8" >
          <el-card class="box-card" >
          <div @click="toccattack">
            <div class="pic ccurl"></div>
            <div class="cardspan">cc网络攻击</div>
            <div class="number">{{data.cc}}</div>
            </div>
         </el-card>
         </el-col>
       </el-row>
       
       <el-row>
       <el-col :span="8" >
         <el-card class="box-card" >
           <div @click="topostattack">
            <div class="pic posturl"></div>
            <div class="cardspan">post异常攻击</div>
            <div class="number">{{data.post}}</div>
            </div>
        </el-card>
         </el-col>
       <el-col :span="8" >
        <el-card class="box-card" >
          <div @click="toargsattack">
            <div class="pic argsurl" ></div>
            <div class="cardspan">args异常攻击</div>
            <div class="number">{{data.cc}}</div>
          </div>
        </el-card>
         </el-col>
       <el-col :span="8" >
        <el-card class="box-card" >
          <div @click="tocookieattack">
            <div class="pic cookieurl"></div>
            <div class="cardspan">cookie异常</div>
            <div class="number">{{data.cookie}}</div>
            </div>
        </el-card>
         </el-col>
         </el-row>
        </el-card>


    </div>
    
    <el-row class="cardstyle"> 
      <el-col :span="12"> 
        <div class="wafpic_p">  
          <el-card >  
             <div>
               <div id="waf" style="height:450px;">

               </div>
             </div>
          </el-card>
        </div>
      </el-col>



      <el-col :span="12"> <div class="wafpic_c">
           <el-card >
             <div style="height:50px">
            攻击类型：
            <el-select v-model="value" placeholder="请选择" >
                 <el-option
                  v-for="item in options"
                 :key="item.value"
                 :label="item.label"
                 :value="item.value"
                 @click.native="showtable(value)"
                 >
                 </el-option>
             </el-select>
             </div>
              <div id="waf1" style="height:400px;"></div>
             </el-card>
        </div></el-col>
      </el-row>
    </div>
</template>

<script>
import wafpic from "@/components/wafpic";
import wafpicprogess from "@/components/wafpicprogess";
import echarts from "echarts";
export default {
  data() {
    return {
      data: {
        ua: 100,
        cc: 552,
        file: 333,
        post: 1235,
        cookie: 50
      },
      myChart: "",
      myChart1: "",
      options: [
        {
          value: "1",
          label: "cc攻击"
        },
        {
          value: "2",
          label: "post异常攻击"
        },
        {
          value: "3",
          label: "args异常攻击"
        },
        {
          value: "4",
          label: "ua攻击"
        },
        {
          value: "5",
          label: "cookie异常"
        },
        {
          value: "6",
          label: "file包含攻击"
        }
      ],
      value: ""
    };
  },
  components: {
    wafpic,
    wafpicprogess
  },
  methods: {
    showtable(val) {
      console.log(val);
    },
    toccattack() {
      this.$router.push({ path: "/main/ccattack" });
    },
    tofileattack() {
      this.$router.push({ path: "/main/fileattack" });
    },
    topostattack() {
      this.$router.push({ path: "/main/postattack" });
    },
    touaattack() {
      this.$router.push({ path: "/main/uaattack" });
    },
    toargsattack() {
      this.$router.push({ path: "/main/argsattack" });
    },
    tocookieattack() {
      this.$router.push({ path: "/main/cookieattack" });
    },
    init1() {
      this.myChart = echarts.init(document.getElementById("waf"));

      // 指定图表的配置项和数据
      var option = {
        title: {
          text: "网络攻击情况"
        },
        series: [
          {
            startAngle: "0",
            radius: "60%",
            center: ["50%", "50%"],
            type: "pie",
            label: {
              normal: {
                formatter: "{b} ({d}%)",
                textStyle: {
                  fontWeight: "normal",
                  fontSize: 15
                }
              }
            },
            data: [
              { name: "cc网络攻击", value: this.data.cc },
              { name: "cookie异常", value: this.data.cookie },
              { name: "文件包含攻击", value: this.data.file },
              { name: "post异常攻击", value: this.data.post },
              { name: "args异常攻击", value: this.data.args },
              { name: "ua注入攻击", value: this.data.ua }
            ]
          }
        ]
      };

      // 使用刚指定的配置项和数据显示图表。
      this.myChart.setOption(option);
    },
    init2() {
      this.myChart1 = echarts.init(document.getElementById("waf1"));
      var option = {
        title: {
          text: "网络攻击统计"
        },
        grid: {
          left: "3%", //图表距边框的距离
          right: "4%",
          bottom: "3%",
          containLabel: true
        },
        tooltip: {},
        legend: {
          data: ["用户来源"]
        },
        xAxis: {
          data: ["Android", "IOS", "PC", "Ohter"]
        },
        yAxis: {},
        series: [
          {
            name: "访问量",
            type: "line",
            data: [500, 200, 360, 100]
          }
        ]
      };

      // 使用刚指定的配置项和数据显示图表。
      this.myChart1.setOption(option);
    }
  },
  mounted() {
    this.init1(),
      this.init2(),
      (window.onresize = () => {
        // 这里使用箭头函数，避免this指向问题
        this.myChart.resize();
        this.myChart1.resize();
      });
  },
  computed: {}
};
</script>

<style scoped>
.bread {
  margin-bottom: 20px;
}

.box-card {
  height: 130px;
  margin-top: 10px;
  margin-left: 30px;
  margin-bottom: 30px;
}
.box-card:hover {
  background-color: rgb(202, 200, 200);
  opacity: 0.8;
  cursor: pointer;
}
.cardimg {
  width: 90px;
  height: 90px;
  margin-left: 30px;
  float: left;
}
.cardspan {
  font-size: 20px;
  color: rgb(130, 130, 131);
  font-weight: 800;
  margin-top: 30px;
  display: inline-block;
  margin-left: 30px;


}
.number {
  font-size: 20px;
  font-weight: 800;
  display: inline-block;
  margin-left: 60px;
  margin-top: 10px;
  
}

.wafpic_c {
  margin-top: 50px;
  margin-left: 50px;
}
.wafpic_p {
  margin-top: 50px;
}

.clearfix:after {
  content: "";
  display: block;
  height: 0;
  clear: both;
  visibility: hidden;
}
.pic:hover {
}
.pic {
  width: 90px;
  height: 90px;
  float: left;
}
.uaurl {
  background: url("../../static/waficon/mysql.png") no-repeat top;
  background-size: cover;
  cursor: pointer;
}

.fileurl {
  background: url("../../static/waficon/file.png") no-repeat top;
  background-size: cover;
  cursor: pointer;
}
.ccurl {
  background: url("../../static/waficon/network.png") no-repeat top;
  background-size: cover;
  cursor: pointer;
}
.posturl {
  background: url("../../static/waficon/post.png") no-repeat top;
  background-size: cover;
  cursor: pointer;
}
.cookieurl {
  background: url("../../static/waficon/cookie.png") no-repeat top;
  background-size: cover;
  cursor: pointer;
}
.argsurl {
  background: url("../../static/waficon/args.png") no-repeat top;
  background-size: cover;
  cursor: pointer;
}
.back {
  background: rgb(221, 221, 221);
}
.cardstyle{
  margin-left: 30px;
  margin-right: 30px;
  margin-bottom: 10px;
}
</style>