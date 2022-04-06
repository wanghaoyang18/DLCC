<template>
    <div>
        <el-breadcrumb class="bread" separator="/">
                    <el-breadcrumb-item><i class="el-icon-menu"></i>任务管理</el-breadcrumb-item>
                    <el-breadcrumb-item>简单任务</el-breadcrumb-item>
        </el-breadcrumb>
        <el-menu :default-active="activeindex" class="el-menu-demo" mode="horizontal" @select="handleSelect">
         <el-menu-item index="1" @click="toadhoc">命令模式</el-menu-item>
         <el-menu-item index="2" @click="toplaybook">剧本模式</el-menu-item>
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
            toadhoc() {
                this.$router.push("/main/ansibletask/adhoc")
            },
            toplaybook(){
                this.$router.push("/main/ansibletask/playbook")
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