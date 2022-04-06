<template>
<div  v-loading="loading_cpu">
    <div id="cpu" >
      cpu表的数据
    </div>
</div>
</template>

<script>
import echarts from "echarts";
import moment from "moment";
import axios from "axios";
export default {
  props: {
    hostid: String
  },
  data() {
    return {
      loading_cpu:true,
      cpuChart: "",
      option: {}
    };
  },
  methods: {
    getCpuData() {
      axios
        .post("/monitor/hostinfo/", {
          hostid: this.hostid,
          type: "cpu",
          time: [0, 0, 100]
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
          this.cpuChart = echarts.init(document.getElementById("cpu"));
          
          this.option = {
            title: {
              // text: 'cpu利用率'
            },
            tooltip: {
              trigger: "axis"
            },
            legend: {
              data: ["cpu利用率"]
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
                name: "cpu利用率",
                type: "line",
                smooth: true,
                data: ydata,
                sampling: "average",
                itemStyle: {
                  normal: {
                    color: "rgb(255,70,131)"
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
                        color: "rgb(255,70,131)"
                      }
                    ])
                  }
                }
              }
            ]
          };

          // 使用刚指定的配置项和数据显示图表。
          this.loading_cpu=false;
          this.cpuChart.setOption(this.option);
        });
    },
    updateData(day,hour,minute) {
      this.loading_cpu=true;
      axios
        .post("/monitor/hostinfo/", {
          hostid: this.hostid,
          type: "cpu",
          time: [day,hour,minute]
        })
        .then(res => {
          const items = res.data.res;

          console.log(res);
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
                data: ydata
              }
            ]
          };
          // 使用刚指定的配置项和数据显示图表。

          this.cpuChart.setOption(this.option);
          this.loading_cpu=false;
        });
    }
  },
  created() {
    this.getCpuData();
  },
  computed: {

  }
};
</script>
<style scoped="scoped">
#cpu {
  height: 500px;
}
</style>
