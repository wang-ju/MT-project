<template>
  <div id="myAccount">
      <!-- 顶部导航开始 -->
    <mt-header title="我的账户" class="shortcut" fixed>
      <router-link to="/" slot="left">
        <mt-button icon="back" class="back"></mt-button>
      </router-link>
      <router-link to="/" slot="right">
        <img src="../assets/img/home-login.svg" alt="" />
      </router-link>
    </mt-header>
    <!-- 顶部导航结束 -->

    <!-- 表单开始 -->
    <div class="main" style="margin-top:56px">
        <div class="layout">
            <div class="s-cont">
                <div class="s-right">
                    <div class="account-info">
                        <router-link to="">
                            <div class="s-infos">
                                <p class="p_1">hello,{{$store.state.username}}</p>
                                <p class="p_2">经验值：0</p>
                            </div>
                        </router-link>
                    </div>
                </div>
                <div class="s-left">
                    <div class="titel">
                        <span>我的订单</span>
                    </div>
                    <div class="s-links">
                        <button class="button">
                            <img src="../assets/img/代付款.svg" alt="">
                            <span>待付款</span>
                        </button>
                        <button class="button">
                            <img src="../assets/img/待收货.svg" alt="">
                            <span>待收货</span>
                        </button>
                        <button class="button">
                            <img src="../assets/img/待评论.svg" alt="">
                            <span>待评论</span>
                        </button>
                        <button class="button">
                            <img src="../assets/img/全部订单.svg" alt="">
                            <span>全部订单</span>
                        </button>
                    </div>
                </div>
            </div>
            <div class="s-nav">
                <div class="s-items">
                    <router-link to="" class="a">
                        <img src="../assets/img/优惠券.svg" alt="">
                        <span>优惠券(0)</span>
                    </router-link>
                </div>
                <div class="s-items">
                    <router-link to="" class="a">
                        <img src="../assets/img/收货地址.svg" alt="">
                        <span>收货地址</span>
                    </router-link>
                </div>
                <div class="s-items">
                    <router-link to="">
                        <img src="../assets/img/售后管理.svg" alt="">
                        <span>售后管理</span>
                    </router-link>
                </div>
            </div>
            <div class="s-sign_out" @click="out">
                <p>退出当前登录</p>
            </div>
        </div>
    </div>
    <!-- 表单开始 -->

    <!--底部选项卡开始  -->
    <Footed></Footed>
    <!--底部选项卡结束  -->

  </div>
</template>

<script>
import Footed from "../components/Footed";
import {mapState,mapMutations} from 'vuex'
export default {
    computed : {
      // ...对象展开运算符
      ...mapState(['isLogined','username']),
    },
    data(){
        return{
          tabbar: "",
        }
    },
    methods: {
      ...mapMutations(['logout']),
      // 用户注销
      out() {
        // // 退出登录清除用户缓存
        localStorage.removeItem('username');
        this.logout();
        // 退出之后跳转登录页面
        this.$router.push('/login')
      }
    },
    components:{
      Footed
    },
}
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
}
.mint-header.shortcut {
  height: 51px;
  line-height: 51px;
  background-color: #000;
}
.shortcut a {
  display: inline-block;
  text-decoration: none;
  margin-left: 5px;
}
.footer {
  height: 57px;
  margin-top: 0px;
}                                                                                                                                                                                                                                                                                                                                                                                                                      
.footer img {
  width: 20px;
  height: 20px;
}
.mint-tabbar>>>.mint-tab-item.is-selected {
    background-color:#fafafa;
    color:black;
    border-top: 1px solid #D9D9D9;
}
.main{
    margin: 15px;
    position: relative;
    max-width: 1100px;
    
}
.layout{
    position: relative;
}
.s-cont{
    border: 1px solid #ccc;
    border-radius: 10px;
}
.account-info {
    border-radius: 10px;
    width:100%;
    height: 100%;
    border-width: 0;
    position: relative;
    text-align: center;
    background: url(../assets/img/account.jpg)  center center;
}
.s-infos{
   position: relative;
   height: 165px;
   background-color:rgba(0,0,0,0.6);
}
.p_1{
    padding-top:50px;
    color: #fff;
    font-size: 18px;
    line-height: 24px;
}
.p_2{
    font-size: 12px;
    color: #fff;
    margin: 5px 0 0;
}
.titel{
    padding: 10px 15px;
    border-bottom: 1px solid #d5d5d5;
}
.titel span{
    font-size: 14px;
    color: #333;
}
.s-links{
    display: flex;
}
.button{
    flex: 1;
    margin: 0;
    padding: 14px 0;
    outline: none;
    border: none;
    display: block;
    background: #fff;
    border-radius: 10px;
}
.button img{
    display: block;
    margin: 0 auto 8px;
    font-size: 24px;
}
.button span{
    position: relative;
    display: inline-block;
    cursor: pointer;
    font-size: 12px;
}
.s-nav{
    position: static;
    margin: 15px 0;
    height: 171px;
    width: auto;
    border: 1px solid #ccc;
    border-radius: 10px;
}
.s-items{
    line-height: 20px;
    font-size: 14px;
    font-weight: bold;
    color: #333;
    line-height: 1;
}
.s-items a{
    display: block;
    line-height: inherit;
    font-size: 14px;
    padding: 20px 0;
    width: calc(100% - 40px);
    margin: 0 auto;
   
}
.a{
    border-bottom: 1px solid #ccc;
}
.s-items img{
    display: inline-block;
    font-size: 16px;
    font-size: 16px;
}
.s-items span{
    display: inline-block;
    margin: 0 0 0 10px;
    font-size: 15px;
    color: #5F5A5A;
}
.s-sign_out{
    display: block;
    margin: 15px 0;
    padding: 10px 15px;
    line-height: 20px;
    text-align: center;
    color: #333;
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
}
.s-sign_out p{
    font-size: 14px;
}
</style>