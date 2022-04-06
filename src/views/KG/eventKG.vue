<template>
  <div>
          <el-breadcrumb separator="/" style="margin:20px">
            <el-breadcrumb-item><i class="el-icon-menu"></i>关系图谱</el-breadcrumb-item>
            <el-breadcrumb-item>风险评估</el-breadcrumb-item>
          </el-breadcrumb>
    <el-card style="margin-right: 0.5%;margin-left: 0.5%;margin-top: 5px">
      <el-row style="margin-bottom: 0.3%">
        <el-col span="7">
          <el-row>
            <span >
            目标事件
          </span>
            <el-input placeholder="191102LN" style="width: 60%;">
            </el-input>
          </el-row>

        </el-col>
        <el-col span="7">
          <el-row>
            <span >
            风险评估
          </span>
            <el-input placeholder="外力破裂" style="width: 60%;" disabled="true">
            </el-input>
          </el-row>
        </el-col>
        <el-col span="7">
          <el-row>
            <span >
            危害估计
          </span>
            <el-input placeholder="少量泄漏，地面污染" style="width: 60%;" disabled="true">
            </el-input>
          </el-row>
        </el-col>
        <el-col span="3">
            <el-button type="primary" @click="deep" size="small">确定</el-button>
            <img src="../../static/setting_icon.png" style="width: 25px;margin-left: 10px">

        </el-col>
      </el-row>



    </el-card>
    <el-row>
      <el-col span="24">
        <el-card style="margin-left: 0.5%;margin-top: 3px;margin-right: 0.5%;background-color:lightblue">
          <div id="kg">
          </div>
        </el-card>
      </el-col>
    </el-row>


  </div>
</template>

<script>
  // import evdata from "../../static/event_data";
  import evdata from "../../static/event_data_01";
  import echarts from "echarts";
  import  'echarts/theme/shine.js'
  export default {
    data(){
      // const nodes = [];
      // const links = [];
      return{
        kgchart:"",
        //drawer:false,
        value1:0,
        // nodes,
        // links,
        kg_categories:[
          {
            name:"评估"
          },
          {
            name:"事件"
          },
          {
            name:"因素"
          },{
            name:"管段"
          },

        ],

      };
    },
    methods:{
      initchart_kg(){
        this.kgchart = echarts.init(
          document.getElementById("kg"),"shine"
        );
        //var categories =[];
        var option = {
          backgroundColor:'#fff',
          title: {
            text: '风险事件知识图谱',
            left:'center',
          },
          tooltip: {
            formatter: function (x) {
              return x.data.des;
            }
          },
          toolbox:{
            show: true,
            feature: {
              mark: {
                show: true
              },
              // 还原
              restore: {
                show: true
              },
              // 保存为图片
              saveAsImage: {
                show: true
              },
            }
          },
          legend: [{
            // selectedMode: 'single',
            orient: 'vertical',
            x:'left',      //可设定图例在左、右、居中
            y:'top',     //可设定图例在上、下、居中
            padding:[60,50,250,10],   //可设定图例[距上方距离，距右方距离，距下方距离，距左方距离]
            data: this.kg_categories,
            itemGap:15,
          }],
          // animationDurationUpdate: 1500,
          // animationEasingUpdate: 'quinticInOut',
          series: [
            {
              type: 'graph',
              layout: 'force',
              symbolSize: 40,
              roam: true,
              label: {
                show: true
              },
              edgeSymbol: ['circle', 'arrow'],
              edgeSymbolSize: [3, 7],
              force: {
                repulsion: 3500,
                edgeLength: [50, 100]
              },
              draggable: true,
              edgeLabel: {
                normal: {
                  show: true,
                  fontSize: 10,
                  formatter: function (x) {
                    return x.data.name;
                  }
                }
              },
              data: evdata[0],
              links: evdata[1],
              categories:this.kg_categories,
            }
          ]
        };
        this.kgchart.setOption(option,true);
      },

    },

    mounted() {
      // this.nodes = evdata.nodes;
      // this.links = evdata.links;
      this.initchart_kg();
    }
  }
</script>


<style scoped>

  #kg{
    height: 700px;
    /*background-color: rgba(242,234,191,0.15);*/
  }
</style>
