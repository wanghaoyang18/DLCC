<template>
      <div class="form-box">
            <el-form ref="form" :model="form" label-width="80px">
                <el-form-item label="主机名">
                    <el-input v-model="form.hostname"></el-input>
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
                <el-form-item label="主机组">
                    <el-select v-model="form.group" placeholder="请选择">
                        <el-option v-for="item in group" :key="item.groupid" :label="item.name" :value="item.groupid"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="主机Host">
                    <el-input v-model="form.host"></el-input>
                </el-form-item>
                <el-form-item label="主机IP">
                    <el-input v-model="form.ip"></el-input>
                </el-form-item>
                <el-form-item label="模板">
                    <el-select v-model="form.template" placeholder="请选择" >
                        <el-option v-for="item in templates" 
                        :key="item.templateid" 
                        :label="item.name" 
                        :value="item.templateid">
                        </el-option>
                    </el-select>
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
                  form: {
                    hostname: '',
                    group: '',
                    host: '',
                    ip: '0.0.0.0',
                    template: '',
                    password:''
                },
                group:[],
                templates:[],
                logintype:"密码登陆",//true表示密码登陆，false表示ansible登陆
                
            }
        },methods: {
            onSubmit() {
                
            }
        },
    }
</script>

<style scoped>
.form-box{
    width: 600px;
    margin-top: 20px;   
}
</style>