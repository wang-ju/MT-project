<template>
  <div>
    <!-- header -->
    <Header></Header>

    <div class="details">
      <!--详情页轮播图-->
      <div class="swiper">
        <van-swipe @change="onChange" :loop="false" height="343">
          <van-swipe-item v-for="(item, key) in oneList" :key="key">
            <img class="img" :src="'http://127.0.0.1:5050' + item.One" alt="" />
          </van-swipe-item>
        </van-swipe>
      </div>
      <!-- 详情页主页 -->
      <div class="grid_item" id="detailpage">
        <div class="product-single_vendor">
          <router-link to="">{{ p_title }}</router-link>
        </div>
        <h1 class="product-single_title">{{ title }}</h1>
        <div class="price">
          <p>
            RMB<span class="span">{{ price }}</span>
          </p>
        </div>
        <div class="product_desc">{{ pro_title }}</div>
        <div class="change_option">
          <span>已选</span>
          <span class="span_p">颜色分类:金色 </span>
          <span class="span_img">
            <img src="../assets/img/dayu.svg" alt="" />
          </span>
        </div>
        <div class="pro_discount_each">
          <span>下单包邮</span>
        </div>
        <van-tabs v-model="activeName">
          <van-tab title="商品描述" name="a">
            <div class="pro-content">
              <img src="" alt="" />
              <p>
                <img
                  :src="'http://127.0.0.1:5050' + detailPage.one_img"
                  alt=""
                />
                <img
                  :src="'http://127.0.0.1:5050' + detailPage.two_img"
                  alt=""
                />
                <img
                  :src="'http://127.0.0.1:5050' + detailPage.three_img"
                  alt=""
                />
                <img
                  :src="'http://127.0.0.1:5050' + detailPage.four_img"
                  alt=""
                />
                <img
                  :src="'http://127.0.0.1:5050' + detailPage.five_img"
                  alt=""
                />
                <img
                  :src="'http://127.0.0.1:5050' + detailPage.six_img"
                  alt=""
                />
                <img
                  :src="'http://127.0.0.1:5050' + detailPage.seven_img"
                  alt=""
                />
                <img
                  :src="'http://127.0.0.1:5050' + detailPage.eight_img"
                  alt=""
                />
                <img
                  :src="'http://127.0.0.1:5050' + detailPage.nine_img"
                  alt=""
                />
              </p>
              <div class="share">
                <div class="wei">
                  <span>分享到</span>
                  <router-link to="" class="wx">
                    <img src="../assets/img/微信.svg" />
                  </router-link>
                  <router-link to="" class="wb">
                    <img src="../assets/img/微博.svg" />
                  </router-link>
                </div>
                <div class="collect">
                  <p>收藏</p>
                </div>
              </div>
            </div>
          </van-tab>
          <van-tab title="购物须知" name="b">
            <div class="else">
              <div class="custom_tips">
                <span>请到自定义页面，创建页面模块</span>
              </div>
            </div>
          </van-tab>
        </van-tabs>
      </div>
    </div>

    <!-- footer -->
    <!-- <Footer></Footer> -->

    <!--底部选项开始 -->
    <div>
      <div class="buttom-nav">
        <van-goods-action>
          <van-goods-action-icon icon="chat-o" text="首页" to="/" />
          <van-goods-action-icon icon="shop-o" text="购物车" to="/shop" />
          <van-goods-action-button @click="show = true" color="#ccc" type="warning" text="加入购物车"/>
          <van-goods-action-button color="#000" type="danger" text="立即购买" />
        </van-goods-action>
      </div>
    </div>
    <!--底部选项卡结束 -->

    <!-- 加入购物车 -->
    <van-popup v-model="show" position="buttom" :style="{ height: '30%' }">
      <!-- <addShop></addShop> -->
        <div class="shop-a">
          <div class="product-a">
              <div class="window-map">   
                  <img id="sku-image" :src="'http://127.0.0.1:5050' + detailPage.one_img">
              </div>
              <span class="price-a">￥{{ price }}</span>
          </div>
          <div class="product-b">
              <div class="sku-item">
                  <div class="left">颜色分类：</div>
                  <div class="right">
                      <a href="" class="btn selected btn-xs" >数据库无数据</a>
                  </div>
              </div>
          </div>
          <div class="product-c">
              购买数量
              <div class="quantity-selector">
                  <button class="btn-c" @click="reduceNum" :disabled="canReduce">-</button>
                  <span class="input">{{count}}</span>
                  <button class="btn-c"  @click="addNum" :disabled="canAdd">+</button>
                  <!-- <span >(库存不足)</span> -->
              </div>
          </div>
      </div>
      <div class="sure-a">
            <button class="add" @click="addCart" >加入购物车</button>
      </div>
    </van-popup>

  </div>
</template>

<script>
import { Toast, Form } from "vant";
import Header from "../components/Header";
import Footer from "../components/Footer";
import {mapActions,mapGetters,mapMutations} from 'vuex';

export default {
  components: {
    Header,
    Footer,
  },
  data() {
    return {
      ID: "",
      oneList: [],
      activeName: "a",
      detailPage: [],
      Products: [],
      p_title: "",
      title: "",
      price: "",
      // 返回的pid值
      pid:"",
      pro_title: "",
      show:false,
      // 购物车数据
      count: 1, //数量
      canAdd:false, //不能增加
      canReduce:false, //不能减少
      // stockInfo:false, //库存

    }
  },
  methods: {
    onChange(index) {
      // Toast('当前 Swipe 索引：' + index);
    },
    getOneList() {
      this.axios.get("/details/one").then((res) => {
        //console.log(res.data);
        this.oneList = res.data;
      });
    },

     // 语法糖 结构
      ...mapActions(['_getDataList']),
      ...mapMutations(['_addCartList']),

      // 比较库存 与 当前 用户点击数量 增加数量
      addNum() {
        // if(this.count < this._getPstock){
          this.count++
        //   this.canReduce = false
        // }else{
        //   this.canAdd = true
        //   this.stockInfo = true
        // }
      },
      // 减少 数量
      reduceNum(){
        if(this.count > 1){
          this.canReduce = false;
          this.canAdd = false;
          this.stockInfo = false;
          this.count--
        }else{
          this.canReduce = true
        }
      },
      getDetails(){
          // 获取 dataList 传递过来的 单个商品的 id
          // console.log(this.$route.query.pid)

          // 调用 vuex 中的 _getDataList 传参，发请求，获取 商品详情
          this._getDataList(this.pid)
          // console.log(this.pid)
          
      },

      // 添加到购物车----->添加到vuex中
      addCart() {
        let product = {
          pid:this.$route.query.id,
          ptitle: this._getProInfo.title,
          price: this._getProInfo.price,
          img: this._getProInfo.img,
          count: this.count
        }
        // 把商品添加到vuex中
        this._addCartList(product);
        // console.log(product.pid)
        // console.log(localStorage.getItem('cartList'))
      },

      // 发送get请求
      getHomeDetails(){
        this.ID = this.$route.query.id;
        // console.log(this.ID)
        this.getOneList();
        this.axios.get("/home/details", {
            params: {
              pid: this.ID,
            },
          })
          .then((res) => {
            console.log(res.data);
            this.detailPage = res.data[0];
            this.p_title = res.data[0].p_title;
            this.title = res.data[0].title;
            this.price = res.data[0].price;
            this.pro_title = res.data[0].pro_title;
            this.pid = res.data[0].pid
            this.getDetails()
          })
      }
  },
  created() {
    // this.getDetails();
  },
  mounted() {
    
    this.getHomeDetails()
    },
    computed: {
      // 获取vuex中按照id 传入的当前商品详情，商品库存
      ...mapGetters(['_getProInfo','_getPstock']),
    }
};
</script>


<style scoped>
* {
  margin: 0;
  padding: 0;
}
.details {
  padding-left: 16px;
  padding-right: 16px;
}
van-swipe-item {
  width: 343px;
  height: 343px;
}
.img {
  width: 100%;
  height: 100%;
}
.van-swipe_track {
  margin-bottom: 48px !important;
}
.van-swipe__indicators {
  position: absolute;
  align-items: center;
  bottom: 0;
  display: flex;
  flex-direction: row;
  height: 48px;
  justify-content: center;
  left: 0;
  position: absolute;
  text-align: center;
  width: 100%;
}
.buttom-nav {
  position: fixed;
  right: 0;
  z-index: 888;
  bottom: 0;
  left: 0;
  display: flex;
  height: 56px;
  margin: 0 auto;
  overflow: hidden;
  white-space: nowrap;
  background: #ffffff;
  border-top: 1px solid #ccc;
}
.grid_item {
  float: left;
  width: 100%;
  margin-bottom: 100px;
  /* border-bottom: 1px solid #ccc; */
}
.product-single_vendor {
  font-size: 12px;
  line-height: 20px;
  margin-bottom: 8px;
}
a,
body {
  color: #333333;
}
.product-single_title {
  font-size: 18px;
  line-height: 24px;
  margin-bottom: 8px;
  font-weight: 600;
  color: #212121;
}
.price {
  font-size: 14px;
}
.span {
  margin-left: 5px;
}
.product_desc {
  font-size: 12px;
  padding: 30px 0 0;
  line-height: 1.6;
  color: #808080 !important;
}
.change_option {
  position: relative;
  margin-top: 20px;
  background: rgb(230 230 230 / 40%);
  border-radius: 3px;
  display: flex;
  border: 1px solid #ccc;
  height: 36px;
  padding: 14px 14px 0 14px;
}
.change_option span {
  font-size: 15px;
}
.span_p {
  padding-left: 8px;
}
.span_img {
  position: relative;
  margin-left: 50%;
}
.pro_discount_each {
  margin-top: 15px;
  font-size: 14px;
  line-height: 1.2;
  color: #e81717;
}
.pro-content img {
  width: 100%;
  vertical-align: middle;
}
.share {
  font-size: 12px;
  margin-top: 0;
  padding-top: 10px;
  border-bottom: 1px solid #ccc;
}
.wei img {
  pointer-events: none;
  width: 22px;
  height: 26px;
}
.wei a {
  padding-left: 10px;
}
.collect {
  padding-bottom: 30px;
}
.else {
  font-size: 12px;
  text-align: center;
  font-size: 12px;
  line-height: 1.5;
}
.custom_tips {
  font-size: 12px;
  line-height: 1.5;
  padding: 30px 0;
  border-bottom: 1px solid #ccc;
}
/* .custom_tips span {
  padding-left: 93px;
} */
.van-goods-action >>> .van-goods-action-button--first {
  margin-left: 5px;
  border-top-left-radius: 0px;
  border-bottom-left-radius: 0px;
}
.van-goods-action >>> .van-goods-action-button--last {
  margin-right: 5px;
  border-top-right-radius: 0px;
  border-bottom-right-radius: 0px;
}

/* 购物车样式 */
.van-popup {
  width: 100%;
  margin-top: 24%;
  overflow-y: visible;
}
 .shop-a{
    width: 100%;
    /* position: absolute; */
    z-index: 100;
    bottom: 0;
    border-radius: 0;
    color: #222;
    overflow: visible;
    background-color: #fff;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
}
.product-a{
    padding: 10px 46px 26px 100px;
}
.product-b{
    max-height: 220px;
    overflow: auto;
}
.product-c{
    margin: 20px 5% 30px;
    font-size: 15px;
}
.window-map {
    width: 72px;
    height: 72px;
    float: left;
    margin-right: 10px;
    position: absolute;
    top: -26px;
    left: 20px;
    background: #fff;
    text-align: center;
}
.window-map img{
    display: inline-block;
    margin: auto;
    width: auto;
    height: auto;
    max-width: 100%;
    max-height: 100%;
    vertical-align: middle;
    position: absolute;
    z-index: 1;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
}
.price-a{
    font-weight: 700;
    font-size: 15px;
    line-height: 1.6;
}
.sku-item {
    margin: 5px 20px;
    font-size: 13px;
    max-height: 260px;
}
.left {
    display: block;
    width: 100%;
    margin-bottom: 8px;
    line-height: 1.5;
    margin-right: 12px;
    font-size: 15px;
}
.right{
    display: block;
    width: 100%;
}
.btn .selected{
    background: #fff;
    color: #212121;
    border: 1px solid #212121;
}
.sku .sku-item .right .btn.btn-xs {
    font-size: 15px;
    padding: 0 10px;
    height: 30px;
    box-sizing: border-box;
    line-height: 28px;
    min-width: 34px;
    overflow: hidden;
}
.quantity-selector{
    bottom: -15px;
    margin: 0 20px;
    display: inline-block;
    background: #fff;
    border: none;
    border-radius: 3px;
    color: #666;
}
.btn-c{
  width: 25px;
  height: 20px;
}
.input{
  padding: 0 10px 0 10px;
}
.add{
  width: 100%;
  height: 50px;
  border: none;
  background-color:black;
  color:white;
}
</style>