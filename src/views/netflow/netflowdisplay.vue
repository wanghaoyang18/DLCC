<template>
    <div>
     <el-breadcrumb class="bread" separator="/" style="margin:20px">
                    <el-breadcrumb-item><i class="el-icon-menu"></i>日志分析</el-breadcrumb-item>
                    <el-breadcrumb-item>nginx日志审计</el-breadcrumb-item>
        </el-breadcrumb>
    <div class="search-box">
        <el-card >   
          
            <el-row :gutter="50">
                <el-col :span="8">  
                    <span class="filter_span">开始日期</span> 
                    <el-date-picker
                        v-model="startDate"
                        type="datetime"
                        placeholder="选择日期"
                        value-format="timestamp"
                        style="width:70%">
                    </el-date-picker>
                </el-col>
                <el-col :span="8">
                    <span class="filter_span">结束日期</span>
                    <el-date-picker
                        v-model="endDate"
                        type="datetime"
                        value-format="timestamp"
                        placeholder="选择日期"
                        style="width:70%">
                    </el-date-picker>
                </el-col>
                <el-col :span="8">
                     <span class="filter_span">时间间隔</span>
                       <el-select v-model="interval"  placeholder="请选择" style="width:70%">
                        <el-option
                        v-for="item in toptions"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value"
                        >
                        </el-option>
                    </el-select>
                </el-col>
            </el-row>
        <el-button type="primary" @click="show" style="margin:10px">图表展示</el-button>
        </el-card>

        <div  v-loading="loading_disk">
          <div id="flow">
           <div style="height:200px;line-height:200px;text-align:center;font-size:20px;color:blue"> 请输入开始时间和结束时间</div>
          </div>
        </div>
          
       <el-row :gutter="20">
        <el-col :span="12">
            <div>
              <div id="verbrank">
    
              </div>
            </div>
        </el-col>
         <el-col :span="12">
          <div >
            <div id="reponserank">
            </div>
          </div>
         </el-col>
      </el-row>  
      <el-row :gutter="20">
        <el-col :span="12">
          <el-card  v-show="labelshow">总访问量</el-card>
            <div>
              <div id="countdisplay">
              </div>
            </div>
        </el-col>
         <el-col :span="12">
           <el-card v-show="labelshow">nginx总流量</el-card>
          <div >
            <div id="flowdisplay">
            </div>
          </div>
         </el-col>
      </el-row> 
    </div>

    </div>
</template>

<script>
import moment from "moment";
import echarts from "echarts";
import axios from "axios";
export default {
  data() {
    return {
      Chart: "",
      option: {},
      loading_disk: false,
      total: 100,
      startDate: 1431446400000,
      endDate: 1433538975996,
      interval: "12h",
      operationType: "",
      flowdisplayCharts: "",
      countdisplayCharts: "",
      reponserankchart: "",
      verbrankchart:"",
      labelshow:false,
      toptions: [
        {
          value: "1h",
          label: "1小时"
        },
        {
          value: "3h",
          label: "3小时"
        },
        {
          value: "6h",
          label: "6小时"
        },
        {
          value: "12h",
          label: "12小时"
        },
        {
          value: "1d",
          label: "天"
        },
        {
          value: "1w",
          label: "周"
        },
        {
          value: "1M",
          label: "月"
        },
        {
          value: "1y",
          label: "年"
        }
      ]
    };
  },
  methods: {
    show() {
      // this.$message.error("？？？"+this.startDate);
      this.getFlowDataAndShow(this.startDate, this.endDate, this.interval);
      this.getCountRankDataAndShow(this.startDate, this.endDate, this.interval);
      this.getFlowRankDataAndShow(this.startDate, this.endDate, this.interval);
      this.getResponseRankAndShow(this.startDate, this.endDate, this.interval);
      this.getVerbRankAndShow(this.startDate, this.endDate, this.interval);
    },

    getFlowDataAndShow(startDate, endDate, interval) {
      if (interval == null) {
        interval = "12h";
      }
      if ((startDate == null) & (endDate == null)) {
        this.$message.error("？？？");
      } else {
        this.loading_disk = true;
        axios
          .post("/api/nginx_logs-*/_search", {
            aggs: {
              "2": {
                date_histogram: {
                  field: "@timestamp",
                  interval: interval,
                  time_zone: "Asia/Shanghai",
                  min_doc_count: 1
                },
                aggs: {
                  "1": {
                    sum: {
                      field: "bytes"
                    }
                  }
                }
              }
            },
            size: 0,
            _source: {
              excludes: []
            },
            stored_fields: ["*"],
            script_fields: {},
            docvalue_fields: [
              {
                field: "@read_timestamp",
                format: "date_time"
              },
              {
                field: "@timestamp",
                format: "date_time"
              }
            ],
            query: {
              bool: {
                must: [
                  {
                    match_all: {}
                  },
                  {
                    range: {
                      "@timestamp": {
                        // gte: 1431446400000,
                        // lte: 1433538975996,
                        gte: startDate,
                        lte: endDate,
                        format: "epoch_millis"
                      }
                    }
                  }
                ],
                filter: [],
                should: [],
                must_not: []
              }
            }
          })
          .then(res => {
            var xydata = res.data.aggregations["2"].buckets;
            var xdata = [];
            var ydata = [];
            xydata.forEach(function(d, i) {
              var date =
                moment(d.key).format("HH:mm:ss") +
                " " +
                moment(d.key).format("YYYY/MM/DD");
              xdata.push(date);
              ydata.push(d["1"].value);
            });
            this.initcharts1(xdata, ydata);
          })
          .catch(function(error) {
            console.log(error);
          });
      }
    },
    getCountRankDataAndShow(startDate, endDate, interval) {
      axios
        .post("/api/nginx_logs-*/_search", {
          aggs: {
            "2": {
              terms: {
                field: "clientip.keyword",
                size: 10,
                order: {
                  _count: "desc"
                }
              }
            }
          },
          size: 0,
          _source: {
            excludes: []
          },
          stored_fields: ["*"],
          script_fields: {},
          docvalue_fields: [
            {
              field: "@read_timestamp",
              format: "date_time"
            },
            {
              field: "@timestamp",
              format: "date_time"
            }
          ],
          query: {
            bool: {
              must: [
                {
                  match_all: {}
                },
                {
                  range: {
                    "@timestamp": {
                      gte: startDate,
                      lte: endDate,
                      format: "epoch_millis"
                    }
                  }
                }
              ],
              filter: [],
              should: [],
              must_not: []
            }
          }
        })
        .then(res => {
          var xydata = res.data.aggregations[2].buckets;
          var xdata = [];
          var ydata = [];
          xydata.forEach(function(value, i) {
            xdata.push(value.key);
            ydata.push(value.doc_count);
          });
          this.initcharts2(xdata, ydata);
        });
    },
    getFlowRankDataAndShow(startDate, endDate, interval) {
      axios
        .post("/api/nginx_logs-*/_search", {
          aggs: {
            "2": {
              terms: {
                field: "clientip.keyword",
                size: 10,
                order: {
                  "1": "desc"
                }
              },
              aggs: {
                "1": {
                  sum: {
                    field: "bytes"
                  }
                }
              }
            }
          },
          size: 0,
          _source: {
            excludes: []
          },
          stored_fields: ["*"],
          script_fields: {},
          docvalue_fields: [
            {
              field: "@read_timestamp",
              format: "date_time"
            },
            {
              field: "@timestamp",
              format: "date_time"
            }
          ],
          query: {
            bool: {
              must: [
                {
                  match_all: {}
                },
                {
                  range: {
                    "@timestamp": {
                      gte: startDate,
                      lte: endDate,
                      format: "epoch_millis"
                    }
                  }
                }
              ],
              filter: [],
              should: [],
              must_not: []
            }
          }
        })
        .then(res => {
          var xydata = res.data.aggregations["2"].buckets;
          var xdata = [];
          var ydata = [];
          xydata.forEach(function(value, i) {
            xdata.push(value.key);
            ydata.push(value["1"].value);
          });

          this.initcharts3(xdata, ydata);
        });
    },
    getResponseRankAndShow(startDate, endDate, interval) {
      axios
        .post("/api/nginx_logs-*/_search", {
          aggs: {
            "2": {
              terms: {
                field: "response.keyword",
                size: 10,
                order: {
                  _count: "desc"
                }
              }
            }
          },
          size: 0,
          _source: {
            excludes: []
          },
          stored_fields: ["*"],
          script_fields: {},
          docvalue_fields: [
            {
              field: "@read_timestamp",
              format: "date_time"
            },
            {
              field: "@timestamp",
              format: "date_time"
            }
          ],
          query: {
            bool: {
              must: [
                {
                  match_all: {}
                },
                {
                  range: {
                    "@timestamp": {
                      gte: startDate,
                      lte: endDate,
                      format: "epoch_millis"
                    }
                  }
                }
              ],
              filter: [],
              should: [],
              must_not: []
            }
          }
        })
        .then(res => {
          var xydata = res.data.aggregations["2"].buckets;
          var xdata = [];
          var ydata = [];
          xydata.forEach(function(value, i) {
            xdata.push(value.key);
            ydata.push({ value: value.doc_count, name: value.key });
          });
          this.initchartsResponseRank(xdata, ydata);
        });
    },
    getVerbRankAndShow(startDate, endDate, interval) {
      axios
        .post("/api/nginx_logs-*/_search", {
          aggs: {
            "2": {
              terms: {
                field: "verb.keyword",
                size: 5,
                order: {
                  _count: "desc"
                }
              }
            }
          },
          size: 0,
          _source: {
            excludes: []
          },
          stored_fields: ["*"],
          script_fields: {},
          docvalue_fields: [
            {
              field: "@read_timestamp",
              format: "date_time"
            },
            {
              field: "@timestamp",
              format: "date_time"
            }
          ],
          query: {
            bool: {
              must: [
                {
                  match_all: {}
                },
                {
                  range: {
                    "@timestamp": {
                      gte: startDate,
                      lte: endDate,
                      format: "epoch_millis"
                    }
                  }
                }
              ],
              filter: [],
              should: [],
              must_not: []
            }
          }
        })
        .then(res => {
          var xydata = res.data.aggregations["2"].buckets;
          var xdata = [];
          var ydata = [];
          xydata.forEach(function(value, i) {
            xdata.push(value.key);
            ydata.push({ value: value.doc_count, name: value.key });
          });
          console.log(xdata,ydata)
          this.initchartsVerbRank(xdata, ydata);
        });
    },
    //获得所有流量信息
    initcharts1(xdata, ydata) {
      this.Chart = echarts.init(document.getElementById("flow"));
      var option = {
        title: {
          text: "nginx流量统计图",
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
            name: "总流量",
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
            itemStyle: {
              normal: {
                color: "rgb(70,70,170)"
              }
            }
          }
        ]
      };
      this.Chart.setOption(option);
      this.loading_disk = false;
    },
    //用户访问次数排行
    initcharts2(xdata, ydata) {
      xdata = xdata.reverse();
      ydata = ydata.reverse();
      this.countdisplayCharts = echarts.init(
        document.getElementById("countdisplay")
      );

      var option = {
        title: {
          text: "访问次数排行Top10",
          subtext: ""
        },
        tooltip: {
          trigger: "axis"
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
            type: "value",
            boundaryGap: [0, 0.01]
          }
        ],
        yAxis: [
          {
            type: "category",
            data: xdata
          }
        ],
        grid: {
          left: 120
        },
        series: [
          {
            name: "",
            type: "bar",
            data: ydata,
            itemStyle: {
              normal: {
                color: "rgb(70,70,170)"
              }
            }
          }
        ]
      };
      this.countdisplayCharts.setOption(option);
    },
    //流量访问次数排行
    initcharts3(xdata, ydata) {
      xdata = xdata.reverse();
      ydata = ydata.reverse();
      this.flowdisplayCharts = echarts.init(
        document.getElementById("flowdisplay")
      );
      var option = {
        title: {
          text: "流量排行Top10",
          subtext: ""
        },
        tooltip: {
          trigger: "axis"
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
        grid: {
          left: 120
        },
        xAxis: [
          {
            type: "value",
            boundaryGap: [0, 0.01]
          }
        ],
        yAxis: [
          {
            type: "category",
            data: xdata
          }
        ],
        series: [
          {
            name: "2011年",
            type: "bar",
            data: ydata,
            itemStyle: {
              normal: {
                color: "rgb(70,70,170)"
              }
            }
          }
        ]
      };
      this.flowdisplayCharts.setOption(option);
    },
    //verbrank
    initchartsResponseRank(xdata, ydata) {
      console.log(xdata, ydata);
      this.reponserankchart = echarts.init(
        document.getElementById("reponserank")
      );
      var option = {
        title: {
          text: "返回码情况",
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
          data: xdata
        },
        toolbox: {
          show: true,
          feature: {
            mark: { show: true },
            dataView: { show: true, readOnly: false },
            magicType: {
              show: true,
              type: ["pie", "funnel"],
              option: {
                funnel: {
                  x: "25%",
                  width: "50%",
                  funnelAlign: "left",
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
            name: "访问来源",
            type: "pie",
            radius: "55%",
            center: ["50%", "60%"],
            data: ydata
          }
        ]
      };
      this.reponserankchart.setOption(option);
    },
    initchartsVerbRank(xdata, ydata) {
      
      this.verbrankchart = echarts.init(
        document.getElementById("verbrank")
      );
      var option = {
        title: {
          text: "方法调用情况",
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
          data: xdata
        },
        toolbox: {
          show: true,
          feature: {
            mark: { show: true },
            dataView: { show: true, readOnly: false },
            magicType: {
              show: true,
              type: ["pie", "funnel"],
              option: {
                funnel: {
                  x: "25%",
                  width: "50%",
                  funnelAlign: "left",
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
            name: "访问来源",
            type: "pie",
            radius: "55%",
            center: ["50%", "60%"],
            data: ydata
          }
        ]
      };
      this.verbrankchart.setOption(option);
    }
  },
  mounted() {
   
  }
};
</script>

<style scoped>
.search-box {
  margin-top: 20px;
  margin-left: 30px;
  margin-right: 30px;
}

.filter_span {
  line-height: 40px;
  display: inline-block;
  margin-right: 20px;
  color: rgb(112, 112, 112);
}
#flow {
  height: 500px;
  margin-top: 50px;
}
#countdisplay {
  height: 500px;
  margin-top: 50px;
}
#flowdisplay {
  height: 500px;
  margin-top: 50px;
}
#verbrank {
  height: 500px;
  margin-top: 50px;
}
#reponserank {
  height: 500px;
  margin-top: 50px;
}
</style>
