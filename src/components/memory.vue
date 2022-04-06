<template>
<div v-loading="mem_loading">
    <div id="memory">
     
    </div>
</div>
</template>

<script>
import echarts from "echarts";
import moment from "moment";
import axios from "axios";
export default {
  props: {
    hostid: String,
   
  },
  data() {
    return {
      memoryChart: "",
      option:{},
      mem_loading:""
    }
  },
  methods: {
    getmemoryData() {
      axios.post("/monitor/hostinfo/", {
          hostid: this.hostid,
          type: "memory",
          time: [2, 0, 100]
        })
        .then(res => {
          const items = res.data.res;
          // console.log(res)
          let ydata = [];
          let xdata = [];
          items.forEach(function(item) {
            xdata.push(item["clock"]);
            ydata.push(item["value"]);
          });
          xdata = xdata.map(function(time) {
            return (
              moment(time * 1000).format("HH:mm:ss") +
              "\n\n" +
              moment(time * 1000).format("YYYY/MM/DD")
            );
          });
          this.memoryChart = echarts.init(document.getElementById("memory"));

          this.option = {
            title: {
              // text: 'memory利用率'
            },
            tooltip: {
              trigger: "axis"
            },
            legend: {
              data: ["memory利用率"]
            },
            grid: {
              left: "3%",
              right: "4%",
              bottom: "3%",
              containLabel: true
            },
            xAxis: {
              data: xdata
            },
            yAxis: {},
            series: [
              {
                name: "memory利用率",
                type: "line",
                smooth: true,
                data: ydata,
                sampling: "average",
                itemStyle: {
                  normal: {
                    color: "rgb(125,68,168)"
                  }
                },
                areaStyle: {
                  normal: {
                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                      {
                        offset: 0,
                        color: "rgb(200,200,200)"
                      },
                      {
                        offset: 1,
                        color: "rgb(125,68,168)"
                      }
                    ])
                  }
                }
              }
            ]
          };

          // 使用刚指定的配置项和数据显示图表。
          this.mem_loading=false;
          this.memoryChart.setOption(this.option);
        });
    },
    updateData(day,hour,minute){
        // console.log("?????")
        this.mem_loading=true;
        axios.post("/monitor/hostinfo/", {
          hostid: this.hostid,
          type: "memory",
          time: [day,hour,minute]
        })
        .then(res => {
          const items = res.data.res;
          
           console.log(res)
          let ydata = [];
          let xdata = [];
          items.forEach(function(item) {
            xdata.push(item["clock"]);
            ydata.push(item["value"]);
          });
          xdata = xdata.map(function(time) {
            return (
              moment(time * 1000).format("HH:mm:ss") +
              "\n\n" +
              moment(time * 1000).format("YYYY/MM/DD")
            );
          });
          this.option = {
            xAxis: {
              data: xdata
            },
            series: [
              {
                data: ydata,      
              }
            ]
          };
          // 使用刚指定的配置项和数据显示图表。
          
          this.memoryChart.setOption(this.option);
          this.mem_loading=false;
        });
    }
  },

  created() {
      this.getmemoryData();
  }
};
</script>
<style scoped="scoped">
#memory {
  height: 500px;
  }
</style>
