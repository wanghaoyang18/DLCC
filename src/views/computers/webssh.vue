<template>
    <div>
        <el-breadcrumb separator="/">
            <el-breadcrumb-item><i class="el-icon-menu"></i>服务器管理</el-breadcrumb-item>
            <el-breadcrumb-item>远程登录</el-breadcrumb-item>
        </el-breadcrumb>  
        <el-row style="margin-top:50px">
          <el-col :span="2"> <span class="font">主机IP</span></el-col>
          <el-col :span="9"> <el-input v-model="hostname" placeholder=""></el-input></el-col>
        </el-row>
        <el-row style="margin-top:50px">
          <el-col :span="2"> <span class="font">用户名</span></el-col>
          <el-col :span="9"> <el-input v-model="username" placeholder=""></el-input></el-col>
        </el-row>
        <el-row style="margin-top:50px">
          <el-col :span="2"> <span class="font">端口</span></el-col>
          <el-col :span="9"> <el-input v-model="port" placeholder=""></el-input></el-col>
        </el-row>
        <el-row style="margin-top:50px">
          <el-col :span="2"> <span class="font">密码</span></el-col>
          <el-col :span="9"> <el-input v-model="password" placeholder=""></el-input></el-col>
        </el-row>
         <el-row style="margin-top:50px">
            <el-col :span="9" :offset="5" > <el-button type="primary" style="width:100px" @click="login">登录</el-button></el-col>
         </el-row>

    </div>
</template>

<script>
import axios from 'axios'
   
export default {
  data() {
    return {
      hostname: "192.168.182.129",
      username: "hadoop",
      port: "22",
      password: "123456"
    };
  },
  methods: {
    login() {
      var that = this.$router;
      axios
        .get("http://192.168.100.141:9000/", {
          params: {
            hostname: this.hostname,
            username: this.username,
            port: this.port,
            password: this.password
          }
        })
        .then(function(response) {
          var importid = response.data.id;
          console.log(importid)
          that.push({ path: "/mywebssh", query: { sid: importid } });
          
        })
        .catch(function(error) {
          console.log(error);
        });
    }
  }
};
</script>

<style scoped>
.font {
  font-size: 17px;
  margin-left: 10px;
}
</style>