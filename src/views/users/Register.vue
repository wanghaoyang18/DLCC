<template>
  <div class="background">
    <div class="registp">
      <el-row>
        <el-col :span="24"  style="text-align:center;padding-top:100px;font-size:70px;color:#409EFF">
          <span style="font-style: revert">DMS</span>
        </el-col>
      </el-row>
      <el-row style="text-align: center">
        <span style="color: #eeeeee;font-size: medium">用户名：</span>
        <el-input placeholder="请输入用户名" style="width: 300px;margin-top: 8px;margin-right: 60px" size="medium"></el-input>
      </el-row>
      <el-row style="text-align: center">
        <span style="color: #eeeeee;font-size: medium">密 码：</span>
        <el-input placeholder="请输入密码" style="width: 300px;margin-top: 8px;margin-left: 10px;margin-right: 60px" size="medium"></el-input>
      </el-row>
      <el-row style="text-align: center">
        <span style="color: #eeeeee;font-size: medium">密 码：</span>
        <el-input placeholder="请确认密码" style="width: 300px;margin-top: 8px;margin-left: 10px;margin-right: 60px" size="medium"></el-input>
      </el-row>
      <el-row style="text-align: center">
        <span style="color: #eeeeee;font-size: medium">授权码：</span>
        <el-input placeholder="请输入授权码" style="width: 300px;margin-top: 8px;margin-right: 60px" size="medium"></el-input>
      </el-row>
      <el-row style="text-align: center;margin-top: 10px">
        <el-button type="primary" style="margin-right: 20px"> 注册</el-button>
        <el-button type="success" style="margin-left: 20px"> 登录</el-button>
      </el-row>
    </div>
  </div>

</template>

<script>
    export default {
        data() {
            return {
                username: "秦羽根",
                radio:"male",
                birthday:""
            }
        }, methods: {
        back() {
          this.$router.push({path:"/login"})

        }
      },
    }
</script>

<style scoped>

  .background{
    height: 800px;
    width: 100%;
  }
  .registp{

    height:100%;
    width:100%;
    background-size: 100% 100%;
    background: url('../../result/regist_back_r.jpg') no-repeat;
  }
</style>
