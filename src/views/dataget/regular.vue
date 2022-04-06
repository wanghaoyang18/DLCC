<template>
    <div>
      <el-breadcrumb separator="/" style="margin:20px">
        <el-breadcrumb-item><i class="el-icon-menu"></i>数据查取</el-breadcrumb-item>
        <el-breadcrumb-item>常规查取</el-breadcrumb-item>
      </el-breadcrumb>

      <el-card style="margin-left: 0.5%;margin-right: 0.5%;margin-bottom: 0.5%">
        <el-row>
          <el-col span="4">
            <span style="font-size: medium;color: #409EFF;">全文查找</span>
          </el-col>
          <el-col span="20">
            <el-input placeholder="输入关键字" style="width: 50%;margin-left: 13%">
              <el-button slot="append" icon="el-icon-search"></el-button>
            </el-input>
          </el-col>
        </el-row>
      </el-card>

      <el-card style="margin-left: 0.5%;margin-right: 0.5%">
        <el-row :gutter="50">
          <el-col :span="8">
            <span class="filter_span">开始日期</span>
            <el-date-picker
              v-model="startDate"
              type="date"
              placeholder="选择日期"
              style="width:60%">
            </el-date-picker>
          </el-col>
          <el-col :span="8">
            <span class="filter_span">结束日期</span>
            <el-date-picker
              v-model="endDate"
              type="date"
              placeholder="选择日期"
              style="width:60%">
            </el-date-picker>
          </el-col>
          <el-col :span="8">
            <span class="filter_span">分类选择</span>
            <el-select placeholder="请选择" v-model="select01" style="width: 60%">
              <el-option label="aa" value="1"></el-option>
              <el-option label="aa"></el-option>
              <el-option label="aa"></el-option>
            </el-select>
          </el-col>
        </el-row>
        <el-row :gutter="50" style="margin-top: 1%">
          <el-col :span="8">
            <span class="filter_span">开始日期</span>
            <el-date-picker
              v-model="startDate"
              type="date"
              placeholder="选择日期"
              style="width:60%">
            </el-date-picker>
          </el-col>
          <el-col :span="8">
            <span class="filter_span">结束日期</span>
            <el-date-picker
              v-model="endDate"
              type="date"
              placeholder="选择日期"
              style="width:60%">
            </el-date-picker>
          </el-col>
          <el-col :span="8">
            <span class="filter_span">分类选择</span>
            <el-select v-model="opclass" placeholder="请选择" style="width: 60%">
              <el-option
                v-for="item in opclasses"
                :key="item.value"
                :label="item.label"
                :value="item.value"
              ></el-option>
            </el-select>
          </el-col>
        </el-row>
        <el-button type="primary" style="margin-left: 80%;margin-top: 1%;margin-bottom: -1%">查询</el-button>

      </el-card>

      <el-card style="margin-left: 0.5%;margin-right: 0.5%;margin-top: 15px">
        <el-card><span style="color: #9a7fd1;font-size: 20px;font-weight: 800;">查询结果</span>


        </el-card>
        <el-table
          :data="table_data"
          stripe
          style="width: 100%"
          :default-sort = "{prop: 'date', order: 'descending'}"
        >
          <el-table-column
            prop="date"
            label="收录日期"
            sortable
            width="180">
          </el-table-column>
          <el-table-column
            prop="name"
            label="名称"
            width="180">
          </el-table-column>
          <el-table-column
            prop="state"
            label="状态"
            width="180">
          </el-table-column>
          <el-table-column
            prop="mclass"
            label="类别"
            width="180">
          </el-table-column>
          <el-table-column label="图片" >
            <template slot-scope="scope">
              <img :src="scope.row.url" style="height: 30px;width: 30px">
            </template>
          </el-table-column>
          <el-table-column label="操作" >
            <template slot-scope="scope">
              <el-button type="success" size="small" @click="getloginfo(scope.$index, scope.row)">操作</el-button>
<!--              <el-button type="warning" size="small"  @click="deluser(scope.$index,scope.row)">移除</el-button>-->
            </template>
          </el-table-column>
        </el-table>
      </el-card>
    </div>
</template>

<script>
    export default {
        name: "fulltext",
      data(){
          return{
            test:{"url":"https://www.easyicon.net/api/resizeApi.php?id=1309567&size=96"},
            select01:'1',
            table_data:[{
          date: '2016-05-02',
          name: 'adhajbd',
              url:'https://www.easyicon.net/api/resizeApi.php?id=1309567&size=96',
        }, {
          date: '2016-05-04',
          name: 'og156sd',
              url:'https://www.easyicon.net/api/resizeApi.php?id=1309567&size=96',
        }, {
          date: '2016-05-01',
          name: 'db78-23',
          url:'https://www.easyicon.net/api/resizeApi.php?id=1309567&size=96',
        }, {
          date: '2016-05-03',
          name: 'rid2016-0as',
              url:'https://www.easyicon.net/api/resizeApi.php?id=1309567&size=96',
        },{
          date: '2016-05-01',
          name: 'og-1615',
              url:'https://www.easyicon.net/api/resizeApi.php?id=1309567&size=96',
        },],
          }
      }
    }
</script>

<style scoped>

</style>
