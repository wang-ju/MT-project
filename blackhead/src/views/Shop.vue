<template>
  <div id="shop">
    <!-- 顶部导航开始 -->
    <mt-header title="购物袋" class="shortcut" fixed>
      <router-link to="/" slot="left">
        <mt-button icon="back" class="back"></mt-button>
      </router-link>
      <router-link to="/" slot="right">
        <img src="../assets/img/home-login.svg" alt="" />
      </router-link>
    </mt-header>
    <!-- 顶部导航结束 -->

    <!-- 无商品 -->
    <div class="cart_view" style="margin-top: 56px" v-if="this.$store.state.cartList == 1">
      <div class="none">
        <div class="cart">
          <p>购物袋里还没有商品</p>
          <button class="button">
            <router-link to="/product" class="goto">去逛逛</router-link>
          </button>
        </div>
      </div>
    </div>

    <!-- 购物车列表 -->
    <div class="top" v-else>
      <!-- 全选标题栏 -->
      <div class="top-t">
        <p class="all-t">
          <input type="checkbox"  v-model="checked" @click="checkedAll">全选
        </p>
        <p>删除</p>
        <p class="clear-t">清除无效商品</p>
      </div>
      <!-- 商品详情 -->
      <div class="s-cont del-t">
        <div class="sk-cart-product">
          <div class="s-info" v-for="(i,k) in cartList" :key="k">
            <div class="s-left" >
               <div>
                 <!-- 将 选项中 通过 双向绑定 添加到checkList -->
                <input type="checkbox"  v-model="checkList" :value="i">
               </div>
            </div>
            <div class="s-cont">
              <div class="s-img">
                <img
                  :src="'http://127.0.0.1:5050' + i.img"
                  alt="心形手铐吊坠钛钢小耳环"
                />
              </div>
              <div class="s-name">
                <p>{{i.ptitle}}</p>
                <p>颜色分类：银色</p>
                <p>￥{{i.price}}</p>
                <p @click="removeItem(i.pid)">删除</p>
              </div>
              <!-- 按钮组 -->
              <div class="s-set-m">
                <button class="size-t" @click="reduceNum(i.pid)">-</button>
                <p class="count-t">{{i.count}}</p>
                <button class="size-t" @click="addNum(i.pid)">+</button>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="buttom-t">
          <div class="total-t">
            <p>合计：￥{{getTotal}}</p>
            <p>(不含运费)</p>
          </div>
          <button class="ok-t" @click="calc">确认结算</button>
      </div>
    </div>

    <!--底部选项卡开始  -->
    <Footed></Footed>
    <!--底部选项卡结束  -->
  </div>
</template>

<script>
import Footed from "../components/Footed";
import {mapGetters,mapMutations} from 'vuex';

export default {
  data() {
    return {
      count:0,
      checkList:[],
      total:0,
      checked:false,
    }
  },
  methods: {
    // 结构 将 store 的函数映射到 当前组件内
    ...mapMutations(['_addNum','_reduceNum','_removeCartItem']),
    // 添加数量
    addNum(pid){
      this._addNum(pid);
    },
    // 减少数量
    reduceNum(pid){
      this._reduceNum(pid);
    },
    // 删除
    removeItem(pid){
      this._removeCartItem(pid);
    },
    // 全选
    checkedAll(){
      if(this.checked){
        this.checkList = []
      }else{
        this.checkList = [];
        this._getCartList.forEach(item => {
          item.Checked  = true;
          this.checkList.push(item);
          // console.log(this.checkList)
        });
      }
    },
    // 结算
    calc(){
      console.log(this.checkList)
    }
  },
  computed: {
    // 导入用户点击添加进入购物车的数据
    ...mapGetters(['_getCartList']),
    cartList(){
      return this._getCartList
    },
    // 总计
    getTotal() {
      // 计算checkList 并计算求和
      this.total = this.checkList.reduce((acc,cur) => {
        return acc + cur.price*cur.count
      },0)
      return this.total
    }
  },
  watch: { //监听checkList 全选
    checkList:function() {
      if(this._getCartList.length == this.checkList){
        this.checked =  true
      }else{
        this.checked = false
      }
    }
  },
  components: {
    Footed,
  },
  // 自定义过滤器，解决toFixed报错问题
  // filters: {
  //   keepTwoNum:function(value){
  //     value = Number(value);
  //     return value.toFixed(2);
  //   }
  // }
};
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
}
.top{
  padding-top: 56px;
}
.goto{
  color: white;
}
.buttom-t{
  display: flex;
  border-bottom: 1px solid #ccc;
  justify-content:flex-end;
}
.total-t{
  padding: 11px 15px 0 0;
  text-align: center;
  font-size: 14px;
}
.ok-t{
  border: none;
  padding: 18px;
  font-size: 14px;
  font-weight: bold;
  color: white;
  background-color: black;
}
.top-t {
  display: flex;
  height: 20px;
  font-size: 14px;
  padding: 10px 15px;
  border-bottom: 1px solid #ccc;
}
.but-t {
  width: 16px;
  height: 16px;
}
.s-top {
  overflow: hidden;
  margin: 0;
  padding: 10px 15px;
  border-top-width: 0;
  font-size: 0;
}
.all-t {
  padding: 0 30px 0px 0px;
}
.clear-t {
  padding: 0 0 0 135px;
}
.s-clea {
  float: right;
}
.s-cont {
  display: flex;
  /* margin: 0 0 10px; */
  overflow-x: hidden;
  overflow-y: auto;
}
.del-t {
  border-bottom: 1px solid #ccc;
}
.sk-cart-product {
  padding: 8px 15px;
  border: 0 solid #d5d5d5;
  border-width: var 0 0;
}
.sk-cart-product:first-child {
  border-top: none !important;
}
.sk-cart-view .s-info {
  border-top: none !important;
  position: relative;
}
.s-info {
  /* position: relative!important; */
  display: flex;
}
.s-set-m {
  margin-top: 85px;
  display: flex;
}
.s-left {
  display: flex;
  padding: 0 10px 0 0;
  font-size: 12px;
}
.s-other {
  display: flex;
  text-align: right;
}
.sk-cart-product .s-other {
  display: block !important;
  position: absolute !important;
  left: 132px !important;
  bottom: 0 !important;
  text-align: left !important;
}
.s-check {
  width: 2em;
  font-size: inherit;
  text-align: left;
}
.su-button.i-text {
  border: none;
  color: #4685ee;
  background: transparent;
  padding: 0;
}
.s-check_ico {
  width: 20px;
  height: 20px;
  /* color: #adadad; */
}
.s-img {
  position: relative;
  margin: auto;
  width: 70px;
  height: 70px;
}
.sk-cart-product .s-img {
  width: 90px !important;
  height: 90px !important;
}
.s-img img {
  display: block;
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  margin: auto;
  max-width: 100%;
  max-height: 100%;
}
.s-name {
  align-self: auto;
  position: relative;
  display: -webkit-box;
  -webkit-box-flex: 1;
  flex: 1;
  margin: 0 10px;
  color: inherit;
  font-size: 12px;
  line-height: 1.5em;
  overflow: hidden;
  text-overflow: ellipsis;
  -webkit-line-clamp: 4;
  -webkit-box-orient: vertical;
}
.sk-cart-product .s-name {
  font-size: 14px !important;
}
.s-name_a {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  -webkit-line-clamp: 4;
  -webkit-box-orient: vertical;
}
.size-t {
  width: 20px;
  height: 20px;
}
.count-t {
  padding: 0 10px 0 10px;
  border: 1px solid #ccc;
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
.mint-header {
  font-size: 16px !important;
}
.footer {
  height: 57px;
  margin-top: 0px;
}
.footer img {
  width: 20px;
  height: 20px;
}
.mint-tabbar >>> .mint-tab-item.is-selected {
  background-color: #fafafa;
  color: black;
  border-top: 1px solid #d9d9d9;
}
.none {
  padding: 15% 0;
  width: 100%;
  text-align: center;
}
.cart {
  margin: auto;
  color: #9e9e9e;
  font-size: 14px;
}
.cart_view .cart {
  padding-top: 50px;
  background-size: 50px;
  background-repeat: no-repeat;
  background-position: center top;
  background-image: url("../assets/img/shop.png");
}
.button {
  height: 34px;
  width: 83px;
  margin: 20px 0 0;
  padding: 9px 17px;
  color: #fff;
  background: #212121;
  border: 1px solid #212121;
  line-height: 1;
  border-radius: 3px;
}
</style>