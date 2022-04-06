<template>
    <div>
      <el-breadcrumb separator="/" style="margin:20px">
        <el-breadcrumb-item><i class="el-icon-menu"></i>数据注入</el-breadcrumb-item>
        <el-breadcrumb-item>人工操作</el-breadcrumb-item>
      </el-breadcrumb>

      <el-card style="margin-left: 0.5%;margin-right: 0.5%">
        <el-row :gutter="50">
          <el-col :span="7">
            <span class="filter_span">开始日期</span>
            <el-date-picker
              v-model="startDate"
              type="date"
              placeholder="选择日期"
              style="width:70%">
            </el-date-picker>
          </el-col>
          <el-col :span="7">
            <span class="filter_span">结束日期</span>
            <el-date-picker
              v-model="endDate"
              type="date"
              placeholder="选择日期"
              style="width:70%">
            </el-date-picker>
          </el-col>
          <el-col :span="7">
            <span class="filter_span">分类选择</span>
            <el-select v-model="opclass" placeholder="请选择" style="width: 70%">
              <el-option
                v-for="item in opclasses"
                :key="item.value"
                :label="item.label"
                :value="item.value"
              ></el-option>
            </el-select>
          </el-col>
          <el-col :span="3">
            <el-button type="primary" style="margin-left: 20%">确定</el-button>
          </el-col>
        </el-row>
      </el-card>

      <el-card style="margin-left: 0.5%;margin-right: 0.5%;margin-top: 15px">
        <el-card><span style="color: #9a7fd1;font-size: 20px;font-weight: 800;">查询结果</span></el-card>
        <el-table
          :data="tableData"
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
          <el-table-column
            prop="way"
            label="录入方式"
            :formatter="formatter">
          </el-table-column>
          <el-table-column label="操作" >
            <template slot-scope="scope">
              <el-button type="success" size="small" @click="getloginfo(scope.$index, scope.row)">详情</el-button>
              <el-button type="warning" size="small"  @click="deluser(scope.$index,scope.row)">移动</el-button>
            </template>
          </el-table-column>
        </el-table>
      </el-card>
    </div>
</template>

<script>
  export default {
    data(){
      return{
        opclass:"all",
        startDate:"2020-11-07",
        endDate:"2020-11-21",
        opclasses:[
          {
            value: "all",
            label: "所有"
          },
          {
            value: "dis",
            label: "丢弃数据"
          },
          {
            value: "wait",
            label: "暂留数据"
          },
        ],

        tableData:[{
          date: '2020-11-21',
          name: '191106Gb_p_1',
          state:'丢弃',
          mclass:'视频数据',
          way:'by auto',
        }, {
          date: '2020-11-21',
          name: '191106Gb_p_3',
          state:'暂留',
          mclass:'视频数据',
          way:'by admin',
        }, {
          date: '2020-11-21',
          name: 'og_200624ya',
          state:'暂留',
          mclass:'图像数据',
          way:'by admin',
        }, {
          date: '2020-11-21',
          name: 'qh_ob_126',
          state:'暂留',
          mclass:'图像数据',
          way:'by admin',
        },{
          date: '2020-11-19',
          name: '',
          state:'丢弃',
          mclass:'图像数据',
          way:'by admin',
        },{
          date: '2020-11-19',
          name: 'test',
          state:'丢弃',
          mclass:'点云数据',
          way:'by auto',
        },
        ],

      };
    },
    methods:{

    }
  }
</script>

<style scoped>

</style>
