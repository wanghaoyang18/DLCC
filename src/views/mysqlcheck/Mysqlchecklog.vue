<template>
<div>
  <el-breadcrumb class="bread" separator="/" style="margin:20px">
    <el-breadcrumb-item><i class="el-icon-menu"></i>数据库日志审计</el-breadcrumb-item>
  </el-breadcrumb>
    <div class="search-box">
        <el-card >
              
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
                     <span class="filter_span">数据库用户</span>
                     <el-input v-model="username" placeholder="请输入用户名" style="width:70%"></el-input>
                </el-col>
            </el-row>

            <el-row :gutter="50" style="margin-top:30px">
                <el-col :span="8">
                    <span class="filter_span">操作类型</span>
                      <el-select v-model="operationType" multiple placeholder="请选择" style="width:70%">
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
                    <span class="filter_span">错误编码</span>
                    <el-input v-model="errorCode" placeholder="请输入内容" style="width:70%" ></el-input>
                </el-col>
                <el-col :span="8">

                </el-col>
            </el-row>
            
            
        </el-card>
    </div>

    <div class="table-box">
    <el-card>
      <el-card class="searchresult"><span style="color: #5E5E5E">查 询 结 果 </span><el-button class="button_check" @click="search"> <i class="el-icon-view"></i> 查找</el-button></el-card>
<!-- header-row-style="font-size:16px;color:black" -->
      <el-table :data="mysqldata" style="width:100%;"   fit stripe>
        <el-table-column label="日期" prop="time" sortable></el-table-column>
        <el-table-column label="进程号" prop="thread_id" ></el-table-column>
        <el-table-column label="数据库用户" prop="user" ></el-table-column>
        <el-table-column label="IP地址" prop="ip" ></el-table-column>
        <el-table-column label="操作类型" prop="operatetype"></el-table-column>
         <el-table-column label="错误编码" prop="errorcode"></el-table-column>
        <el-table-column label="操作行为" prop="statement" ></el-table-column>
      </el-table>
      
      <el-pagination
        :page-size="20"
        :pager-count="1"
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
      currentPage: 1,
      username: "",
      total: 0,
      user: "",
      ip:"",
      startDate: "",
      endDate: "",
      errorCode: "",
      operationType: "",
    //--------------------------
      options: [
        {
          value: "CONNECT",
          label: "CONNECT"
        },
        {
          value: "QUERY",
          label: "QUERY"
        },
        {
          value: "DISCONNECT",
          label: "DISCONNECT"
        },
      ],
      value5: [],
      value1: [],
      mysqldata:[],
      testdata: [
        {
          time: "2018/9/27",
          thread_id: "jjsk",
          user: "admin",
          ip: "real",
          operatetype: "delete",
          statement: "delete * from person sssss",
          errorcode: "1"
        },
        {
          time: "2018/9/27",
          thread_id: "jjsk",
          user: "admin",
          ip: "real",
          operatetype: "delete",
          statement: "delete * from person sssss",
          errorcode: "1"
        },
        {
          time: "2018/9/17",
          thread_id: "jjsk",
          user: "admin",
          ip: "real",
          operatetype: "delete",
          statement: "delete * from person sssss",
          errorcode: "1"
        },
        {
          time: "2018/9/27",
          thread_id: "jjsk",
          user: "admin",
          ip: "real",
          operatetype: "delete",
          statement: "delete * from person sssss",
          errorcode: "1"
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
    handleCurrentChange() {
      this.search();
    },
    getlogdata(page) {
      axios
        .post("/sqllog/log/", {
          type: "hostname",
          hostname: "linux",
          page: page
        })
        .then(res => {
          this.total = res.data.count;
          this.mysqldata = res.data.res;
        }).catch(function (error) {
            this.mysqldata=testdata
        });
    },
    search(){
  
      if(this.startDate=="" && this.endDate=="" &&this.username=="" && this.operationType==""&&  this.errorCode=="")
      {
        alert("至少输入一个")
      }
      else
      {
        if(this.startDate!=""){
          this.startDate=moment(this.startDate).format("YYYY-MM-DD");
        }
       if(this.endDate!=""){
         this.endDate=moment(this.endDate).format("YYYY-MM-DD");
       }
        axios.post("/sqllog/log/",{
            startDate:this.startDate,
            endDate: this.endDate,
            user:  this.username,
            operateType:this.operationType ,
            errorcode: this.errorCode ,
            page: this.currentPage,

            hostname: "linux",
            ip: "",

            type: "all",
        }).then(res=>{
          this.total = res.data.count;
          this.mysqldata = res.data.res;
          this.startDate=this.startDate;
          this.endDate=this.endDate;
        }).catch((error)=>{
          console.log(error)
        })
      }

    },
    setdate(){
      var curDate = new Date(); 
      this.startDate=new Date(curDate.getTime() - 15*24*60*60*1000);
      this.startDate=moment(this.startDate).format("YYYY-MM-DD");
      // this.search();
    },
    testdata(){
      axios.
      get("/sqllog/loginit/").then(res =>{
        this.$message({
          type: "success",
          message: "数据添加成功!"
        });
      });
    }
  },
  mounted() {
     this.getlogdata(this.currentPage);
    this.setdate();
  }
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
