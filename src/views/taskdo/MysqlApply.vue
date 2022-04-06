<template>
    <div class="form-box">
      <el-form ref="form" :model="form" label-width="80px" >
        <el-form-item label="主机名">
          <el-select v-model="form.hosts" placeholder="请选择" style="width:500px">
           <el-option
              v-for="item in options"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
           </el-select>
        </el-form-item>
        <el-form-item label="登陆方式">
            <el-radio-group v-model="logintype">
                <el-radio label="密码登陆"></el-radio>
                <el-radio label="私钥登陆（已配置好公钥）"></el-radio>
             </el-radio-group>
        </el-form-item>
            <el-form-item label="主机密码" >
                <el-input v-model="form.password"  v-bind:disabled="logintype!='密码登陆'"></el-input>
            </el-form-item>
             <el-form-item label="mysql账号" >
                <el-input v-model="form.mysqluser"  v-bind:disabled="logintype!='密码登陆'"></el-input>
            </el-form-item>
             <el-form-item label="mysql密码" >
                <el-input v-model="form.mysqlpassword" type="password" v-bind:disabled="logintype!='密码登陆'"></el-input>
            </el-form-item>
            <el-form-item>
                    <el-button type="primary" @click="onSubmit">提交</el-button>
                    <el-button>取消</el-button>
                </el-form-item>
      </el-form>
      
    </div>
</template>

<script>
export default {
  data() {
    return {
        form:{
            hosts:"",
            password:"",
            mysqluser:"root",
            mysqlpassword:""
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
        }
      ],
      logintype:"密码登陆"
    };
  }
};
</script>

<style scoped>
.form-box{
    margin-top: 20px;
    width: 600px;
}
</style>