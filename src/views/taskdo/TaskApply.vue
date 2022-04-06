<template>
    <div>
        <el-breadcrumb class="bread" separator="/">
                    <el-breadcrumb-item><i class="el-icon-menu"></i>任务管理</el-breadcrumb-item>
                    <el-breadcrumb-item>任务部署</el-breadcrumb-item>
        </el-breadcrumb>
        <el-menu :default-active="activeindex" class="el-menu-demo" mode="horizontal" @select="handleSelect">
         <el-menu-item index="1" @click="toagentapply">agent部署</el-menu-item>
         <el-menu-item index="2" @click="tomysqlapply">数据库部署</el-menu-item>
         <el-menu-item index="3" @click="tonetflowapply">流量控制部署</el-menu-item>
        </el-menu>
        <router-view></router-view>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                activeindex:"1"
            }
        },methods: {
            toagentapply() {
                this.$router.push("/main/taskapply/agentapply")
            },
            tomysqlapply(){
                this.$router.push("/main/taskapply/mysqlapply")
            },
            tonetflowapply(){
                this.$router.push("/main/taskapply/netflowapply")
            },
            handleSelect(){
                 console.log(key, keyPath);
            }

        },
    }
</script>

<style scoped>
.bread{
    margin-bottom: 20px;
}
</style>