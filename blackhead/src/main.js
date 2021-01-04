import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'                                                                 
import qs from 'qs'


Vue.prototype.qs = qs;


import MintUI from 'mint-ui'
import "mint-ui/lib/style.min.css"
//注册为全局插件       
Vue.use(MintUI)

import Vant from 'vant'
import "vant/lib/index.css"
//注册为全局插件       
Vue.use(Vant)

// 中央事件总线
// Vue.prototype.Bus = new Vue();

//配置服务器端的基础地址,代表已经确定了WEB服务器的地址及端口号
// axios.defaults.baseURL = 'http://127.0.0.1:5050'
axios.defaults.baseURL = '/api'
Vue.prototype.axios = axios;
Vue.config.productionTip = false

new Vue({          
  router,
  store,
  render: h => h(App)
}).$mount('#app')
 