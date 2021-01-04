<template>
  <div id="res">
    <!-- 顶部导航开始 -->
    <mt-header title="注册" class="shortcut" fixed>
      <router-link to="/login" slot="left">
        <mt-button icon="back" class="back"></mt-button>
      </router-link>
      <router-link to="/" slot="right">
        <img src="../assets/img/home-login.svg" alt />
      </router-link>
    </mt-header>
    <!-- 顶部导航结束 -->

    <!-- 表单区域开始 -->
    <div class="res_boxs" style="margin-top:56px">
      <div class="res_box1">
        <div class="res_box2">
          <div class="res_box3">
            <input
              type="text"
              placeholder="手机"
              autocomplete="off"
              :attr="{maxlength:15}"
              @blur="checkPhone"
              :state="PhoneState"
              v-model="username"
            />
          </div>
          <div class="res_box3">
            <input
              type="password"
              placeholder="设置密码"
              autocomplete="off"
              @blur="checkPassword"
              :state="passwordState"
              v-model="password"
            />
          </div>
          <div class="res_box3">
            <input
              type="text"
              placeholder="确认密码"
              autocomplete="off"
              @blur="checkConpassword"
              :state="conpasswordState"
              v-model="conpassword"
            />
          </div>
          <div class="res_box4">
            <p>
              已有账号?请
              <router-link to="/login">直接登录</router-link>
            </p>
          </div>
          <div class="res_box5">
            <button @click="handle">注册</button>
          </div>
          <button class="y_z">用短信验证码注册</button>
          <div class="res_box6">
            <span>社交账号登录</span>
            <img src="../assets/img/r_wx.svg" alt />
          </div>
        </div>
      </div>
    </div>
    <!-- 表单区域结束 -->
    <!--底部选项卡开始  -->
    <Footed></Footed>
    <!--底部选项卡结束  -->
  </div>
</template>

<script>
import Footed from "../components/Footed";
export default {
  data() {
    return {
      tabbar:'res',
      username: "",
      password: "",
      conpassword: "",
      PhoneState: "",
      passwordState: "",
      conpasswordState: ""
    };
  },
  methods: {
    checkPhone() {
      //1.效验手机号
      let usernameRegExp = /^1[3-9]\d{9}$/;
      if (usernameRegExp.test(this.username)) {
        this.PhoneState = "success";
        return true;
      } else {
        this.$toast({
          message: "手机号不正确",
          position: "top"
        });
        this.PhoneState = "error";
        return false;
      }
    },
    checkPassword() {
      //2.效验密码
      let passwordRegExp = /^\w{6,16}$/;
      if (passwordRegExp.test(this.password)) {
        this.passwordState = "success";
        return true;
      } else {
        this.$toast({
          message: "密码为必填项"
        });
        this.passwordState = "error";
        return false;
      }
    },
    checkConpassword() {
      //3.效验二次密码
      if (this.conpassword != this.password) {
        this.$toast({
          message: "两次密码不一致"
        });
        this.conpasswordState = "error";
        return false;
      } else {
        this.conpasswordState = "success";
        return true;
      }
    },
    handle() {
      if (
        this.checkPhone() &&
        this.checkPassword() &&
        this.checkConpassword()
      ) {
        // 该将获取到的信息提交到web服务器
        // console.log(`提交获取的信息到服务器`)
        // 已经代表服务器上必须存在post方式的,名称为register的接口
        // 同时
        this.axios.post(
            "/register","username=" + this.username + "&password=" + this.password
          ).then(result => {
            if (result.data.code == 1) {
              this.$router.push("/myAccount");
            } else {
              this.$messagebox("注册提示", "用户名已存在");
            }
          });
        }
     }
  },
  components:{
    Footed 
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
.res_boxs {
  line-height: normal;
}
.res_box1 {
  background-repeat: no-repeat;
  padding-top: 30px !important;
  padding-bottom: 50px;
  min-height: 540px;
  margin: 0 auto;
}
.res_box2 {
  padding: 20px 20px;
  max-width: 320px;
  margin: auto;
  width: auto !important;
}
.res_box3 {
  margin-bottom: 20px;
  width: 100%;
  font-size: 15px !important;
}
.res_box3 input {
  width: 90%;
  border: 1px solid #ccc !important;
  border-radius: 1px !important;
  height: 40px;
  line-height: 40px;
  outline: none;
  padding: 0 15px;
}
.res_box4 {
  font-size: 12px;
  margin-bottom: 10px;
}
.res_box4 a {
  text-decoration: none;
  color: #212121 !important;
  font-size: 14px !important;
}
.res_box5 {
  margin-bottom: 10px;
}
.res_box5 button {
  width: 100%;
  border: 1px solid #ccc !important;
  border-radius: 1px !important;
  height: 41px;
  line-height: 41px;
  outline: none;
  padding: 0 15px;
  color: #fff;
  background-color: #000;
}
.y_z {
  width: 100%;
  color: #212121 !important;
  border: 1px solid #212121 !important;
  padding: 13px 20px;
  border-radius: 1px !important;
}
.res_box6 {
  margin-top: 30px;
  text-align: center;
}
.res_box6 span {
  margin-top: -10px;
  position: absolute;
  padding: 0 6px;
  left: 50%;
  margin-left: -42px;
  font-size: 14px;
}
.res_box6 img {
  width: 34px;
  height: 34px;
  cursor: pointer;
  padding: 5px;
  margin: 12px 0 0;
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