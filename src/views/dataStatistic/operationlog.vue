<template>
  <div>
    <el-breadcrumb separator="/" style="margin:20px">
      <el-breadcrumb-item><i class="el-icon-menu"></i>数据总览</el-breadcrumb-item>
      <el-breadcrumb-item>操作记录</el-breadcrumb-item>
    </el-breadcrumb>

    <el-card style="margin-left: 0.5%;margin-right: 0.5%;">
      <el-row :gutter="50">
        <el-col :span="8">
          <span class="filter_span">开始日期</span>
          <el-date-picker
            v-model="startDate"
            type="date"
            placeholder="选择日期"
            style="width:70%">
          </el-date-picker>
        </el-col>
        <el-col :span="8">
          <span class="filter_span">结束日期</span>
          <el-date-picker
            v-model="endDate"
            type="date"
            placeholder="选择日期"
            style="width:70%">
          </el-date-picker>
        </el-col>
        <el-col :span="8">
          <span class="filter_span">操作类型</span>
          <el-select v-model="operationType"  placeholder="请选择">
            <el-option
              v-for="item in operationTypes"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            ></el-option>
          </el-select>

        </el-col>
      </el-row>
      <el-row :gutter="50" style="margin-top: 10px;">
        <el-col :span="8">
          <span class="filter_span">操作用户</span>
          <el-input v-model="operationUser"  style="width:70%"></el-input>
        </el-col>
        <el-col :span="8">
          <span class="filter_span">操作对象</span>
          <el-select v-model="operationClass" placeholder="请选择">
            <el-option
              v-for="item in operationClasses"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            ></el-option>
          </el-select>

        </el-col>
        <el-col :span="8">
          <el-button type="primary" style="margin-left: 16%" @click="searchlog()">确定</el-button>
        </el-col>
      </el-row>
    </el-card>

    <el-card style="margin-left: 0.5%;margin-right: 0.5%;margin-top: 15px">
      <el-card><span style="color: #5E5E5E;font-size: 20px;font-weight: 800;">查询结果</span></el-card>
      <el-table
        :data="tableData"
        stripe
        style="width: 100%"
        :default-sort = "{prop: 'date', order: 'descending'}"
      >
        <el-table-column
          prop="date"
          label="日期"
          sortable
          width="180">
        </el-table-column>
        <el-table-column
          prop="name"
          label="用户"
          width="150">
        </el-table-column>
        <el-table-column
          prop="level"
          label="用户权限"
          width="150">
        </el-table-column>
        <el-table-column
          prop="address"
          label="ip地址"
          :formatter="formatter">
        </el-table-column>
        <el-table-column
          prop="risk"
          label="风险"
          width="150">
        </el-table-column>
        <el-table-column label="操作" >
          <template slot-scope="scope">
            <el-button type="success" size="small" @click="getloginfo(scope.$index, scope.row)">详情</el-button>
            <el-button type="warning" size="small"  @click="deluser(scope.$index,scope.row)">撤销</el-button>

          </template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>
<script>
  import moment from "moment";
  import echarts from "echarts";
  import  'echarts/theme/macarons.js'
  export default {
    data() {
      return {
        tableData: [
        ],
        activeName: 'first',
        messaget: 0,
        operationType:"all",
        operationTypes:[
          {
            value: "all",
            label: "所有"
          },
          {
            value: "query",
            label: "查询"
          },
          {
            value: "add",
            label: "添加"
          },
          {
            value: "alt",
            label: "修改"
          },
          {
            value: "del",
            label: "删除"
          },
        ],
        operationClass:"all",
        operationClasses:[
          {
            value: "all",
            label: "所有"
          },
          {
            value: "database",
            label: "实验数据"
          },
          {
            value: "service",
            label: "业务数据"
          },
        ],
        operationUser:'all',
        startDate:278363,
        endDate:738464,
        chart1:"",
        days:1,
        xdata2:["2021-1-2","2021-1-3","2021-1-4","2021-1-5","2021-1-6","2021-1-7","2021-1-8"],
        ydata2:[9,6,11,2,5,3,7],
        testchart1:"",
        aaachart:"",
      };
    },
    methods: {
      getloginfo(index,row){
        this.$confirm("确定删除此用户吗?"+index+row.date, "提示", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        })
      },
      searchlog(){
        this.tableData=[{
          date: '2016-05-02',
          name: '王小虎',
          address: '192.168.2.3'
        }, {
          date: '2016-05-04',
          name: '王小虎',
          address: '192.168.2.3'
        }, {
          date: '2016-05-01',
          name: '王小虎',
          address: '192.168.2.3'
        }, {
          date: '2016-05-03',
          name: '王小虎',
          address: '192.168.2.3'
        },{
          date: '2016-05-01',
          name: '王小虎',
          address: '192.168.2.3'
        },];
      },

    },

    mounted() {

    }
  };
</script>
<style scoped>

</style>
