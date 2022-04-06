// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'


//import store from './store'


//element-ui --------------------------
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import echarts from 'echarts'
import VueSocketio from 'vue-socket.io';
import 'xterm/dist/xterm.css'

import iView from 'iview';
import 'iview/dist/styles/iview.css';
import allconfig from "./utils/allconfig.js"
Vue.prototype.$ALLCONFIG=allconfig;

Vue.use(iView);

Vue.prototype.$echarts = echarts 
Vue.use(ElementUI);
//element-ui --------------------------
Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})



router.beforeEach((to, from, next) => {

  //获取用户登录成功后储存的登录标志
  // let getFlag = sessionStorage.getItem("Flag");
  let getFlag = localStorage.getItem("Flag");
  //如果登录标志存在且为isLogin，即用户已登录
  if(getFlag){

     next()

  }else{

    //用户想进入需要登录的页面，则定向回登录界面
    if(!to.meta.isLogin){
      next({
        path: '/login',
      })
      //iViewUi友好提示
      iView.Message.info('请先登录')
      //用户进入无需登录的界面，则跳转继续
    }else{
      next()
    }

  }

});

router.afterEach(route => {
  window.scroll(0, 0);
});
