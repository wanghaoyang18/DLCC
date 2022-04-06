<template>
  <div >
    <el-breadcrumb separator="/" style="margin:20px">
      <el-breadcrumb-item><i class="el-icon-menu"></i>服务器管理</el-breadcrumb-item>
      <el-breadcrumb-item>操作</el-breadcrumb-item>
    </el-breadcrumb>
  <el-card style="margin-left: 10px;margin-top: 20px;margin-right: 10px" >



    <el-row :gutter="50" style="margin-top:15px;margin-bottom:15px;">
      <el-col :span="8" style="margin-left: 5px;font-size: 20px;font-weight: 600;color: rgb(177,177,177)">
        <!--        <el-button  @click="check" >查找</el-button>-->
        <!--        <el-button  @click="addmointoritem" style="margin-left:27px" >添加监控</el-button>-->
        全部主机组
      </el-col>
      <el-col :span="4" offset="11"><el-button type="primary" style="margin-left: 30px" @click="gethostlist()">刷新</el-button></el-col>
    </el-row>

    <hr style="border:solid 0.5px rgb(222,222,222)"/>
    <el-table :data="groupdata" style="width:100%;" height="400" fit stripe>
      <el-table-column label="主机组ID"  sortable>
        <template slot-scope="scope">
          <span > {{scope.row.groupid}}</span>
        </template>
      </el-table-column>
      <el-table-column label="主机组名"  >
        <template slot-scope="scope">
          <span > {{scope.row.name}}</span>
        </template>
      </el-table-column>
      <el-table-column label="类型"  >
        <template slot-scope="scope">
          <span v-if="scope.row.groupid<15"> 系统生成</span>
          <span v-if="scope.row.groupid>14"> 人工添加</span>

        </template>
      </el-table-column>
      <el-table-column label="主机数"  >
        <template slot-scope="scope">
          <span > {{scope.row.count}}</span>
        </template>
      </el-table-column>

      <el-table-column label="操作" >
        <template slot-scope="scope">
          <el-button type="warning" size="small"  @click="delgroup(scope.$index,scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
  </el-card>
    <el-col span="10">
    <el-card style="margin-right: 10px;margin-left: 10px;margin-top: 15px">
      <el-row :gutter="50" style="margin-top:5px;margin-bottom:15px;">
        <el-col :span="8" style="margin-left: 5px;font-size: 20px;font-weight: 600;color: rgb(177,177,177)">新增主机组</el-col>
      </el-row>
      <hr style="border:solid 0.5px rgb(222,222,222);margin-bottom: 20px"/>
      <el-row :gutter="50">
        <el-col >
<!--          <span class="filter_span" style="margin-left: 10px">设置主机组名称</span>-->
          <el-input   v-model="groupname" placeholder="请输入新建主机组名称" style="width:80%"></el-input>
        </el-col>

      </el-row>
      <el-row :gutter="50" style="margin-top:10px;margin-bottom:2px;">
        <el-col  style="margin-top: 10px"><el-button type="primary" @click="addgroup()">添加</el-button></el-col>
      </el-row>
    </el-card>
    </el-col>

    <el-card style="margin-right: 10px;margin-left: 10px;margin-top: 15px" >
      <el-row :gutter="50" style="margin-top:5px;margin-bottom:15px;">
        <el-col :span="8" style="margin-left: 5px;font-size: 20px;font-weight: 600;color:rgb(177,177,177)">添加主机</el-col>
      </el-row>
      <hr style="border:solid 0.5px rgb(222,222,222);margin-bottom: 20px"/>


      <el-row :gutter="50">
        <el-col :span="12">
          <span class="filter_span">主机组</span>
          <el-input class="dia_input"  v-model="groupid" placeholder="请选择列表中存在的ID" ></el-input>
        </el-col>
        <el-col :span="12">
          <span class="filter_span">主机名</span>
          <el-input class="dia_input" v-model="hostname" placeholder="请输入主机名称">
          </el-input>
        </el-col>

      </el-row>
      <el-row :gutter="50" style="margin-top: 20px">
        <el-col :span="12">
          <span class="filter_span">IP地址</span>
          <el-input class="dia_input" v-model="hostip" placeholder="请输入主机的ip地址"></el-input>
        </el-col>
<!--        <el-col :span="12">-->
<!--          <span class="filter_span">IP地址</span>-->
<!--          <el-input class="dia_input" v-model="hostip" placeholder="请输入主机的ip地址"></el-input>-->
<!--        </el-col>-->
        <el-col :span="12">
          <el-col span="8" style="margin-left: 55px;margin-bottom: 2px"><el-button type="primary" @click="addhost()">添加</el-button></el-col>
        </el-col>
      </el-row>

    </el-card>
  </div>
</template>
<script>
  import axios from "axios"
    export default {
        data(){
          return{
            Sys :true,
            aed :false,
            groupname:"",
            groupid:"",
            hostname:"",
            hostip:"",
            groupdata:[
              {
                groupid :"111",
                name :"222",
                count :"1",
              }
            ]
          }
        },
      methods:{
          addgroup(){
            axios.post("/monitor/addgroup/",{
              groupname:this.groupname
            }).then(res =>{
              if (res.status==200){
                this.$message({
                  type: "success",
                  message: "添加成功!"
                });
              }else{
                this.$message.error("添加失败")
              }
            })
          },
        addhost(){
          axios.post("/monitor/addhost/",{
            groupid:this.groupid,
            hostname:this.hostname,
            hostip:this.hostip,
          }).then(res =>{
            if (res.status==200){
              this.$message({
                type: "success",
                message: "添加成功!"
              });
            }else{
              this.$message.error("添加失败")
            }
          })
        },
        delgroup(index,row){
            this.$confirm("确定删除吗?", "提示", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        })
          .then(() => {
            axios.post('/monitor/delgroup/',{
              groupid:row.groupid
            }).then(res=>{
              if (res.status==200){
                this.$message({
                  type: "success",
                  message: "删除成功!"
                });
              }else{
                this.$message.error("删除失败")
              }
            })
          })

        },
        gethostlist(){
          axios.get("/monitor/groupinfo").then( res => {
            this.groupdata=res.data.res;
          })
        },

      },
      mounted() {
        this.gethostlist();
      },

    }
</script>

<style scoped>
  .dia_input {
    margin-left: 30px;
    width: 70%;

  }

  .filter_span{
    line-height: 40px;
    display: inline-block;
    /*margin-right: 20px;*/
    margin-left: 10px;
    color: rgb(112, 112, 112)
  }
</style>
