<template>
<div>
     <el-breadcrumb class="bread" separator="/">
                    <el-breadcrumb-item><i class="el-icon-menu"></i>日志分析</el-breadcrumb-item>
                    <el-breadcrumb-item>nginx日志详情</el-breadcrumb-item>
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
                        style="width:70%">
                    </el-date-picker>
                </el-col>
                <el-col :span="8">
                    <span class="filter_span">结束日期</span>
                    <el-date-picker
                        v-model="endDate"
                        type="datetime"
                        placeholder="选择日期"
                        style="width:70%">
                    </el-date-picker>
                </el-col>
                <el-col :span="8">
                     <span class="filter_span">ip地址</span>
                     <!-- <el-input v-model="clientip" placeholder="请输入用户名" style="width:70%"></el-input> -->

                     <el-autocomplete
                        v-model="state4"
                        :fetch-suggestions="querySearchAsync"
                        placeholder="请输入内容"
                        @select="handleSelect"
                        style="width:70%"
                        ></el-autocomplete>
                </el-col>
            </el-row>

            <el-row :gutter="50" style="margin-top:30px">
                <el-col :span="8">
                    <span class="filter_span">请求类型</span>
                      <el-select v-model="operationType"  placeholder="请选择" style="width:70%">
                        <el-option
                        v-for="item in options"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value"
                        >
                        </el-option>
                    </el-select>
                </el-col>
                <el-col :span="8">
                    <span class="filter_span">响应字节</span>
                    <el-input v-model="bytenum" placeholder="请输入数值" style="width:70%" ></el-input>
                </el-col>
                <el-col :span="8"></el-col>
            </el-row>
            
            
        </el-card>
    </div>

    <div class="table-box">
    <el-card>
       <el-card class="searchresult">SearchResult <el-button class="button_check" @click="search"> <i class="el-icon-view"></i> 查找</el-button></el-card>
<!-- header-row-style="font-size:16px;color:black" -->
      <el-table :data="mysqldata" style="width:100%;"   fit stripe>
        <el-table-column label="日期" prop="_source.@timestamp" sortable></el-table-column>
        <el-table-column label="方法" prop="_source.verb" ></el-table-column>
        <el-table-column label="请求" prop="_source.request" ></el-table-column>
        <el-table-column label="响应" prop="_source.response" ></el-table-column>
        <el-table-column label="响应字节" prop="_source.bytes"></el-table-column>
         <el-table-column label="设备名称" prop="_source.useragent.os_name"></el-table-column>
        <el-table-column label="待定" prop="statement" ></el-table-column>
      </el-table>
      
      <el-pagination
        :page-size="20"
        :pager-count="11"
        layout="prev, pager, next"
        :total="total"
        @current-change="handleCurrentChange"
        :current-page.sync="currentPage"
        class="pagination">
     </el-pagination>
      </el-card>
    </div>
</div>
</template>

<script>
import axios from "axios";
import moment from "moment";
export default {
  data() {
    return {
      //tabledata
      bytenum: 0,
      clientip: "216.46.173.126",
      currentPage: 1,
      username: "",
      total: 0,
      user: "",
      ip: "",
      startDate: "",
      endDate: "",
      errorCode: "",
      operationType: "",
      //------------------------
      restaurants: [],
        state4: '',
        timeout:  null,
      //--------------------------
      options: [
        {
          value: "GET",
          label: "GET"
        },
        {
          value: "POST",
          label: "POST"
        },
        {
          value: "PUT",
          label: "PUT"
        }
      ],
      value5: [],
      value1: [],
      mysqldata: [],
      testdata: [
        {
          date: "2018/9/27",
          domain: "jjsk",
          userid: "admin",
          iptype: "real",
          operationtype: "delete",
          operation: "delete * from person sssss",
          errorid: "1"
        },
        {
          date: "2018/9/27",
          domain: "jjsk",
          userid: "admin",
          iptype: "real",
          operationtype: "insert",
          operation: "insert * from person ",
          errorid: "0"
        }
      ]
    };
  },
  methods: {
      loadAll() {
        return [
          { "value": "三全鲜食（北新泾店）", "address": "长宁区新渔路144号" },
          { "value": "Hot honey 首尔炸鸡（仙霞路）", "address": "上海市长宁区淞虹路661号" },
          { "value": "新旺角茶餐厅", "address": "上海市普陀区真北路988号创邑金沙谷6号楼113" },
          { "value": "泷千家(天山西路店)", "address": "天山西路438号" },
          { "value": "胖仙女纸杯蛋糕（上海凌空店）", "address": "上海市长宁区金钟路968号1幢18号楼一层商铺18-101" },
          { "value": "贡茶", "address": "上海市长宁区金钟路633号" },
          { "value": "豪大大香鸡排超级奶爸", "address": "上海市嘉定区曹安公路曹安路1685号" },
          { "value": "茶芝兰（奶茶，手抓饼）", "address": "上海市普陀区同普路1435号" },
          { "value": "十二泷町", "address": "上海市北翟路1444弄81号B幢-107" },
          { "value": "星移浓缩咖啡", "address": "上海市嘉定区新郁路817号" },
          { "value": "阿姨奶茶/豪大大", "address": "嘉定区曹安路1611号" },
          { "value": "新麦甜四季甜品炸鸡", "address": "嘉定区曹安公路2383弄55号" },
          { "value": "Monica摩托主题咖啡店", "address": "嘉定区江桥镇曹安公路2409号1F，2383弄62号1F" },
          { "value": "浮生若茶（凌空soho店）", "address": "上海长宁区金钟路968号9号楼地下一层" },
          { "value": "NONO JUICE  鲜榨果汁", "address": "上海市长宁区天山西路119号" },
          { "value": "CoCo都可(北新泾店）", "address": "上海市长宁区仙霞西路" },
          { "value": "快乐柠檬（神州智慧店）", "address": "上海市长宁区天山西路567号1层R117号店铺" },
          { "value": "Merci Paul cafe", "address": "上海市普陀区光复西路丹巴路28弄6号楼819" },
          { "value": "猫山王（西郊百联店）", "address": "上海市长宁区仙霞西路88号第一层G05-F01-1-306" },
          { "value": "枪会山", "address": "上海市普陀区棕榈路" },
          { "value": "纵食", "address": "元丰天山花园(东门) 双流路267号" },
          { "value": "钱记", "address": "上海市长宁区天山西路" },
          { "value": "壹杯加", "address": "上海市长宁区通协路" },
          { "value": "唦哇嘀咖", "address": "上海市长宁区新泾镇金钟路999号2幢（B幢）第01层第1-02A单元" },
          { "value": "爱茜茜里(西郊百联)", "address": "长宁区仙霞西路88号1305室" },
          { "value": "爱茜茜里(近铁广场)", "address": "上海市普陀区真北路818号近铁城市广场北区地下二楼N-B2-O2-C商铺" },
          { "value": "鲜果榨汁（金沙江路和美广店）", "address": "普陀区金沙江路2239号金沙和美广场B1-10-6" },
          { "value": "开心丽果（缤谷店）", "address": "上海市长宁区威宁路天山路341号" },
          { "value": "超级鸡车（丰庄路店）", "address": "上海市嘉定区丰庄路240号" },
          { "value": "妙生活果园（北新泾店）", "address": "长宁区新渔路144号" },
          { "value": "香宜度麻辣香锅", "address": "长宁区淞虹路148号" },
          { "value": "凡仔汉堡（老真北路店）", "address": "上海市普陀区老真北路160号" },
          { "value": "港式小铺", "address": "上海市长宁区金钟路968号15楼15-105室" },
          { "value": "蜀香源麻辣香锅（剑河路店）", "address": "剑河路443-1" },
          { "value": "北京饺子馆", "address": "长宁区北新泾街道天山西路490-1号" },
          { "value": "饭典*新简餐（凌空SOHO店）", "address": "上海市长宁区金钟路968号9号楼地下一层9-83室" },
          { "value": "焦耳·川式快餐（金钟路店）", "address": "上海市金钟路633号地下一层甲部" },
          { "value": "动力鸡车", "address": "长宁区仙霞西路299弄3号101B" },
          { "value": "浏阳蒸菜", "address": "天山西路430号" },
          { "value": "四海游龙（天山西路店）", "address": "上海市长宁区天山西路" },
          { "value": "樱花食堂（凌空店）", "address": "上海市长宁区金钟路968号15楼15-105室" },
          { "value": "壹分米客家传统调制米粉(天山店)", "address": "天山西路428号" },
          { "value": "福荣祥烧腊（平溪路店）", "address": "上海市长宁区协和路福泉路255弄57-73号" },
          { "value": "速记黄焖鸡米饭", "address": "上海市长宁区北新泾街道金钟路180号1层01号摊位" },
          { "value": "红辣椒麻辣烫", "address": "上海市长宁区天山西路492号" },
          { "value": "(小杨生煎)西郊百联餐厅", "address": "长宁区仙霞西路88号百联2楼" },
          { "value": "阳阳麻辣烫", "address": "天山西路389号" },
          { "value": "南拳妈妈龙虾盖浇饭", "address": "普陀区金沙江路1699号鑫乐惠美食广场A13" }
        ];
      },
       querySearchAsync(queryString, cb) {
        var restaurants = this.restaurants;
        var results = queryString ? restaurants.filter(this.createStateFilter(queryString)) : restaurants;

        clearTimeout(this.timeout);
        this.timeout = setTimeout(() => {
          cb(results);
        }, 1000 * Math.random());
      },
        createStateFilter(queryString) {
        return (state) => {
          return (state.value.toLowerCase().indexOf(queryString.toLowerCase()) === 0);
        };
      },
    handleCurrentChange() {
      this.search();
    },
    search() {
      if (
        (this.startDate == "") |
        (this.endDate == "") |
        (this.clientip == "")
      ) {
        alert("全都要输入");
      } else {
        var startDate = new Date(this.startDate).getTime();
        var endDate = new Date(this.endDate).getTime();
        axios
          .post(
            "http://192.168.182.133:9200/nginx_logs_*/_search?sort=@timestamp",
            {
              from: this.currentPage - 1,
              size: 20,
              _source: {
                excludes: []
              },
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
                      term: {
                        "clientip.keyword": this.clientip
                      }
                    },
                    { term: { "verb.keyword": this.operationType } },
                    {
                      range: {
                        "@timestamp": {
                          gte: startDate,
                          lte: endDate,
                          format: "epoch_millis"
                        }
                      }
                    },
                    {
                      range: {
                        bytes: {
                          gte: this.bytenum
                        }
                      }
                    }
                  ],
                  filter: [],
                  should: [],
                  must_not: []
                }
              }
            }
          )
          .then(res => {
            // this.total = res.data.count;
            // this.mysqldata = res.data.res;
            this.mysqldata = res.data.hits.hits;
            this.total = res.data.hits.total;
          })
          .catch(error => {
            console.log(error);
          });
      }
    },
    setdate() {
      var curDate = new Date();
      this.startDate = new Date(curDate.getTime() - 15 * 24 * 60 * 60 * 1000);
      this.startDate = moment(this.startDate).format("YYYY-MM-DD");
      this.search();
    },
    select(){

    },
    handleSelect(){
        console.log(this.state4)
    }
  },
  
  mounted() { this.restaurants = this.loadAll();}
};
</script>

<style scoped>
.table-box {
  margin-top: 20px;
  margin-left: 30px;
  margin-right: 30px;
}

.search-box {
  margin-top: 20px;
  margin-left: 30px;
  margin-right: 30px;
}
.header {
}
.button_check {
  float: right;
  border: 1px solid #409eff;
  color: #409eff;
  font-size: 15px;
}
.bread {
  margin-bottom: 20px;
}

.searchresult {
  line-height: 30px;
  font-size: 20px;
  font-weight: 800;
}
.filter_span {
  line-height: 40px;
  display: inline-block;
  margin-right: 20px;
  color: rgb(112, 112, 112);
}

.pagination {
  margin-top: 20px;
  text-align: center;
}
</style>
