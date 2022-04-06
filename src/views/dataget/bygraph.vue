<template>
    <div>
      <el-breadcrumb separator="/" style="margin:20px">
        <el-breadcrumb-item><i class="el-icon-menu"></i>数据查取</el-breadcrumb-item>
        <el-breadcrumb-item>图像索引</el-breadcrumb-item>
      </el-breadcrumb>
<!--      <img :src="this.test.url">-->


      <el-card style="margin-left: 0.5%;margin-right: 0.5%">
        <el-row >
          <input type="file" style="margin-left: 5%" ref="files1" @change="showpic"  id="id_face_file"></input>
          <el-button type="primary" style="margin-left: 50%" @click="test">匹配查找</el-button>
        </el-row>
<!--        <el-row>-->
<!--          <input id="id_face_file" @change="uploadFile1" ref="files1" type="file">-->
<!--          <img id="showIdFaceSrc" :src="src1" alt="">-->
<!--        </el-row>-->
        <el-card shadow="never" style="margin-top: 5px">
          <el-row>
            <el-col span="8">
              <img  :src="src1" alt="" style="margin-left: 14%;height: 120px;">
            </el-col>
            <el-col span="16">
              <el-row style="margin-top: 20px">
                <el-col span="12">
<!--                  <el-checkbox v-model="check1">-->
<!--                    类别筛选-->
<!--                  </el-checkbox>-->
                  <span style="font-size: small;" >筛选</span>
                  <el-select placeholder="请选择" v-model="select" style="width: 60px" size="small">
                    <el-option label="all" value="1"></el-option>
                    <el-option label="aa" value="2"></el-option>
                    <el-option label="aa" value="3"></el-option>
                  </el-select>

                </el-col>
                <el-col span="12">
                  <el-checkbox label="discreatedate">
                    启用yolo
                  </el-checkbox>
                </el-col>
              </el-row>
              <el-row style="margin-top: 20px">
                <el-col span="12">
                  <el-checkbox label="disname">
                    关系创建
                  </el-checkbox>
                </el-col>
                <el-col span="12">
                  <el-checkbox label="discreatedate">
                    数据保存
                  </el-checkbox>
                </el-col>
              </el-row>
            </el-col>

          </el-row>
        </el-card>

      </el-card>
<!--      <el-card style="margin-left: 0.5%;margin-right: 0.5%">-->
<!--        <el-row >-->
<!--          <input type="file" style="margin-left: 5%"></input>-->
<!--          <el-button type="primary" style="margin-left: 50%" @click="test()">匹配查找</el-button>-->
<!--        </el-row>-->
<!--      </el-card>-->
      <el-card style="margin-left: 0.5%;margin-right: 0.5%;margin-top: 15px">
        <el-card><span style="color: #9a7fd1;font-size: 20px;font-weight: 800;">查询结果</span>
<!--          <el-button type="primary" style="margin-left: 80%">确定</el-button>-->

        </el-card>
        <el-table
          :data="table_data"
          stripe
          style="width: 100%"
          :default-sort = "{prop: 'similar', order: 'descending'}"
        >
          <el-table-column
            prop="similar"
            label="相似度"
            sortable
            width="160">
          </el-table-column>
          <el-table-column
            prop="name"
            label="名称"
            width="160">
          </el-table-column>
          <el-table-column
            prop="date"
            label="日期"
            width="180">
          </el-table-column>
          <el-table-column
            prop="mclass"
            label="类别"
            width="160">
          </el-table-column>
          <el-table-column label="预览图" >
            <template slot-scope="scope">
              <img :src="scope.row.url" style="height: 50px;">
            </template>
          </el-table-column>
          <el-table-column label="操作" >
            <template slot-scope="scope">
              <el-button type="success" size="small" @click="getloginfo(scope.$index, scope.row)">详情</el-button>
<!--              <el-button type="warning" size="small"  @click="deluser(scope.$index,scope.row)">移除</el-button>-->
              <el-button type="primary" size="small" icon="el-icon-share">图谱</el-button>
            </template>
          </el-table-column>
        </el-table>
      </el-card>

    </div>
</template>

<script>
  import url001 from "../../result/变亮.png";
  import url000 from "../../result/og_190811gq_t.png";
    export default {

      data(){
          return{
            tempImg:'',
            select:1,
            url001:"../assets/proxy.png",
            src1:'https://www.easyicon.net/api/resizeApi.php?id=1183438&size=128',
            test:{"name":"test",
            "url":"https://www.easyicon.net/api/resizeApi.php?id=1311353&size=96"},
            table_data:[
              {
                similar:0.9586,
                date: '2016-05-02',
                name: 'adhajbd',
                url:'https://img-blog.csdnimg.cn/2020061916564253.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3l1bmZlbmdmZW5nZmVuZw==,size_16,color_FFFFFF,t_70',
              }, {
                similar:1.0000,
                date: '2021-01-04',
                name: 'og_190811gq_t',
                mclass:'pipe_img',
                url:url000,
              }, {
                similar:0.9844,
                date: '2021-01-04',
                name: 'tg_190811gq_lt',
                mclass:'test_light',
                url:url001,
              }, {
                similar:0.9776,
                date: '2016-05-03',
                name: 'rid2016-0as',
                url:'https://www.easyicon.net/api/resizeApi.php?id=1309567&size=96',
              },{
                similar:0.8586,
                date: '2016-05-01',
                name: 'og-1615',
                url:'https://www.easyicon.net/api/resizeApi.php?id=1309567&size=96',
              },
            ],
          }
      },
      methods:{
        test(){

        },

        // 选择文件
        showpic(e) {
          let _this = this;
          // console.log(e.target.files[0])
          let reader = new FileReader()
          reader.readAsDataURL(e.target.files[0]) // 这里是最关键的一步，转换就在这里 （参数必须是blob对象）
          reader.onloadend = function () {
            _this.src1 = this.result
          }
        },
        uploadFile1(e){
          let _this = this;
          // console.log(e.target.files[0])
          let reader = new FileReader()
          reader.readAsDataURL(e.target.files[0]) // 这里是最关键的一步，转换就在这里 （参数必须是blob对象）
          reader.onloadend = function () {
            _this.src1 = this.result
          }
        },
      }
    }
</script>

<style scoped>

</style>
