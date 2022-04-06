<template>
    <div>
            <!-- 面包屑 -->
            <el-breadcrumb class="bread" separator="/">
                        <el-breadcrumb-item><i class="el-icon-menu"></i>代理服务</el-breadcrumb-item>
                        <el-breadcrumb-item>代理服务配置</el-breadcrumb-item>
            </el-breadcrumb>
      <el-tabs v-model="activeName" type="card" @tab-click="handleClick()">
        <el-tab-pane label="args_Filter" name="first"></el-tab-pane>
        <el-tab-pane label="UserAgent_Filter" name="second"></el-tab-pane>
        <el-tab-pane label="file_Filter" name="third"></el-tab-pane>
        <el-tab-pane label="post_Filter" name="fourth"></el-tab-pane>
        <el-tab-pane label="cookie_Filter" name="fifth"></el-tab-pane>
        <el-tab-pane label="ccnetwork_Filter" name="sixth"></el-tab-pane>
      </el-tabs>
      <router-view > </router-view>
    </div>  
</template>

<script>
    export default {
      data() {
        return {
          activeName: 'first'
        }
      },
      methods: {

        handleClick() {
          if(this.activeName=="first"){
            this.$router.push({path:"/main/setproxy/argsfilter" });
          }
          if(this.activeName=="second"){
            this.$router.push({path:"/main/setproxy/useragentfilter" });
          }
          if(this.activeName=="third"){
            this.$router.push({path:"/main/setproxy/filefilter" });
          }
          if(this.activeName=="fourth"){
            this.$router.push({path:"/main/setproxy/postfilter" });
          }
          if(this.activeName=="fifth"){
            this.$router.push({path:"/main/setproxy/cookiefilter" });
          }
          if(this.activeName=="sixth"){
            this.$router.push({path:"/main/setproxy/ccfilter" });
          }


        }
      },
      mounted(){

      }
    }
</script>

<style scoped>
.bread {
  margin-bottom: 20px;
}
</style>
