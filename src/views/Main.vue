
<template>
<el-container>
  <el-aside width="250px"  >
 
    <el-menu
      class="el-menu-t"
      unique-opened
      default-active="1-1"
      @open="menu_handleOpen"
      @close="menu_handleClose"
       background-color="#588dd5"
      text-color="#fff"
      active-text-color="#f5994e"
      v-bind:style="{  width:'250px'}"
      
      >
<!--      background-color="#304156"-->
        <div class="title" >
          <span style="color:yellow;font-size: medium;margin-top: 50px">Dmsys for pipeline</span>
        </div>

      <el-submenu  index="1" >
        <template slot="title">
          <div class="nav-icon icon-computer"></div>
          <span>数据统计分析</span>
        </template>
        <el-menu-item-group>

          <el-menu-item index="1-1" @click="toDatavolume">数据存储状态</el-menu-item>
          <el-menu-item index="1-2" @click="toDatainjection">注入日志分析</el-menu-item>

          <!--          <el-menu-item index="1-4" @click="towebssh">远程登录</el-menu-item>-->
        </el-menu-item-group>
      </el-submenu>

      <el-submenu  index="2" >
        <template slot="title">
          <div class="nav-icon icon-computer"></div>
          <span>数据注入</span>
        </template>
        <el-menu-item-group>

          <el-menu-item index="2-1" @click="toDataupload">数据上传</el-menu-item>
          <el-menu-item index="2-2" @click="toDatamanage">规则设置</el-menu-item>

          <el-menu-item index="4-2" @click="toManualop">人工操作</el-menu-item>
          <!--          <el-menu-item index="1-4" @click="towebssh">远程登录</el-menu-item>-->
        </el-menu-item-group>
      </el-submenu>

      <el-submenu  index="3" >
        <template slot="title">
          <div class="nav-icon icon-computer"></div>
          <span>关系图谱</span>
        </template>
        <el-menu-item-group>

          <el-menu-item index="3-1" @click="toDatagraph">关系图谱</el-menu-item>
          <el-menu-item index="3-2" @click="toEventKG">风险评估</el-menu-item>

        </el-menu-item-group>
      </el-submenu>

      <el-submenu  index="4" >
        <template slot="title">
          <div class="nav-icon icon-computer"></div>
          <span>数据内容检索</span>
        </template>
        <el-menu-item-group>

          <el-menu-item index="4-1" @click="toRegular">常规查取</el-menu-item>
          <el-menu-item index="4-2" @click="toGraphget">图像索引</el-menu-item>

        </el-menu-item-group>
      </el-submenu>

<!--      <el-submenu  index="4" >-->
<!--        <template slot="title">-->
<!--          <div class="nav-icon icon-computer"></div>-->
<!--          <span>数据管理</span>-->
<!--        </template>-->
<!--        <el-menu-item-group>-->


<!--          -->

<!--        </el-menu-item-group>-->
<!--      </el-submenu>-->

      <!-- 服务器信息管理 -->

      <el-submenu  index="5" >
        <template slot="title">
          <div class="nav-icon icon-computer"></div>
          <span>系统监管</span>
        </template>
        <el-menu-item-group>

          <el-menu-item index="5-1" @click="toHostList">主机组</el-menu-item>
          <el-menu-item index="5-2" @click="toHosts">主机</el-menu-item>
          <el-menu-item index="5-3" @click="manage">操作</el-menu-item>
          <el-menu-item index="5-4" @click="toOtherinterface">接口控制</el-menu-item>
          <el-menu-item index="5-5" @click="toOperationlog">系统操作记录</el-menu-item>
<!--          <el-menu-item index="1-4" @click="towebssh">远程登录</el-menu-item>-->
        </el-menu-item-group>
      </el-submenu>


       <!-- 数据库模块 -->
<!--       <el-menu-item  index="4" @click="tomysqlchecklog">-->
<!--        <template slot="title">-->
<!--          <div class="nav-icon icon-database"></div>-->
<!--          <span>数据库日志</span>-->
<!--        </template>-->
<!--      </el-menu-item>-->

<!--      <el-menu-item index="5" @click="towaf" >-->
<!--        <template slot="title">-->
<!--          <div class="nav-icon icon-network"></div>-->
<!--          <span >代理服务 </span>-->
<!--        </template>-->
<!--      </el-menu-item>-->

<!--      <el-menu-item index="6" @click="tonetflowdisplay" >-->
<!--        <template slot="title">-->
<!--          <div class="nav-icon icon-log"></div>-->
<!--          <span >日志分析 </span>-->
<!--        </template>-->
<!--      </el-menu-item>-->
      <el-menu-item index="7" @click="toUserInfo" >
         <template slot="title">
          <div class="nav-icon icon-person"></div>
          <span >用户管理 </span>
        </template>
      </el-menu-item>

<!--      <el-menu-item index="9" @click="todes">-->
<!--        <template slot="title">-->
<!--          <div class="nav-icon icon-desens"></div>-->
<!--          <span > 数据脱敏</span>-->
<!--        </template>-->
<!--      </el-menu-item>-->
    </el-menu>
    
  </el-aside>
  
  <el-container >
<!--    <el-header style="text-align: right; font-size: 12px;padding-right:30px;background-color: rgba(242,234,191,0.15);height: 60px">-->
    <el-header style="color:white;text-align: right; font-size: 12px;padding-right:30px;background-color: #6d9de1;height: 60px">
     <el-row>
       <el-col span="22" style="margin-top: 5px">
         <i class="el-icon-bell item" style="margin-right: 15px;"></i>
       </el-col>
       <el-col span="1" style="margin-top: 10px">
         <img src="https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=302537951,2318234966&fm=26&gp=0.jpg"
              style="width: 40px;height: 40px;border-radius: 50%;margin-right: 2%">
       </el-col>
       <el-col span="1">
         <span class="logout" @click="dialogVisible = true" style="color: #eeeeee">登出</span>
       </el-col>

        <!--      <el-badge :value="0" class="notice">-->


        <!--      </el-badge>-->
        <!--      <el-button type="plain"  style="margin-right: 2%" @click="toUserInfo()"><span>{{Nowuser}}</span></el-button>-->


      </el-row>

     
    </el-header>
    <el-header style="padding-right:30px;background-color:#DDDDDD;height: 2px">
    </el-header>

    <el-main  style="background-color: rgba(242,234,191,0.15);" :style="{height: scrollerHeight}">
      <!-- 跳转的内容 -->
       <router-view ></router-view>
    </el-main>
  </el-container>

 
  
  <div>
    <el-dialog
       title="提示"
       :visible.sync="dialogVisible"
        width="30%"
       :before-close="dialog_handleClose">
       <span>是否确定要退出</span>
       <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false" type="warning" style="width:50px;height:30px;">取 消</el-button>
        <el-button type="primary" @click="toLogin" style="width:50px;height:30px;">确 定</el-button>
       </span>
       </el-dialog>
  </div>
</el-container>


</template>

<script>
export default {
  data() {
    return {
      h: "",
      isCollapse: false,
      username: "jeason",
      dialogVisible: false,
      Nowuser :'',
    };
  },
  methods: {
    //个人信息
     toUserInfo() {
      this.$router.push({ path: "/main/userinfo" });
    },
    //数据概况
    toDatavolume(){
       this.$router.push({path:"/main/datavolume"});
    },
    toDatainjection(){
      this.$router.push({path:"/main/injectionlog"});
    },
    toOperationlog(){
       this.$router.push({path:"/main/operationlog"});
    },
    toDataupload(){
      this.$router.push({path:"/main/dataupload"});
    },
    toOtherinterface(){
      this.$router.push({path:"/main/otherinterface"});
    },
    toDatamanage(){
      this.$router.push({path:"/main/datamanage"});
    },
    toManualop(){
      this.$router.push({path:"/main/manualop"});
    },
    toDatagraph(){
      this.$router.push({path:"/main/datagraph"});
    },
    toEventKG(){
      this.$router.push({path:"/main/eventKG"});
    },
    toRegular(){
      this.$router.push({path:"/main/regular"});
    },
    toGraphget(){
      this.$router.push({path:"/main/bygraph"});
    },
    //全局配置
    toAllconfig() {
      this.$router.push({ path: "/main/allconfig" });
    },
    //服务器管理
    toHostList() {
      this.$router.push({ path: "/main/hostlist" });
    },
    manage(){
      this.$router.push({ path: "/main/manager" });
    },
    toHosts() {
      this.$router.push({ path: "/main/hosts" });
    },
    //登出
    toLogin() {
      this.dialogVisible = false;
      // sessionStorage.removeItem("Flag");
      localStorage.removeItem("Flag");
      this.$router.push({ path: "/login" });
    },
    tomysqlchecklog() {
      this.$router.push({ path: "/main/mysqlchecklog" });
    },
    tomysqlfilelog() {
      this.$router.push({ path: "/main/mysqlfilelog" });
    },
    towaf() {
      this.$router.push({ path: "/main/proxyshow" });
    },
    tosetproxy() {
      this.$router.push({ path: "/main/setproxy/argsfilter" });
    },
    tonetflowdisplay(){
       this.$router.push({ path: "/main/netflowdisplay" });
    },
     tonetflowcheck(){
       this.$router.push({ path: "/main/netflowcheck" });
    },
    todes(){
      this.$router.push({path:"/main/desconf"})
    },
    getNowuser(){
       this.Nowuser = localStorage.getItem("Flag");
    },
    menu_handleClose() {},
    menu_handleOpen() {},
    dialog_handleClose() {},
    getscreenHeight() {}
  },
  components: {},
  // computed: {
  //   hei() {
  //     return (
  //       window.innerHeight ||
  //       document.documentElement.clientHeight ||
  //       document.body.clientHeight
  //     );
  //   }
  // },
  computed: {
    // 滚动区高度
    // (业务需求：手机屏幕高度减去头部标题和底部tabbar的高度，当然这2个高度也是可以动态获取的)
    scrollerHeight: function() {
      return (document.documentElement.clientHeight -70) + 'px';
    }
  },

  mounted() {
    this.getscreenHeight();
    this.getNowuser();

  }
};
</script>

<style scoped>
.userinfo {
  height: 150px;
  width: 199px;
  vertical-align: center;
  padding-top: 30px;
}
.user_img {
  width: 50px;
  height: 50px;
  margin-left: 20px;
  border-radius: 50%;
}
.userinfo .username {
  color: white;
  padding-left: 15px;
}
.el-header {
  background-color: rgb(234, 240, 247);
  color: #333;
  line-height: 60px;
}

.el-aside {
  color: #333;
}

.nav {
  height: 100%;
  min-height: 800px;
  border: 1px solid #eee;
}

.nav-icon {
  display: inline-block;
  height: 20px;
  width: 20px;
  margin-right: 10px;
}
.icon-computer {
  background: url("../assets/computer.png");
  background-size: contain;
}

.icon-task {
  background: url("../assets/task.png");
  background-size: contain;
}
.icon-log {
  background: url("../assets/log.png");
  background-size: contain;
}
.icon-network {
  background: url("../assets/network.png");
  background-size: contain;
}
.icon-person {
  background: url("../assets/person.png");
  background-size: contain;
}
.icon-database {
  background: url("../assets/database.png");
  background-size: contain;
}
.icon-proxy {
  background: url("../assets/task.png");
  background-size: contain;
}
.icon-desens {
  background: url("../assets/proxy.png");
  background-size: contain;
}

.logout {
  font-size: 15px;
  color: #5E5E5E;
  cursor: pointer;
  font-weight: 500;
}

.nowuser {
  font-size: 15px;
  color: darkblue;
  cursor: pointer;
  margin-right: 2%;
  font-weight: 500;
}
.logout:hover {
  color: #409EFF;
}

.routerlink {
  text-decoration: None;
}

 * {
        margin: 0;
        padding: 0;
    }

    .el-menu-t{
        display: block;
        position: fixed;
        height: 100%;
        width: 250px;
        left: 0;
        top: 0;
        bottom: 0;
    }
  .item{
    font-size: 22px;
    
  }
  .notice{
    margin-right:15px;
    position:relative;
    left:-10px;
    top:10px;
  }
  i:hover{
    cursor: pointer;
  }
  .title{
    color:#409EFF;
    font-size:50px;
    height:150px;
    width:250px; 
    background-color:#304156 ;
    display:inline-block;
    line-height:280px;
    text-align:center;
    /* background-image: url("../static/logo.png"); */
    background:url("../static/logo_n.png") no-repeat center;
  }
.el-dropdown-link {
  cursor: pointer;
  color: #409EFF;
}
.el-icon-arrow-down {
  font-size: 12px;
}

</style>
