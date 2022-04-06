<template>
  <div v-loading.fullscreen.lock="fullscreenLoading">
    <el-breadcrumb separator="/" style="margin:20px">
    <el-breadcrumb-item><i class="el-icon-menu"></i>数据统计分析</el-breadcrumb-item>
    <el-breadcrumb-item>数据状态</el-breadcrumb-item>
  </el-breadcrumb>
    <row style="margin-bottom: 15px">
      <el-col span="6">
        <el-card style="margin-right: 1%;margin-left: 2%">
          <row>
            <el-col span="12"><img src="../../static/idbsysicon/data_ok.png" style="width: 50px;vertical-align: middle"></el-col>
            <el-col span="12" style="text-align: center">
              <el-row><span style="font-size: large;font-weight: bold;color: #22c3aa">有效录入量</span>
              </el-row>
              <el-row>
                <span style="font-size: large;font-weight: initial;color: #d87a80;margin-left: 40%">1095 </span>
                <span style="font-size: large;font-weight: bold;color: #d87a80"></span>
              </el-row>
            </el-col>
          </row>

        </el-card>
      </el-col>
      <el-col span="6">
        <el-card style="margin-right: 1%;margin-left: 1%">
          <row>
            <el-col span="12"><img src="../../static/idbsysicon/data_add.png" style="width: 50px;vertical-align: middle"></el-col>
            <el-col span="12" style="text-align: center">
              <el-row><span style="font-size: large;font-weight: bold;color: #e6b600">待办数据量</span>
              </el-row>
              <el-row>
                <span style="font-size: large;font-weight: initial;color: #d87a80;margin-left: 40%">48 </span>
                <span style="font-size: large;font-weight: bold;color: #d87a80"></span>
              </el-row>
            </el-col>
          </row>
        </el-card>
      </el-col>
      <el-col span="6">
        <el-card style="margin-right: 1%;margin-left: 1%">
          <row>
            <el-col span="12"><img src="../../static/idbsysicon/data_warn.png" style="width: 40px;vertical-align: middle"></el-col>
            <el-col span="12" style="text-align: center">
              <el-row><span style="font-size: large;font-weight: bold;color: #c12e34">无效数据量</span>
              </el-row>
              <el-row>
                <span style="font-size: large;font-weight: initial;color: #d87a80;margin-left: 40%">46 </span>
                <span style="font-size: large;font-weight: bold;color: #d87a80"></span>
              </el-row>
            </el-col>
          </row>
        </el-card>
      </el-col>
      <el-col span="6">
        <el-card style="margin-right: 2%;margin-left: 1%">
          <row>
            <el-col span="12"><img src="../../static/idbsysicon/data_total.png" style="width: 40px;vertical-align: middle"></el-col>
            <el-col span="12" style="text-align: center">
              <el-row><span style="font-size: large;font-weight: bold;color: #0098d9">文件存储量</span>
              </el-row>
              <el-row>
                <span style="font-size: large;font-weight: initial;color: #d87a80;margin-left: 30%">4922 </span>
                <span style="font-size: large;font-weight: bold;color: #d87a80">Mb</span>
              </el-row>
            </el-col>
          </row>
        </el-card>
      </el-col>
    </row>
    <row>

      <el-col span="12">
        <el-card style="margin-left: 1%;margin-right: 0.5%">
          <div id="dv1">
          </div>
        </el-card>
      </el-col>
      <el-col span="12">
        <el-card style="margin-left: 0.5%;margin-right: 1%">

          <div id="aaa">
          </div>
        </el-card>
      </el-col>
    </row>
<!--    <el-card><div id="wtf"></div></el-card>-->

  </div>

</template>
<script>
  import echarts from "echarts";
  import  'echarts/theme/macarons.js'
  export default {
    data() {
      return {
        fullscreenLoading:false,
        testchart:"",
        aaachart:"",
        dv1chart:"",
        xdata:['视频','图像','点云','丢弃','暂留'],
        ydata:[{value:26, name:'视频'},
          {value:810, name:'图像'},
          {value:109, name:'点云'},
          {value:46, name:'丢弃'},
          {value:48, name:'暂留'}],
        xdata1:['视频','图像','点云','丢弃','暂留'],
        ydata1:[{value:1271, name:'视频'},
          {value:1193, name:'图像'},
          {value:2306, name:'点云'},
          {value:89, name:'丢弃'},
          {value:63, name:'暂留'}],
      };
    },
    methods: {

      openfullscreen(){
        this.fullscreenLoading = true;
        setTimeout(() => {
          this.fullscreenLoading = false;
        }, 500);
      }
      ,
      initcharts_totalvolume(ydata) {
        //console.log(xdata, ydata);
        this.dv1chart = echarts.init(
          document.getElementById("dv1"),"macarons"
        );
        var option = {
          title: {
            text: "数据录入比例",
            subtext: "",
            x: "center"
          },
          tooltip: {
            trigger: "item",
            formatter: "{a} <br/>{b} : {c} ({d}%)"
          },

          legend: {
            orient: "vertical",
            x: "left",
            data: this.xdata
          },
          grid:{
            y2:100,
          },
          toolbox: {
            show: true,
            feature: {
              mark: { show: true },
              dataView: { show: true, readOnly: true },
              magicType: {
                show: true,
                type: ["pie", "funnel"],
                option: {
                  funnel: {
                    x: "25%",
                    width: "50%",
                    funnelAlign: "center",
                    max: 1548
                  }
                }
              },
              restore: { show: true },
              saveAsImage: { show: true }
            }
          },
          calculable: true,
          series: [
            {
              name: "录入类型",
              type: "pie",
              radius: "65%",
              center: ["50%", "55%"],
              data: ydata
            }
          ]
        };
        this.dv1chart.setOption(option);
      },
      initcharts_totalnums(ydata) {
        //console.log(xdata, ydata);
        this.aaachart = echarts.init(
          document.getElementById("aaa"),"macarons"
        );
        var option = {
          title: {
            text: "存储资源比例",
            subtext: "",
            x: "center"
          },
          tooltip: {
            trigger: "item",
            formatter: "{a} <br/>{b} : {c} ({d}%)"
          },

          legend: {
            orient: "vertical",
            x: "left",
            data: this.xdata1
          },
          grid:{
            y2:100,
          },
          toolbox: {
            show: true,
            feature: {
              mark: { show: true },
              dataView: { show: true, readOnly: true },
              magicType: {
                show: true,
                type: ["pie", "funnel"],
                option: {
                  funnel: {
                    x: "25%",
                    width: "50%",
                    funnelAlign: "center",
                    max: 1548
                  }
                }
              },
              restore: { show: true },
              saveAsImage: { show: true }
            }
          },
          calculable: true,
          series: [
            {
              name: "录入类型",
              type: "pie",
              radius: "65%",
              center: ["50%", "55%"],
              data: ydata
            }
          ]
        };
        this.aaachart.setOption(option);
      },
    },
    mounted() {
      this.$message({
        type: "success",
        message: "修改成功!"
      });
        this.openfullscreen();
        setTimeout(() => {
          this.initcharts_totalnums(this.ydata1);
          this.initcharts_totalvolume(this.ydata);

      }, 300);

    }
  };
</script>
<style scoped>
  #dv1 {
    height: 400px;
    width: 100%;
    margin-top: 20px;
    margin-right: 50px;
    margin-bottom: 0px;
  }
  #aaa {
    height: 400px;
    width: 100%;
    margin-top: 20px;
    margin-right: 50px;
    margin-bottom: 0px;
  }
</style>
