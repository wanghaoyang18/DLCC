<template>
    <div>
     <el-breadcrumb class="bread" separator="/">
                    <el-breadcrumb-item><i class="el-icon-menu"></i>数据库管理</el-breadcrumb-item>
                    <el-breadcrumb-item>数据文件操作日志</el-breadcrumb-item>
        </el-breadcrumb>
        <el-card style="margin:20px 10px" >
          <el-row :gutter="50">
                <el-col :span="8">  
                    <span class="filter_span">监控IP </span> 
                    <el-input class="dia_input"  ></el-input>
                </el-col>
                <el-col :span="8">
                    <span class="filter_span">类型 </span>
                    <el-select class="dia_input" v-model="typevalue" placeholder="请选择">
                        <el-option
                        v-for="item in type"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value">
                    </el-option>
                </el-select>
                </el-col>
                <el-col :span="8">
                     <span class="filter_span">具体地址 </span>
                     <el-input v-model="username" placeholder="请输入用户名" style="width:70%"></el-input>
                </el-col>
            </el-row>
       

        <el-row :gutter="50" style="margin-top:15px;margin-bottom:15px;">
                <el-col :span="8">
                     <el-button  @click="check" >查找</el-button>
                     <el-button  @click="addmointoritem" style="margin-left:27px" >添加监控</el-button>
                </el-col>
        </el-row>
      
       <hr style="border:solid 0.5px rgb(222,222,222)"/>
        
        
        <el-table :data="data" style="width:100%;"  fit stripe>
            <el-table-column label="监控IP"  >
                  <template slot-scope="scope">
                        <span v-bind:style="{ color: fontcolor(scope.row.ischange)}"> {{scope.row.IP}}</span>
                    </template>
            </el-table-column>
            <el-table-column label="类型"  >
                  <template slot-scope="scope">
                        <span v-bind:style="{ color: fontcolor(scope.row.ischange)}"> {{scope.row.type}}</span>
                    </template>
            </el-table-column>
            <el-table-column label="地址"  >
                  <template slot-scope="scope">
                        <span v-bind:style="{ color: fontcolor(scope.row.ischange)}"> {{scope.row.address}}</span>
                    </template>
            </el-table-column>
            
            
            <el-table-column label="开始时间"  >
                  <template slot-scope="scope">
                        <span v-bind:style="{ color: fontcolor(scope.row.ischange)}"> {{scope.row.time}}</span>
                    </template>
            </el-table-column>
            <el-table-column label="是否修改" >
                 <template slot-scope="scope">
                        <span v-bind:style="{ color: fontcolor(scope.row.ischange)}"> {{scope.row.ischange}}</span>
                    </template>
            </el-table-column>
            <el-table-column label="详细情况" >
                <template slot-scope="scope">
                        <el-button size="small" type="success"
                                   @click="detaildata(scope.$index, scope.row)">详情
                        </el-button>
                        <el-button size="small" type="warning"
                                   @click="deleteone(scope.$index, scope.row)">删除
                        </el-button>
                    </template>
            </el-table-column>
        </el-table>
        </el-card>
        <!-- 文件详情弹出框 -->
        <el-dialog
            title="修改条目"
            :visible.sync="dialogVisible"
                width="30%"
            :before-close="dialog_handlehandleClose">
            <el-row class="dia_row">
                <el-col :span="3"><span>id</span> </el-col>
                <el-col :span="21"><el-input class="dia_input" classv-model="input"  disabled></el-input></el-col>
            </el-row>
                <el-row class="dia_row">
                <el-col :span="3"><span>time</span> </el-col>
                <el-col :span="21"><el-input class="dia_input" classv-model="input" ></el-input></el-col>
            </el-row>
                <el-row class="dia_row">
                <el-col :span="3"><span>username</span> </el-col>
                <el-col :span="21"><el-input class="dia_input" classv-model="input" ></el-input></el-col>
            </el-row>
                <el-row class="dia_row">
                <el-col :span="3"><span>rule</span> </el-col>
                <el-col :span="21"><el-input class="dia_input" classv-model="input"  ></el-input></el-col>
            </el-row>
            
        
            <span slot="footer" class="dialog-footer">
                <el-button @click="dialogVisible = false" size="small" type="warning" style="text-align:center;">取 消</el-button>
                <el-button @click="changedata"  size="small" type="primary"  style="text-align:center;">确 定</el-button>
            </span>
        </el-dialog>

        <!-- 目录详情弹出框 -->
        <el-dialog
            title="修改条目"
            :visible.sync="catalogDialogVisible"
                width="30%"
            :before-close="dialog_handlehandleClose">
            <el-row class="dia_row">
                <el-col :span="3"><span>id</span> </el-col>
                <el-col :span="21"><el-input class="dia_input" classv-model="input"  disabled></el-input></el-col>
            </el-row>
                <el-row class="dia_row">
                <el-col :span="3"><span>time</span> </el-col>
                <el-col :span="21"><el-input class="dia_input" classv-model="input" ></el-input></el-col>
            </el-row>
                <el-row class="dia_row">
                <el-col :span="3"><span>username</span> </el-col>
                <el-col :span="21"><el-input class="dia_input" classv-model="input" ></el-input></el-col>
            </el-row>
                <el-row class="dia_row">
                <el-col :span="3"><span>rule</span> </el-col>
                <el-col :span="21"><el-input class="dia_input" classv-model="input"  ></el-input></el-col>
            </el-row>
            
        
            <span slot="footer" class="dialog-footer">
                <el-button @click="catalogDialogVisible = false" size="small" type="warning" style="text-align:center;">取 消</el-button>
                <el-button @click="changedata"  size="small" type="primary"  style="text-align:center;">确 定</el-button>
            </span>
        </el-dialog>

        <!-- 添加监控弹出框 --> 
         <el-dialog
            title="添加监控"
            :visible.sync="addItemDialogVisible"
            width="30%"
            :before-close="dialog_handlehandleClose"
            style="font-weight:800">
            <el-row class="dia_row">
                <el-col :span="3"><span>主机IP</span> </el-col>
                <el-col :span="21">
                    <el-select class="dia_input" v-model="value" placeholder="请选择">
                        <el-option
                        v-for="item in options"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value">
                    </el-option>
                </el-select>
                </el-col>
            </el-row>
                <el-row class="dia_row">
                <el-col :span="3"><span  style="">类型</span> </el-col>
                <el-col :span="21">
                    <div class="dia_input">
                          <el-radio v-model="filetype" label="1">文件</el-radio>
                          <el-radio v-model="filetype" label="2">目录</el-radio>
                    </div>
                  
                </el-col>
            </el-row>
                <el-row class="dia_row">
                <el-col :span="3"><span>路径</span> </el-col>
                <el-col :span="21"><el-input class="dia_input"  ></el-input></el-col>
            </el-row>
      
            
        
            <span slot="footer" class="dialog-footer">
                <el-button @click="addItemDialogVisible = false" size="small" type="warning" style="text-align:center;">取 消</el-button>
                <el-button @click="changedata"  size="small" type="primary"  style="text-align:center;">确 定</el-button>
            </span>

            
        </el-dialog>


    </div>
</template>

<script>
export default {
  data() {
    return {
        filetype:"1",
      dialogVisible: false,
      addItemDialogVisible: false,
      data: [
        {
          IP: "127.0.0.1",
          type: "目录",
          address: "/var/opt",
          time: "2018/10/5",
          ischange: "true"
        },
        {
          IP: "127.0.0.1",
          type: "文件",
          address: "/var/opt",
          time: "2018/10/5",
          ischange: "false"
        },
        {
          IP: "127.0.0.1",
          type: "文件",
          address: "/var/opt",
          time: "2018/10/5",
          ischange: "false"
        }
      ],
      type:[{
          value: "1",
          label: "目录"
        },
        {
          value: "2",
          label: "文件"
        },],
      typevalue:"",
      options: [
        {
          value: "1",
          label: "127.0.0.1"
        },
        {
          value: "2",
          label: "192.168.12.2"
        },
        {
          value: "3",
          label: "10.2.10.5"
        },
        {
          value: "4",
          label: "192.168.128.182"
        },
        {
          value: "5",
          label: "10.0.0.1"
        }
      ],
      value: ""
    };
  },
  methods: {
    dialog_handlehandleClose() {},
    fontcolor(change) {
      if (change == "true") {
        return "red";
      }
    },
    changedata() {},
    addmointoritem() {
      this.addItemDialogVisible = true;
    },
    formatterColumn(row, column) {
      console.log(row);
      if (row.ischange == "true") {
        this.fontcolor = "red";
      }
    },

    detaildata(index, row) {
      this.dialogVisible = true;
    },
    deleteone(index, row) {
      this.$confirm("此操作将删除该条目, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          this.$message({
            type: "success",
            message: "删除成功!"
          });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消删除"
          });
        });
    }
  }
};
</script>

    
<style scoped>

  .dia_input {
    margin-left: 30px;
    width: 70%;

  }

  .filter_span{
    line-height: 40px;
    display: inline-block;
    margin-right: 20px;
    color: rgb(112, 112, 112)
  }
</style>
