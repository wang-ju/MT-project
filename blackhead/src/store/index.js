import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import qs from 'qs'
import router from '../router'

// 引入子store
import cart from '../store/cart/cart'

Vue.use(Vuex)

export default new Vuex.Store({
  // 物品
  state: {
    //标识用户是否已经登录
    isLogined:localStorage.getItem('isLogined') ? localStorage.getItem('isLogined') : 0,
    username:localStorage.getItem('username') ? localStorage.getItem('username') : '',
    getkeyword:'',
    shareInfo:'',
    keyword:''
  },
  // 记账员
  getters:{
    shareInfo(state){
      return state.shareInfo
    }
  },
  // 搬运工
  mutations: {
    // 用户登录
    logined(state,payload){
      state.isLogined = 1;
      state.username=payload.username;
      localStorage.setItem('username',payload.username)
    },
    // 用户注销
    logout(state){
      state.isLogined = 0;
      state.username='';
      localStorage.removeItem('isLogined');
      localStorage.removeItem('username')
    },
    // getkeyword(state,keyword){
    //   state.keyword = keyword;
    //   console.log(state.keyword);
    // },
    share(state,msg){
      // console.log(msg)
      state.shareInfo = msg
    }
  },
  // 拉货的汽车
  actions: {
    login(context,payload){
      // 发送异步请求
      axios.post('/login',qs.stringify(payload)).then(res=>{
        // console.log('heiheiheihei')
        // 用户登录成功
        if(res.data.code == 1){
          //提交Mutations
          context.commit('logined',res.data.info);
          localStorage.setItem('isLogined','1');
          router.push('/myAccount');
        }else{
          // this.$messagebox("注册提示","用户名或者密码错误")
          window.alert('用户登录失败')
        }
      })  
    }
  },
  modules: {  //加载抽离的模块
    cart
  },
}) 

