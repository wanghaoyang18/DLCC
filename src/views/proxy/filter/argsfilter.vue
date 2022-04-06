<template>
    <div style="margin-left:10px">
      <div class="header">
         <el-date-picker
          v-model="value1"
          type="date"
          placeholder="选择日期">
        </el-date-picker>
        <el-button type="text" @click="check" style="margin-left:30px">查询</el-button>
        <el-button  @click="check" style="float:right;margin-right:50px"><i class="el-icon-plus"></i> 添加</el-button>
      </div>
        
        
        <hr style="margin-top:15px; border:rgb(222,222,222) solid 0.5px"/>
        <el-table :data="argsfilter" style="width:100%;" type="card"  fit stripe>
        <el-table-column label="id" prop="id" ></el-table-column>
        <el-table-column label="时间" prop="time" ></el-table-column>
        <el-table-column label="添加者" prop="username" ></el-table-column>
        <el-table-column label="规则" prop="rule"></el-table-column>
        <el-table-column label="操作">
             <template slot-scope="scope">
                        <el-button size="small" type="success"
                                   @click="changeone(scope.$index, scope.row)">修改
                        </el-button>
                        <el-button size="small" type="warning"
                                   @click="deleteone(scope.$index, scope.row)">删除
                        </el-button>
                    </template>
        </el-table-column>
      </el-table>

        <el-dialog
            title="修改条目"
            :visible.sync="dialogVisible"
                width="30%"
            :before-close="dialog_handlehandleClose">
            <el-row class="dia_row">
                <el-col :span="3"><span>id</span> </el-col>
                <el-col :span="21"><el-input class="dia_input" classv-model="input" v-model="dia_id" disabled></el-input></el-col>
            </el-row>
                <el-row class="dia_row">
                <el-col :span="3"><span>time</span> </el-col>
                <el-col :span="21"><el-input class="dia_input" classv-model="input" v-model="dia_time" disabled></el-input></el-col>
            </el-row>
                <el-row class="dia_row">
                <el-col :span="3"><span>username</span> </el-col>
                <el-col :span="21"><el-input class="dia_input" classv-model="input" v-model="dia_username" disabled></el-input></el-col>
            </el-row>
                <el-row class="dia_row">
                <el-col :span="3"><span>rule</span> </el-col>
                <el-col :span="21"><el-input class="dia_input" classv-model="input" v-model="dia_rule" ></el-input></el-col>
            </el-row>
            
        
            <span slot="footer" class="dialog-footer">
                <el-button @click="dialogVisible = false" size="small" type="warning" style="text-align:center;">取 消</el-button>
                <el-button @click="changdata"  size="small" type="primary"  style="text-align:center;">确 定</el-button>
            </span>
        </el-dialog>
    </div>
</template>

<script>
export default {
  data() {
    return {
      dialogVisible: false,
      dia_id: "",
      dia_time: "",
      dia_rule: "",
      dia_username: "",
      argsfilter: [
        { id: "1", time: "2018-9-20", rule: "\\.\\./", username: "admin" },
        { id: "2", time: "2018-9-20", rule: "select . /s", username: "admin" },
        { id: "3", time: "2018-9-20", rule: "https", username: "admin" },
        { id: "4", time: "2018-9-20", rule: ".java", username: "admin" },
        {
          id: "5",
          time: "2018-9-20",
          rule: "asd|sd|ssaas|ssl",
          username: "admin"
        },
        { id: "6", time: "2018-9-20", rule: "???", username: "admin" },
        { id: "7", time: "2018-9-20", rule: "whiat", username: "admin" }
      ]
    };
  },
  methods: {
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
    },
    changeone(index, row) {
      this.dialogVisible = true;
      this.dia_id=row.id;
      this.dia_rule=row.rule;
      this.dia_time=row.time;
      this.dia_username=row.username;
    },
    changdata(){
      
    },
    dialog_handlehandleClose(){
        
    }
  }
};
</script>

<style scoped>
.dia_input {

  margin-left: 30px;
  width: 70%;
}
.dia_row{
    margin-top: 20px;
    
}
</style>