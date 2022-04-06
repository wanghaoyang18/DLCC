<template>
    <div>
      <el-breadcrumb separator="/" style="margin:20px">
        <el-breadcrumb-item><i class="el-icon-menu"></i>数据注入</el-breadcrumb-item>
        <el-breadcrumb-item>规则设置</el-breadcrumb-item>
      </el-breadcrumb>

      <el-row>
        <el-col span="12">
          <el-card style="margin-left: 1%;margin-right: 0.5%;margin-top: 5px;height: 300px">
            <span style="font-size: x-large;font-weight: bold;color: #c05050">数据丢弃</span>
            <hr style="border:solid 0.5px rgb(233,233,233);margin-top: 5px"/>
            <el-row>
              <el-switch
                v-model="switch_flag1"
                active-text="启动修改"
                inactive-text="关闭修改"
                active-color="#c05050"
                style="margin-left: 60%;margin-top: 3px"
              >
              </el-switch >
            </el-row>
            <card style="margin-top: 1%;margin-left: 1%;margin-right: 1%;height: 100px">
              <el-checkbox-group v-model="dissettings" v-bind:disabled="!this.switch_flag1">
                <el-row>
                  <el-col span="6">
                    <el-checkbox label="disname">
                      数据命名
                    </el-checkbox>
                  </el-col>
                  <el-col span="6">
                    <el-checkbox label="discreatedate">
                      创建日期
                    </el-checkbox>
                  </el-col>
                  <el-col span="6">
                    <el-checkbox label="disfilesize">
                      文件大小
                    </el-checkbox>
                  </el-col>
                  <el-col span="6">
                    <el-checkbox label="disgsize">
                      图像尺寸
                    </el-checkbox>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col span="6">
                    <el-checkbox label="disfrom">
                      数据原身
                    </el-checkbox>
                  </el-col>
                  <el-col span="6">
                    <el-checkbox label="dis01">
                      备选项目
                    </el-checkbox>
                  </el-col>
                  <el-col span="6">
                    <el-checkbox label="dis02">
                      备选项目
                    </el-checkbox>
                  </el-col>
                  <el-col span="6">
                    <el-checkbox label="dis03">
                      扩展内容
                    </el-checkbox>
                  </el-col>
                </el-row>
              </el-checkbox-group>
              <row>
                <el-button type="primary" size="small" v-bind:disabled="!switch_flag1"
                style="margin-left: 75%"
                >修改配置</el-button>
              </row>
            </card>
            <el-col span="14">
              <el-row>
                  <el-input type="textarea" style="margin-left: 2%;margin-top: 10px"
                            :autosize="{ minRows: 2, maxRows: 3}"
                            placeholder="选择文本规则"
                            v-bind:disabled="!switch_flag1"
                  ></el-input>

              </el-row>
              <el-row>
                <el-button type="primary" size="small"
                           v-bind:disabled="!switch_flag1"
                           style="margin-left: 2%;margin-top: 1%">确定</el-button>
              </el-row>
            </el-col>

            <el-col span="10">
              <el-card shadow="always" style="margin-top: 5%;margin-left: 10%;">
                <el-row>
                  <el-col span="10">
                    <el-input
                      v-model="dis_intime"
                      v-bind:disabled="!switch_flag1"
                      style="margin-left: -10px;margin-top: -10px"></el-input>
                  </el-col>
                  <el-col span="14">
                    <el-select v-model="dis_time"
                               v-bind:disabled="!switch_flag1"
                               placeholder="请选择" style="margin-top: -10px">
                      <el-option
                        v-for="item in dis_times"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value"
                      ></el-option>
                    </el-select>
                  </el-col>
                </el-row>
                <el-row style="margin-bottom: -10px">
                  <span style="color: #409EFF;margin-left: 47%;margin-top: 3px">记录保存时长</span>
                </el-row >
              </el-card>
            </el-col>




          </el-card>
        </el-col>
        <el-col span="12">
          <el-card style="margin-left: 0.5%;margin-right: 1%;margin-top: 5px;height: 300px">
            <span style="font-size: x-large;font-weight: bold;color: #9a7fd1">数据暂留</span>
            <hr style="border:solid 0.5px rgb(233,233,233);margin-top: 5px"/>
            <el-row>
              <el-switch
                v-model="switch_flag2"
                active-text="启动修改"
                inactive-text="关闭修改"
                active-color="#9a7fd1"
                style="margin-left: 60%;margin-top: 3px"
              >
              </el-switch >
            </el-row>
            <card style="margin-top: 1%;margin-left: 1%;margin-right: 1%;height: 100px">
              <el-checkbox-group v-model="catsettings" v-bind:disabled="!this.switch_flag2">
                <el-row>
                  <el-col span="6">
                    <el-checkbox label="catname">
                      数据命名
                    </el-checkbox>
                  </el-col>
                  <el-col span="6">
                    <el-checkbox label="catcreatedate">
                      创建日期
                    </el-checkbox>
                  </el-col>
                  <el-col span="6">
                    <el-checkbox label="catfilesize">
                      文件大小
                    </el-checkbox>
                  </el-col>
                  <el-col span="6">
                    <el-checkbox label="catgsize">
                      图像尺寸
                    </el-checkbox>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col span="6">
                    <el-checkbox label="catfrom">
                      数据原身
                    </el-checkbox>
                  </el-col>
                  <el-col span="6">
                    <el-checkbox label="cat01">
                      备选项目
                    </el-checkbox>
                  </el-col>
                  <el-col span="6">
                    <el-checkbox label="dis02">
                      备选项目
                    </el-checkbox>
                  </el-col>
                  <el-col span="6">
                    <el-checkbox label="cat03">
                      扩展内容
                    </el-checkbox>
                  </el-col>
                </el-row>
              </el-checkbox-group>
              <row>
                <el-button type="primary" size="small" v-bind:disabled="!switch_flag2"
                           style="margin-left: 75%"
                >修改配置</el-button>
              </row>
            </card>
            <el-row>
              <el-col :span="18">
                <el-input type="textarea" style="margin-left: 2%;margin-top: 10px"
                          :autosize="{ minRows: 3, maxRows: 3}"
                          placeholder="选择文本规则"
                          v-bind:disabled="!switch_flag2"
                ></el-input>
              </el-col>
              <el-col :span="6">
                <el-button type="primary" size="small"
                           v-bind:disabled="!switch_flag2"
                           style="margin-left: 30%;margin-top: 25%">确定</el-button>
              </el-col>
            </el-row>
          </el-card>
        </el-col>
      </el-row>

      <el-row>
        <el-col span="12">
          <el-card style="margin-left: 1%;margin-right: 0.5%;margin-top: 5px;height: 380px">
            <span style="font-size: x-large;font-weight: bold;color: #97b552">数据补正</span>
            <hr style="border:solid 0.5px rgb(233,233,233);margin-top: 5px"/>
            <el-row>
              <el-switch
                v-model="switch_flag3"
                active-text="启动修改"
                inactive-text="关闭修改"
                active-color="#97b552"
                style="margin-left: 60%;margin-top: 3px"
              >
              </el-switch >
            </el-row>
            <card style="margin-top: 1%;margin-left: 1%;margin-right: 1%;height: 190px">
              <el-checkbox-group v-model="resettings" v-bind:disabled="!this.switch_flag3">
                <el-row>
                  <el-col span="5">
                    <el-checkbox label="rename"
                    style="margin-top: 2%"
                    >
                      数据命名
                    </el-checkbox>
                  </el-col>
                  <el-col span="7">
                    <el-input
                      size="mini"
                      style="width: 80%;"
                      v-bind:disabled="!resettings.includes('rename')">
                    </el-input>
                  </el-col>
                  <el-col span="5">
                    <el-checkbox label="refilesize"
                                 style="margin-top: 2%"
                    >
                      文件大小
                    </el-checkbox>
                  </el-col>
                  <el-col span="7">
                    <el-input
                      size="mini"
                      style="width: 80%;"
                      v-bind:disabled="!resettings.includes('refilesize')">
                    </el-input>
                  </el-col>
                </el-row>
                <el-row style="margin-top: 1%">
                  <el-col span="5">
                    <el-checkbox label="recreatedate"
                                 style="margin-top: 2%"
                    >
                      创建日期
                    </el-checkbox>
                  </el-col>
                  <el-col span="7">
                    <el-input
                      size="mini"
                      style="width: 80%;"
                      v-bind:disabled="!resettings.includes('recreatedate')">
                    </el-input>
                  </el-col>
                  <el-col span="5">
                    <el-checkbox label="regsize"
                                 style="margin-top: 2%"
                    >
                      图像尺寸
                    </el-checkbox>
                  </el-col>
                  <el-col span="7">
                    <el-input
                      size="mini"
                      style="width: 80%;"
                      v-bind:disabled="!resettings.includes('regsize')">
                    </el-input>
                  </el-col>
                </el-row>
                <el-row style="margin-top: 1%">
                  <el-col span="5">
                    <el-checkbox label="refrom"
                                 style="margin-top: 2%"
                    >
                      数据原身
                    </el-checkbox>
                  </el-col>
                  <el-col span="7">
                    <el-input
                      size="mini"
                      style="width: 80%;"
                      v-bind:disabled="!resettings.includes('refrom')">
                    </el-input>
                  </el-col>
                  <el-col span="5">
                    <el-checkbox label="re01"
                                 style="margin-top: 2%"
                    >
                      备选项目
                    </el-checkbox>
                  </el-col>
                  <el-col span="7">
                    <el-input
                      size="mini"
                      style="width: 80%;"
                      v-bind:disabled="!resettings.includes('re01')">
                    </el-input>
                  </el-col>
                </el-row>
                <el-row style="margin-top: 1%">
                  <el-col span="5">
                    <el-checkbox label="re02"
                                 style="margin-top: 2%"
                    >
                      备选项目
                    </el-checkbox>
                  </el-col>
                  <el-col span="7">
                    <el-input
                      size="mini"
                      style="width: 80%;"
                      v-bind:disabled="!resettings.includes('re02')">
                    </el-input>
                  </el-col>
                  <el-col span="5">
                    <el-checkbox label="re03"
                                 style="margin-top: 2%"
                    >
                      扩展内容
                    </el-checkbox>
                  </el-col>
                  <el-col span="7">
                    <el-input
                      size="mini"
                      style="width: 80%;"
                      v-bind:disabled="!resettings.includes('re03')">
                    </el-input>
                  </el-col>
                </el-row>
              </el-checkbox-group>
              <row>
                <el-button type="primary" size="small" v-bind:disabled="!switch_flag3"
                           style="margin-left: 75%;margin-top: 2%"
                           @click="test"
                >修改配置</el-button>
              </row>
            </card>
            <el-row>
              <el-col :span="18">
                <el-input type="textarea" style="margin-left: 2%;margin-top: 10px"
                          :autosize="{ minRows: 3, maxRows: 3}"
                          placeholder="选择文本规则"
                          v-bind:disabled="!switch_flag3"
                ></el-input>
              </el-col>
              <el-col :span="6">
                <el-button type="primary" size="small"
                           v-bind:disabled="!switch_flag3"
                           style="margin-left: 30%;margin-top: 25%">确定</el-button>
              </el-col>
            </el-row>
          </el-card>
        </el-col>
        <el-col span="12">
          <el-card style="margin-left: 0.5%;margin-right: 1%;margin-top: 5px;height: 380px">
            <span style="font-size: x-large;font-weight: bold;color: #f5994e">报警规则</span>
            <hr style="border:solid 0.5px rgb(233,233,233);margin-top: 5px"/>
            <el-row>
              <el-switch
                v-model="switch_flag4"
                active-text="启动修改"
                inactive-text="关闭修改"
                active-color="#f5994e"
                style="margin-left: 60%;margin-top: 3px"
              >
              </el-switch >
            </el-row>
            <card style="margin-top: 1%;margin-left: 1%;margin-right: 1%;height: 200px">
              <el-row>
                <span style="color: #c05050;font-weight: bold;font-size: medium">数据丢弃</span>

              </el-row>
              <el-row style="margin-top: 2%">
                <el-col span="8">巡检周期
                  <el-input size="mini" style="width: 50%" v-bind:disabled="!switch_flag4"></el-input>
                </el-col>
                <el-col span="8">
                  单位上限
                  <el-input size="mini" style="width: 50%" v-bind:disabled="!switch_flag4"></el-input>
                </el-col>
                <el-col span="8">
                  总体上限
                  <el-input size="mini" style="width: 50%" v-bind:disabled="!switch_flag4"></el-input>
                </el-col>
              </el-row>
              <hr style="border:solid 0.5px rgb(233,233,233);margin-top: 2%"/>
              <el-row style="margin-top: 1%">
                <span style="color: #9a7fd1;font-weight: bold;font-size: medium">数据暂存</span>
              </el-row>
              <el-row style="margin-top: 2%">
                <el-col span="8">巡检周期
                  <el-input size="mini" style="width: 50%" v-bind:disabled="!switch_flag4"></el-input>
                </el-col>
                <el-col span="8">
                  单位上限
                  <el-input size="mini" style="width: 50%" v-bind:disabled="!switch_flag4"></el-input>
                </el-col>
                <el-col span="8">
                  总体上限
                  <el-input size="mini" style="width: 50%" v-bind:disabled="!switch_flag4"></el-input>
                </el-col>
              </el-row>
              <row>
                <el-button type="primary" size="small" v-bind:disabled="!switch_flag4"
                           style="margin-top: 1%"
                >修改配置</el-button>
              </row>
            </card>
            <el-row>
              <el-col :span="18">
                <el-input type="textarea" style="margin-left: 2%;margin-top: 10px"
                          :autosize="{ minRows: 3, maxRows: 3}"
                          placeholder="选择文本规则"
                          v-bind:disabled="!switch_flag4"
                ></el-input>
              </el-col>
              <el-col :span="6">
                <el-button type="primary" size="small"
                           v-bind:disabled="!switch_flag4"
                           style="margin-left: 30%;margin-top: 25%">确定</el-button>
              </el-col>
            </el-row>
          </el-card>
        </el-col>
      </el-row>
    </div>
</template>

<script>
    export default {
        name: "datamanage",
      data(){
          return{
            dissettings:["disname",],
            catsettings:["catcreatedate","catfrom",],
            resettings:["disname",],
            switch_flag1:false,
            switch_flag2:false,
            switch_flag3:false,
            switch_flag4:false,
            dis_intime:7,
            dis_time:"day",
            dis_times:[
              {
                value: "hour",
                label: "时"
              },
              {
                value: "day",
                label: "天"
              },
              {
                value: "month",
                label: "月"
              },
            ],
          };
      },
      methods:{
          test(){
            this.$message({
              type: "success",
              message: "修改成功!"+this.dissettings.includes('disname')
            });
          }
      }
    }
</script>

<style scoped>

</style>
