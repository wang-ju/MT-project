import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

export default {
  state: {
    pstock:0,  //库存
    proInfo:{  //商品详情
      count:0  //累加数量
    },
    cartList:localStorage.getItem('cartList') ? JSON.parse(localStorage.getItem('cartList')) : [], //购物车列表
  },
  mutations: {
    // 通过异步 读取 数据 修改 state proInfo 
    _setProInfo(state,data){
      state.proInfo = data;
    },
    // 添加到购物车
    _addCartList(state,product){
      // 先声明存在为false
      let isExists = false;
      state.cartList.forEach((item) => {
        if(item.pid == product.pid){
          item.count += product.count
          isExists = true
          console.log(item.pid,product.pid)
        }
      })
      // 如果商品不存在
      if(!isExists){
        let list = product;
        // console.log(list)
        state.cartList.push(list);
      }
      // 存储在浏览器缓存里
      localStorage.setItem("cartList",JSON.stringify(state.cartList))
    },
    // cartlist count 添加
    _addNum(state,pid){
      state.cartList.forEach(item => {
        if(item.pid == pid)
        item.count++
        return item.count
      })
    },
    // cartlist count 减少
    _reduceNum(state,pid){
      state.cartList.forEach(item => {
        if(item.pid == pid){
          if(item.count > 0){
            item.count--
          }
        }
        return item.count
      })
    },
    // 删除购物车  数据
    _removeCartItem(state,id){
      state.cartList.forEach((item,index) => {
        if(id == item.pid){
          console.log(item.pid)
          state.cartList.splice(index,i)
        }
      })
      return state.cartList
    }
  },
  getters:{
    //  获取 商品详情
    _getProInfo(state){
      return state.proInfo
    },
    // 获取 商品存储数量
    _getPstock(state){
      return state.pstock = state.proInfo.stock
    },
    // 获取购物车列表
    _getCartList(state){
      return state.cartList
    }
  },
  actions: {
    // vuex中 异步获取 商品详情 并对matations _setProInfo 进行提交数据
    _getDataList(context,id){
      // console.log(id)  //拿到 传递的 商品id
      axios.get('/proinfo',{
        params:{
          pid:id
        }
      }).then(res => {
        context.commit('_setProInfo',res.data[0])
      })
    }
  }
}
