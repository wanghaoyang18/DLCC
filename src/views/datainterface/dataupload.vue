<template>
    <div>
      <el-breadcrumb separator="/" style="margin:20px">
        <el-breadcrumb-item><i class="el-icon-menu"></i>数据注入</el-breadcrumb-item>
        <el-breadcrumb-item>数据上传</el-breadcrumb-item>
      </el-breadcrumb>
      <el-card style="margin-left: 0.5%;margin-right: 0.5%;margin-top: 5px;margin-bottom: 3px" shadow="always">
        <el-tabs v-model="activeName"  @tab-click="handleClick" >
          <el-tab-pane label="图像数据" name="first" >
              <el-row style="margin-top: 20px">
                <el-col :span="6">
                  <el-switch
                    v-model="switch_flag"
                    active-text="启用表单"
                    inactive-text="禁用表单">
                  </el-switch >
                </el-col>
                <el-col :span="18">
                  <el-switch
                    v-model="safe_flag"
                    active-text="安全模式"
                    inactive-text="上传模式" style="margin-left: 60%">
                  </el-switch >
                </el-col>
              </el-row>


              <el-row :gutter="50" style="margin-top: 15px">
                <el-col :span="8">
                  <span class="filter_span">文件命名</span>
                  <el-input
                    v-model="og_name"
                    placeholder="输入名称"
                    style="width:70%">
                  </el-input>
                </el-col>
                <el-col :span="8">
                  <span class="filter_span">创建日期</span>
                  <el-date-picker
                    v-model="og_date"
                    type="date"
                    placeholder="选择日期"
                    style="width:70%">
                  </el-date-picker>
                </el-col>
                <el-col :span="8">
                  <span class="filter_span">添加标签</span>
                  <el-select multiple="true" v-model="og_label"  placeholder="请选择" clearable>
                    <el-option
                      v-for="item in og_labels"
                      :key="item.value"
                      :label="item.label"
                      :value="item.value"
                    ></el-option>
                  </el-select>
                </el-col>
              </el-row>

              <el-row style="margin-top: 15px" :gutter="50">
                <el-col :span="8">
                  <span class="filter_span">原身文件</span>
                  <el-input
                    placeholder="输入名称"
                    style="width:70%">
                  </el-input>
                </el-col>
                <el-col :span="8">
                  <span class="filter_span">所属事件</span>
                  <el-input
                    placeholder="输入名称"
                    style="width:70%">
                  </el-input>
                </el-col>
                <el-col :span="8">
                  <span class="filter_span">扩展内容</span>
                  <el-input
                    placeholder="输入名称"
                    style="width:70%">
                  </el-input>
                </el-col>
              </el-row>
              <hr style="border:solid 1px rgb(233,233,233);margin-top: 20px"/>
              <el-row style="margin-top: 15px">
                <el-col span="6">
                  <input style="margin-top: 10px;margin-left: 5px" type="file" id="file" name="file"/>
                </el-col>
                <el-col span="14">
                  <el-input type="textarea" v-model="og_msg"  placeholder="直接输入完整信息" style="width:80%;margin-left: 10%" v-bind:disabled="this.switch_flag"></el-input>
                </el-col>
                <el-col span="4">
                  <el-button type="primary" @click="og_upload"
                  >上传</el-button>
                </el-col>

              </el-row>
          </el-tab-pane>
          <el-tab-pane label="点云数据" name="second" >
          </el-tab-pane>
          <el-tab-pane label="视频数据" name="third"></el-tab-pane>
          <el-tab-pane label="事件数据" name="fourth"></el-tab-pane>
        </el-tabs>
      </el-card>

      <el-card style="margin-left: 0.5%;margin-right: 0.5%;margin-top: 15px">
        <el-card>
          <span style="color: #5E5E5E;font-size: 20px;font-weight: 800;color: #d87a80">最近上传</span>
          <el-button type="primary" style="margin-left: 71%">刷新</el-button>
        </el-card>
        <el-table
          :data="tableData"
          stripe
          style="width: 100%"
          :default-sort = "{prop: 'date', order: 'descending'}"
        >
          <el-table-column
            prop="date"
            label="上传日期"
            sortable
            width="180">
          </el-table-column>
          <el-table-column
            prop="name"
            label="文件名称"
            width="170">
          </el-table-column>
          <el-table-column
            prop="label"
            label="标签类别"
            width="170">
          </el-table-column>
          <el-table-column
            prop="event"
            label="所属事件"
            width="170">
          </el-table-column>
          <el-table-column
            prop="from"
            label="原身文件"
            width="170">
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
  import axios from 'axios';

    export default {
        data(){
          return{

            tableData:[
              {
                date:"2020-12-9",
                name:"c-30168",
                label:"巡检图像",
                event:"190722vj",
                from:"190722Ga_p_3",
              },
            ],
            safe_flag:true,
            activeName:"first",
            og_msg:"",
            switch_flag:true,
            og_label:[],
            og_labels:[
              {
                value: "car",
                label: "车辆"
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

          };
        },
      methods:{
        handleClick(tab,event) {
          if (tab.name==="first"){
            this.messaget=1111;
            this.$message({
              type: "success",
              message: this.messaget,
            });
          } else if(tab.name==="second"){
            this.messaget=2222;
            this.$message({
              type: "success",
              message: this.messaget,
            });
          }

        },
        og_upload(){
          this.$message({
            type: "success",
            message: document.getElementById("file").files[0].name,
          })
        }

      }
    }
</script>

<style scoped>

</style>
