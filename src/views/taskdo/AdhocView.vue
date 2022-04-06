<template>
<el-form ref="form" :model="form" label-width="80px" style="margin-top:20px">
  <el-form-item label="主机名">
    <el-select v-model="hosts" multiple placeholder="请选择" style="width:500px">
    <el-option
      v-for="item in options"
      :key="item.value"
      :label="item.label"
      :value="item.value">
    </el-option>
  </el-select>
  </el-form-item>
<el-form-item label="主机组">
    <el-select v-model="hostgroup"  placeholder="请选择" style="width:500px">
    <el-option
      v-for="item in groups"
      :key="item.value"
      :label="item.label"
      :value="item.value">
    </el-option>
  </el-select>
  </el-form-item >
  <el-form-item label="命令">
        <el-input
        type="textarea"
        :autosize="{ minRows: 4, maxRows: 5}"
        placeholder="请输入命令如 ls -l"
        v-model="command"
        style="width:500px">
</el-input>
 </el-form-item>
  <el-form-item>
    <el-button type="primary" @click="onSubmit">立即执行</el-button>
    <el-button>重置</el-button>
  </el-form-item>
  <!-- <hr class="line" /> -->
  <el-form-item class="result" label="结果">
      <el-input
        type="textarea"
        :autosize="{ minRows: 10, maxRows: 20}"
        placeholder="输出结果"
        v-model="result"
        style="width:700px">
</el-input>
    
  </el-form-item>
</el-form>
</template>

<script>
export default {
  data() {
    return {
      form: {
        name: "",
        region: "",
        date1: "",
        date2: "",
        delivery: false,
        type: [],
        resource: "",
        desc: ""
      },
      options: [
        {
          value: "10084",
          label: "Zabbix server"
        },
        {
          value: "10254",
          label: "UbuntuNode1"
        },
        {
          value: "10255",
          label: "UbuntuNode2"
        },
    
      ],
      groups:[{
         label:"Zabbix servers",
         value:"Zabbix servers"
      },{
          label:"Linux servers",
         value:"Linux servers"
      }],
      hosts: "",
      hostgroup:"",
      command:"",
    };
  },

  methods: {
    onSubmit() {
      console.log("submit!");
    }
  }
};
</script>

<style scoped>

</style>