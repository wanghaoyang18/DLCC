<template>
    <div>
        <div id="waf1" style="height:400px;"></div>
    </div>
</template>

<script>
import echarts from "echarts";
export default {
  data() {
    return {
        myChart1:""
    };
  },
  methods: {
    init() {
         this.myChart1 = echarts.init(document.getElementById("waf1"));
        var option = {
            title:{
                text:'网络攻击统计'
            },
            grid: {
            left: '3%',   //图表距边框的距离
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
            tooltip:{},
            legend:{
                data:['用户来源']
            },
            xAxis:{
                data:["Android","IOS","PC","Ohter"]
            },
            yAxis:{

            },
            series:[{
                name:'访问量',
                type:'line',
                data:[500,200,360,100]
            }]
        };

      // 使用刚指定的配置项和数据显示图表。
      this.myChart1.setOption(option);
    }
  },
  mounted() {
    this.init();
    window.onresize = () => {
            // 这里使用箭头函数，避免this指向问题
            this.myChart1.resize();
           
        }
  }
};
</script>

<style scoped>
</style>