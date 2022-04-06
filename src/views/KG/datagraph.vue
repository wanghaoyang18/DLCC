<template>
    <div>
<!--      <el-breadcrumb separator="/" style="margin:20px">-->
<!--        <el-breadcrumb-item><i class="el-icon-menu"></i>数据总览</el-breadcrumb-item>-->
<!--        <el-breadcrumb-item>数据录入</el-breadcrumb-item>-->
<!--      </el-breadcrumb>-->
      <el-card style="margin-right: 0.5%;margin-left: 0.5%;margin-top: 5px">
        <el-row style="margin-bottom: 0.3%">
          <el-col span="18">
            <el-input placeholder="输入目标查询" style="width: 60%;margin-left: 35%">
              <el-button slot="append" icon="el-icon-search"></el-button>
            </el-input>
          </el-col>
          <el-col span="6">
            <el-button type="primary" @click="deep">deep</el-button>
          </el-col>
        </el-row>



      </el-card>
      <el-row>
        <el-col span="24">
          <el-card style="margin-left: 0.5%;margin-top: 3px;margin-right: 0.5%">
            <div id="kg">
            </div>
          </el-card>
        </el-col>
      </el-row>

<!--      <el-drawer-->
<!--        title="我是标题"-->
<!--        direction="rtl"-->
<!--        :visible.sync="drawer"-->
<!--        :with-header="false">-->
<!--        <span>我来啦!</span>-->
<!--      </el-drawer>-->

      <el-dialog
        style="margin-left: 80%;margin-top: 5%"
        title="深度"
        :visible.sync="dialogVisible"
        :modal="false"
        width="30%"
        >
        <span slot="footer" class="dialog-footer">
        </span>
        <el-slider

          v-model="value1"
          vertical
          height="300px"
          :max="10"
          :min="1"
          :step="1">
        </el-slider>
        <el-button
          type="primary" size="mini" style="margin-left: -7px;margin-top: 20px;margin-bottom: -30px"
          @click="chooseDeep"
        >确定</el-button>
      </el-dialog>
    </div>
</template>

<script>
  import echarts from "echarts";
  import  'echarts/theme/macarons.js'
    export default {
      data(){
          return{
            kgchart:"",
            //drawer:false,
            dialogVisible:false,
            value1:0,
            kg_categories:[
              {
                name:"视频"
              },
              {
                name:"图像"
              },
              {
                name:"点云"
              },
              {
                name:"事件"
              },
              {
                name:"负责人"
              },
              {
                name:"管段"
              },
              {
                name:"实验员"
              },


            ],
            nodes:[{
              name: 'c-00096',
              category: 1,
            }, {
              name: 'c-00160',
              category: 1,
            },{
              name: 'c-00167',
              category: 1,
            },{
              name: 'c-00149',
              category: 1,
            },{
              name: 'og_191102q1',
              category: 1,
            },{
              name: 'og_191102qv',
              category: 1,
            },{
              name: 'c-00317',
              category: 1,
            },
              {
              name: 'og_191102hu',
              category: 1,
            },{
              name: 'og_191102bf',
              category: 1,
            },
              {
              name: '图像2a',
              category: 1,
            },{
              name: 'og_190813au',
              category: 1,
            },{
              name: '图像2c',
              category: 1,
            },{
              name: 'og_200105iv',
              category: 1,
            },{
              name: 'og_200105ap',
              category: 1,
            },{
                name: 'c-00217',
                category: 1,
              },{
                name: 'c-00205',
                category: 1,
              },{
                name: 'c-00201',
                category: 1,
              },
              {
              name: '191102Gp_4',
              category: 0,
            },{
                name: '191102Gp_3',
                category: 0,
              },{
                name: '视频12',
                category: 0,
              },{
                name: '视频13',
                category: 0,
              },
              {
              name: '21sGa0613',
              category:5,
            }, {
                name: '管段2',
                category:5,
              },
              {
              name: 'rd0103_o',
              category: 2,
            },{
                name: 'rd0119_o',
                category: 2,
              },{
                name: 'rd0119_af',
                category: 2,
              },
              {
                name: '点云3a',
                category: 2,
              },{
                name: '点云4a',
                category: 2,
              },
              {
              name: '191102LN',
              category: 3,
            },{
                name: '190812PN',
                category: 3,
              },
              {
              name: 'pr25073',
              category: 4,
            },
              {
              name: 'rd0103_af',
              category: 2,
            },{
              name: 'd1925012',
              category: 6,
            },{
              name: 'og_200105vn',
              category: 1,
            },{
              name: 'c-00439',
              category: 1,
            },{
              name: '190813BG',
              category: 3,
            },{
              name: '200105Oa',
              category: 3,
            },{
              name: '190813Gc_1',
              category: 0,
            },{
              name: '视频3',
              category: 0,
            },
            ],
            links:[{
              source: '191102Gp_4',
              target: 'c-00096',
              name: '截取',
            }, {
              source: '191102LN',
              target: '191102Gp_4',
              name: '拥有',
            },{
              source: '191102LN',
              target: '191102Gp_3',
              name: '拥有',
            },
              {
              source: '191102LN',
              target: 'c-00096',
              name: '拥有',
            }, {
              source: '191102LN',
              target: 'og_191102q1',
              name: '拥有',
            },{
              source: '191102LN',
              target: 'og_191102qv',
              name: '拥有',
            },{
              source: '191102LN',
              target: 'og_191102hu',
              name: '拥有',
            },{
              source: '191102LN',
              target: 'og_191102bf',
              name: '拥有',
            },
              {
              source: '191102LN',
              target: 'rd0103_o',
              name: '拥有',
            },{
                source: '191102LN',
                target: 'rd0119_o',
                name: '拥有',
              },
              {
              source: '190813BG',
              target: '190813Gc_1',
              name: '拥有',
            },{
                source: '190813BG',
                target: 'og_190813au',
                name: '拥有',
              },
              {
              source: '200105Oa',
              target: '视频3',
              name: '拥有',
            },{
                source: '200105Oa',
                target: 'og_200105iv',
                name: '拥有',
              },{
                source: '200105Oa',
                target: 'og_200105ap',
                name: '拥有',
              },
              {
              source: 'rd0103_o',
              target: 'rd0103_af',
              name:'降噪',
            },{
                source: 'rd0119_o',
                target: 'rd0119_af',
                name:'降噪',
              },
              {
              source: 'd1925012',
              target: 'rd0103_af',
              name:'操作',
            },{
                source: 'd1925012',
                target: 'rd0119_af',
                name:'操作',
              },
              {
                source: 'd1925012',
                target: '点云3a',
                name:'操作',
              },
              {
                source: 'd1925012',
                target: '点云4a',
                name:'操作',
              },
              {
              source: 'pr25073',
              target: '191102LN',
              name:'负责',
            },{
                source: 'pr25073',
                target: '190812PN',
                name:'负责',
              },
              {
              source: '191102Gp_4',
              target: 'c-00096',
              name:'截取',
            },{
              source: '191102Gp_4',
              target: 'c-00160',
              name:'截取',
            },{
              source: '191102Gp_4',
              target: 'c-00167',
              name:'截取',
            },{
              source: '191102Gp_4',
              target: 'c-00149',
              name:'截取',
            },{
                source: '191102Gp_3',
                target: 'c-00217',
                name:'截取',
              },
              {
                source: '191102Gp_3',
                target: 'c-00205',
                name:'截取',
              },{
                source: '191102Gp_3',
                target: 'c-00201',
                name:'截取',
              },
              {
              source: '21sGa0613',
              target: '191102LN',
              name:'发生',
            },{
              source: 'c-00096',
              target: 'og_200105vn',
              name:'相似',
            },{
              source: 'og_200105vn',
              target: 'c-00096',
              name:'相似',
            },{
              source: 'c-00096',
              target: 'c-00439',
              name:'相似',
            },{
              source: 'c-00439',
              target: 'c-00096',
              name:'相似',
            },{
                source: 'og_191102qv',
                target: 'c-00317',
                name:'相似',
              },
              {
                source: 'c-00317',
                target: 'og_191102qv',
                name:'相似',
              },
              {
              source: '21sGa0613',
              target: '190813BG',
              name:'发生',
            },{
              source: '21sGa0613',
              target: '200105Oa',
              name:'发生',
            },{
                source: '管段2',
                target: '190812PN',
                name:'发生',
              },

            ],
          };
      },
      methods:{
        initchart_kg(){
          this.kgchart = echarts.init(
            document.getElementById("kg"),"macarons"
          );
          //var categories =[];
          var option = {
            title: {
              text: '数据关联图谱',
              left:'center',
            },
            tooltip: {
              formatter: function (x) {
                return x.data.name;
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
                symbolSize: 50,
                roam: true,
                label: {
                  show: true
                },
                edgeSymbol: ['circle', 'arrow'],
                edgeSymbolSize: [4, 10],
                force: {
                  repulsion: 2500,
                  edgeLength: [120,200]
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
                data: this.nodes,
                links: this.links,
                categories:this.kg_categories,
              }
            ]
          };
          this.kgchart.setOption(option,true);
        },
        deep(){
          this.dialogVisible=true;
          // this.drawer=true;
        },
        chooseDeep(){
          this.links=[];
          this.initchart_kg();
          this.$message({
            type: "success",
            message: "修改成功!"
          });
        },

      },
      mounted() {
        this.initchart_kg();
      }
    }
</script>


<style scoped>

  #kg{
    height: 700px;
    background-color: rgba(242,234,191,0.15);
  }
</style>
