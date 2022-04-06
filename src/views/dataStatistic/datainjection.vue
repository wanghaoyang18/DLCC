<template>
  <div>
  <el-breadcrumb separator="/" style="margin:20px">
    <el-breadcrumb-item><i class="el-icon-menu"></i>数据统计分析</el-breadcrumb-item>
    <el-breadcrumb-item>注入日志分析</el-breadcrumb-item>
  </el-breadcrumb>

    <el-card style="margin-left: 0.5%;margin-right: 0.5%">
      <el-row :gutter="50">
        <el-col :span="7">
          <span class="filter_span">开始日期</span>
          <el-date-picker
            v-model="startDate"
            type="date"
            placeholder="选择日期"
            style="width:70%">
          </el-date-picker>
        </el-col>
        <el-col :span="7">
          <span class="filter_span">结束日期</span>
          <el-date-picker
            v-model="endDate"
            type="date"
            placeholder="选择日期"
            style="width:70%">
          </el-date-picker>
        </el-col>
        <el-col :span="6">
          <span class="filter_span">时间跨度</span>
          <el-input v-model="days"  style="width:70%"></el-input>
        </el-col>
        <el-col :span="4">
          <el-button type="primary" style="margin-left: 20%">确定</el-button>
        </el-col>
      </el-row>
    </el-card>

    <el-card style="margin-left: 0.5%;margin-right: 0.5%;margin-top: 5px;margin-bottom: 3px" shadow="always">
      <el-tabs v-model="activeName"  @tab-click="handleClick" style="margin-bottom: -33px">
        <el-tab-pane label="图像数据" name="first" tabindex="1">

        </el-tab-pane>
        <el-tab-pane label="雷达点云" name="second" tabindex="2">
        </el-tab-pane>
        <el-tab-pane label="视频数据" name="third"></el-tab-pane>
        <el-tab-pane label="事件数据" name="fourth"></el-tab-pane>
      </el-tabs>
    </el-card>
    <el-card style="margin-left: 0.5%;margin-right: 0.5%">
      <div id="no1"></div>
    </el-card>
    <el-card><div id="test2"></div></el-card>
  </div>
</template>
<script>
  import moment from "moment";
  import echarts from "echarts";
  import  'echarts/theme/macarons.js'
  export default {
    data() {
      return {
        activeName: 'first',
        messaget: 0,
        startDate:"2020-11-7",
        endDate:"2020-11-13",
        chart1:"",
        days:1,
        xdata2:["2020-11-7","2020-11-8","2020-11-9","2020-11-10","2020-11-11","2020-11-12","2020-11-13"],
        ydata2:[16,23,20,11,32,9,18],
        ydata3:[3,2,2,4,6,0,3],
        ydata4:[4,5,1,6,2,1,0],
        testchart1:"",
        aaachart:"",
      };
    },
    methods: {
      handleClick(tab,event) {
        if (tab.name==="first"){
          this.messaget=1111;
          this.$message({
            type: "success",
            message: this.messaget,
          });
        } else if(tab.name==="second"){
          this.messaget=2222;
          this.ydata2=[1,6,11,8,5,3,7];
          this.initcharts1(this.xdata2,this.ydata2);
          this.$message({
            type: "success",
            message: this.messaget,
          });
        }

      },
      initcharts1(xdata, ydata) {
        this.chart1 = echarts.init(document.getElementById("no1"),"macarons");
        var option = {
          title: {
            text: "数据录入历史",
            subtext: ""
          },
          tooltip: {
            trigger: "axis"
          },
          legend: {
            data: ["流量"]
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
              data: xdata
            }
          ],
          yAxis: [
            {
              type: "value"
            }
          ],
          series: [
            {
              name: "总录入数据",
              type: "bar",
              data: ydata,
              markPoint: {
                data: [
                  { type: "max", name: "最大值" },
                  { type: "min", name: "最小值" }
                ]
              },
              markLine: {
                data: [{ type: "average", name: "平均值" }]
              },
              // itemStyle: {
              //   normal: {
              //     color: "rgb(70,70,170)"
              //   }
              // }
            },
            {
              name: "待处理数据",
              type: "bar",
              data: this.ydata3,
              markPoint: {
                data: [
                  { type: "max", name: "最大值" },
                  { type: "min", name: "最小值" }
                ]
              },
              markLine: {
                data: [{ type: "average", name: "平均值" }]
              },
              // itemStyle: {
              //   normal: {
              //     color: "rgb(70,70,170)"
              //   }
              // }
            },
            {
              name: "无效数据",
              type: "bar",
              data: this.ydata4,
              markPoint: {
                data: [
                  { type: "max", name: "最大值" },
                  { type: "min", name: "最小值" }
                ]
              },
              markLine: {
                data: [{ type: "average", name: "平均值" }]
              },
              // itemStyle: {
              //   normal: {
              //     color: "rgb(70,70,170)"
              //   }
              // }
            },
          ]
        };
        this.chart1.setOption(option);
        //this.loading_disk = false;
      },
    },

    mounted() {
      this.$message({
        type: "success",
        message: "修改成功!"
      });
      this.initcharts1(this.xdata2,this.ydata2);
      //this.initcharts_totalvolume(this.ydata)
    }
  };
</script>
<style scoped>
  #no1 {
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
