<template>
<div  v-loading="loading_disk">
    <div id="disk">
      disk表的数据
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
      diskChart: "",
      option:{},
      loading_disk:true
    }
  },
  methods: {
    getDiskData() {
      axios.post("/monitor/hostinfo/", {
          hostid: this.hostid,
          type: "disk",
          time: [2, 0, 100]
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
          this.diskChart = echarts.init(document.getElementById("disk"));

          this.option = {
            title: {
              // text: 'cpu利用率'
            },
            tooltip: {
              trigger: "axis"
            },
            legend: {
              data: ["disk利用率"]
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
                name: "disk利用率",
                type: "line",
                smooth: true,
                data: ydata,
                sampling: "average",
                itemStyle: {
                  normal: {
                    color: "rgb(125,70,70)"
                  }
                },
                areaStyle: {
                  normal: {
                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                      {
                        offset: 0,
                        color: "rgb(255,158,68)"
                      },
                      {
                        offset: 1,
                        color: "rgb(125,70,70)"
                      }
                    ])
                  }
                }
              }
            ]
          };

          // 使用刚指定的配置项和数据显示图表。
          this.loading_disk=false;
          this.diskChart.setOption(this.option);
        });
    },
    updateData(day,hour,minute){
      this.loading_disk=true
        axios.post("/monitor/hostinfo/", {
          hostid: this.hostid,
          type: "disk",
          time: [day,hour,minute]
        })
        .then(res => {
          const items = res.data.res;
          
          console.log(items)
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
          
          this.diskChart.setOption(this.option);
           this.loading_disk=false
        });
    }
  },

  created() {
      this.getDiskData();
  }
};
</script>
<style scoped="scoped">
#disk {
  height: 500px;
  }
</style>
