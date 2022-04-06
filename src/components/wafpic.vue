<template>
    <div>
        <div id="waf" style="height:450px;"></div>
    </div>
</template>

<script>
import echarts from "echarts";
export default {
  data() {
    return {
      myChart:""
    };
  },
  props: ["wafdata"],

  methods: {
    init() {
      console.log(this.wafdata);
       this.myChart = echarts.init(document.getElementById("waf"));

      // 指定图表的配置项和数据
      var option = {
        title:{
            text:'网络攻击情况',
        },
        series: [
          {
            startAngle:'0',
            radius : '60%',
            center: ['50%', '50%'],
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
              { name: "cc网络攻击", value: this.wafdata.cc },
              { name: "cookie异常", value: this.wafdata.cookie },
              { name: "文件包含攻击", value: this.wafdata.file },
              { name: "post异常攻击", value: this.wafdata.post },
              { name: "args异常攻击", value: this.wafdata.args },
              { name: "sql注入攻击", value: this.wafdata.sql }
            ]
          }
        ]
      };

      // 使用刚指定的配置项和数据显示图表。
      this.myChart.setOption(option);
    }
  },
  mounted() {
    this.init()
    window.onresize = () => {
            // 这里使用箭头函数，避免this指向问题
            this.myChart.resize();
           
        }
    }
};
</script>

<style scoped>
</style>