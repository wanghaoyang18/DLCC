<template>
    <div>
        <el-breadcrumb class="bread" separator="/">
                    <el-breadcrumb-item><i class="el-icon-menu"></i>服务器管理</el-breadcrumb-item>
                    <el-breadcrumb-item>主机组</el-breadcrumb-item>
        </el-breadcrumb>
        <el-card style="margin:20px">
             <h2 style="color: #d15e10;">
                    <span>主机名称:{{this.$route.query.hostname}}</span> /
                    <span>主机ID: {{this.$route.query.hostid}}</span>
            </h2>
        </el-card>

        <el-card style="margin:20px">
            <el-row>
                <el-col :span="7">天数: 
                        <el-select v-model="day" placeholder="请选择">
                            <el-option
                            v-for="item in dayoptions"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                            </el-option>
                        </el-select>
                </el-col>
                <el-col :span="7">小时: 
                     <el-select v-model="hour" placeholder="请选择">
                            <el-option
                            v-for="item in houroptions"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                            </el-option>
                        </el-select>
                </el-col>
                <el-col :span="7">分钟: 
                     <el-select v-model="minute" placeholder="请选择">
                            <el-option
                            v-for="item in options"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                            </el-option>
                        </el-select>
                </el-col>
                <el-col :span="3">
                    <el-button type="primary" @click="remakepic">确定查询</el-button>
                    
                </el-col>
            </el-row>
            
        </el-card>

        <el-row :gutter="20">
          <el-col :span="12">  <cpu v-bind:hostid="this.$route.query.hostid" ref="cpu"></cpu> </el-col>
          <el-col :span="12"><disk v-bind:hostid="this.$route.query.hostid" ref="disk"></disk></el-col>
        </el-row>
      
       <el-row :gutter="20">
          <el-col :span="12"> <memory v-bind:hostid="this.$route.query.hostid" ref="memory"></memory> </el-col>
        </el-row>
        
           
       
        
        
    </div>
</template>

<script>
import cpu from "../../components/cpu";
import disk from "../../components/disk";
import memory from "../../components/memory";
import Axios from "axios";
export default {
  data() {
    return {
      day: 0,
      hour: 0,
      minute: 10,
       dayoptions: [
        {
          value: 0,
          label: "0"
        },
        {
          value: 1,
          label: "1"
        },
        {
          value: 2,
          label: "2"
        },
        {
          value: 3,
          label: "3"
        },
        {
          value: 5,
          label: "5"
        },
        {
          value: 12,
          label: "12"
        },
        {
          value: 15,
          label: "15"
        },
        {
          value: 18,
          label: "18"
        },
        {
          value: 20,
          label: "20"
        },
         {
          value: 24,
          label: "24"
        }],
       houroptions: [
        {
          value: 0,
          label: "0"
        },
        {
          value: 1,
          label: "1"
        },
        {
          value: 2,
          label: "2"
        },
        {
          value: 3,
          label: "3"
        },
        {
          value: 5,
          label: "5"
        },
        {
          value: 12,
          label: "12"
        },
        {
          value: 15,
          label: "15"
        },
        {
          value: 18,
          label: "18"
        },
        {
          value: 20,
          label: "20"
        },
         {
          value: 24,
          label: "24"
        }
      ],
      options: [
        {
          value: 10,
          label: "10"
        },
        {
          value: 20,
          label: "20"
        },
        {
          value: 30,
          label: "30"
        },
        {
          value: 40,
          label: "40"
        },
        {
          value: 50,
          label: "50"
        },
        {
          value: 60,
          label: "60"
        },
      ]
    };
  },
  components: {
    cpu,
    memory,
    disk
  },
  methods: {
      remakepic(){
          this.updatedata()
      },
    updatedata() {
      this.$refs.disk.updateData(this.day,this.hour,this.minute);
      this.$refs.cpu.updateData(this.day,this.hour,this.minute);
      
      this.$refs.memory.updateData(this.day,this.hour,this.minute);
    }
  },
  mounted() {
    //  this.clock();
  }
};
</script>

<style scoped>
.circle {
  display: inline-block;
  width: 200px;
  height: 200px;
  border: 5px solid;
  border-radius: 50%;
  margin: 20px 20px;
  text-decoration: none;
}
.font-host {
  text-align: center;
  margin-top: 60px;
  color: black;
  font-size: 25px;
}
.font-describe {
  text-align: center;
  line-height: 60px;
  color: black;
}
.yellow {
  border-color: yellow;
}
.blue {
  border-color: blue;
}
.red {
  border-color: red;
}
.bread {
  margin-bottom: 20px;
}
</style>