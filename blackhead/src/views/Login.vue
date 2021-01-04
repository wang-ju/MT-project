<template>
<div>
  <div id="login" v-if="this.$store.state.isLogined == 0">
    <!-- 顶部导航开始 -->
    <mt-header title="登录" class="shortcut" fixed>
      <router-link to="/" slot="left">
        <mt-button icon="back" class="back"></mt-button>
      </router-link>
      <router-link to="/" slot="right">
        <img src="../assets/img/home-login.svg" alt="" />
      </router-link>
    </mt-header>
    <!-- 顶部导航结束 -->

    <!-- 表单区域开始 -->
    <div class="box" style="margin-top:56px">
        <div class="box_1">
            <div class="box_2">
                <div class="box_3"> 
                    <input type="text" 
                           placeholder="手机/邮箱/用户名" 
                           :attr="{ maxlength: 15 }" 
                           v-model="username" 
                           @blur="checkUsername" 
                           :state="usernameState">
                </div>
                <div class="box_3"> 
                    <input type="password"
                           placeholder="登录密码" 
                           :attr="{ maxlength: 20, autocomplete: 'off' }" 
                           v-model="password" 
                           @blur="checkPassword" 
                           :state="passwordState">
                </div>
                <div class="box_4">
                    <router-link to="/res" class="a1">注册</router-link>
                    <router-link to="" class="a2">忘记密码</router-link>
                </div>
                <button type="primary"  @click="handle" class="button">登录</button>
                <button type="button" class="button_1">用短信验证码登录</button>
            </div>
            <div class="box_5">
                <router-link to="" class="else">社交账号登录</router-link>
                <router-link to="" class="weixin">
                  <img src="../assets/img/weixin.svg" alt="">
                </router-link>
            </div>
        </div>
    </div>
    <!-- 表单区域结束 -->

   <!--底部选项卡开始  -->
    <Footed></Footed>
    <!--底部选项卡结束  -->
  </div>  
  <div v-else>
    <MyAccount ></MyAccount>
  </div>
  
  </div>
</template>

<script>
import MyAccount from '../views/MyAccount'
import Footed from '../components/Footed'
export default {
  data() {
    return {
      // tabbar: "me",
      username: "",
      password: "",
      usernameState: "",
      passwordState: "",
    };
  },
  methods: {
    checkUsername() {
      //1.校验用户名
      let usernameRegExp = /^[a-zA-Z0-9_]{6,20}$/;
      if (usernameRegExp.test(this.username)) {
        this.usernameState = "success";
        return true;
      } else {
        //this.$toast('用户名为必填项');
        this.$toast({
          message: "用户名为必填项",
          // position: "top",
          // duration: 2000, //提示框弹出 显示的时长
          // iconClass: "", //字体图标Class类名称
        });
        this.usernameState = "error";
        return false;
      }
    },
    checkPassword() {
      //2.校验密码
      let passwordRegExp = /^\w{6,16}$/;
      if (passwordRegExp.test(this.password)) {
        this.passwordState = "success";
        return true;
      } else {
        this.$toast({
          message: "密码为必填项",
          // position: "middle",
          // duration: 2000,
        });
        this.passwordState = "error";
        return false;
      }
    },
    handle() {
      if (this.checkUsername() && this.checkPassword()) {
        let obj = {
          username: this.username,
          password: this.password,
        };
        // 分发Actions
        this.$store.dispatch("login", obj);
      }
    }
  },
  components:{
    Footed,MyAccount
  }
};
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
}
.mint-header.shortcut {
  height: 51px;
  background-color: #000;
}
.shortcut a {
  display: inline-block;
  text-decoration: none;
  margin-left: 5px;
}
.mint-header{
    font-size: 16px !important;
}
.box{
    box-sizing: content-box;
    font-size: 14px;
}
.box_1{
    min-height: 420px;
    padding-bottom: 50px;
    margin: 0 auto;
    padding-top: 30px!important;
}
.box_2{
    padding: 20px 20px;
    width: calc(100vw - 80px);
    max-width: 320px;
    margin:0 auto;
    border-radius: 3px;
    background-color: #fff;
}
.box_3{
    margin-bottom: 20px;
}
.box_3 input{
    border: 1px solid #ccc!important;
    border-radius: 1px!important;
    box-sizing: border-box;
    color: #606266;
    display: inline-block;
    height: 40px;
    line-height: 40px;
    outline: none;
    padding: 0 15px;
    font-size: 15px;
    width: 100%;
}
.box_4{
    font-size: 12px;
    margin-bottom: 10px;
    cursor: pointer;
}
.a1{
    color: #212121!important;
    font-size: 14px!important;
    text-decoration: none;
}
.a2{
    float: right;
    color: #212121!important;
    font-size: 14px!important;
    text-decoration: none;
}
.button{
    width: 100%;
    padding: 13px 20px;
    color: #ffffff;
    background: #121212!important;
    border: 0 solid #fff!important;
    border-radius: 1px!important;
    font-weight: bold;
    font-size: 15px!important;
}
.button_1{
    /* color: #212121!important; */
    border: 1px solid #212121!important;
    padding: 10px 20px;
    border-radius: 1px!important;
    margin: 10px 0 0;
    width: 100%;
    font-size: 15px!important;
}
.box_5 {
    text-align: center;
    font-size: 12px;
    position: relative;
    border: none!important;
}
.else{
    display: inline-block;
    position: absolute;
    padding: 0 6px;
    margin-left: -26px;
    text-decoration: none;
    color: #000;
}
.weixin{
    width: 30px;
    height: 30px;
    display: inline-block;
    margin: 30px 0 0;
    position: relative;
    cursor: pointer;
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
</style>