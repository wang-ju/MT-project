<template>
  <div class="home">
    <!-- header -->
    <Header></Header>
    <!--1. 轮播图 -->
    <mt-swipe class="swipe" :auto="5000" :speed="300" style="margin-top:56px">
      <mt-swipe-item v-for="(item,key) in imgList" :key="key">
        <img :src="'http://127.0.0.1:5050' + item.banner" alt="" />
      </mt-swipe-item>
    </mt-swipe>

    <!--2. 字体滚动-->
    <marquee>
      <div class="hot-tag-item">
        <router-link to=""> BLACKHEAD </router-link>
      </div>
    </marquee>

    <!--3. 跑马灯 -->

    <!--4. lookbook -->
    <div>
      <div class="home_section">
        <h2>LOOKBOOK</h2>
      </div>
      <div class="home_carousel">
        <img src="../assets/img/look.jpg" alt="" />
      </div>
    </div>

    <!-- 5. bestsell -->
    <div class="best">
      <div class="home_section">
        <h2>BESTSELL</h2>
      </div>
      <div class="show">
        <div class="products" v-for="(k,i) of Bestsell" :key="i">
          <router-link :to="{path:'/details',query:{id:k.bid}}">
          <img :src="'http://127.0.0.1:5050' + k.b_img" alt="" />
          <div class="title">
            <h3>{{k.title}}</h3>
            <p>RMB {{k.price}}</p>
          </div>
        </router-link>
        </div>
      </div>
    </div>

    <!--6.series -->
    <div class="series">
        <div class="series_1"> 
            <h2 class="h_2">SERIES</h2>
            <div class="series_2" v-for="(k,i) of Series" :key="i">
                <router-link to="">
                  <img :src="'http://127.0.0.1:5050' + k.Series" alt="" />
                </router-link>
            </div>
        </div>
    </div>

    <!--7. footer图片 -->
    <div class="about">
        <img src="../assets/img/footer.jpg" alt="" />
    </div>

    <!--8. footer -->
    <Footer></Footer>
    <!--底部选项卡开始  -->
    <Footed></Footed>
    <!--底部选项卡结束  -->
  </div>
</template>

<script>
import Header from '../components/Header'
import Footer from '../components/Footer'
import Footed from '../components/Footed'
import Details from '../views/Details'

export default {
   components:{
    Header,Footer,Footed,Details
  },
  data() {
    return {
      imgList: [],
      Bestsell:[],
      Series:{}
    };
  },
  methods: {
    getBannerList() {
      this.axios.get("/home/banner").then((res) => {
        console.log(res.data);
        this.imgList = res.data;
      });
    }
  },
  mounted() {
    this.getBannerList();

    this.axios.get("/home/Bestsell").then((result)=>{
        console.log(result.data);
        this.Bestsell = result.data;
      })

    this.axios.get("/home/Series").then((result)=>{
        console.log(result.data);
        this.Series = result.data;
    })
  },
};
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
}
.swipe {
  height: 650px;
  width: 100%;
}
.swipe img {
  width: 100%;
  height: 100%;
}
.footer {
  height: 57px;
  margin-top: 0px;
}
.footer img {
  width: 20px;
  height: 20px;
}
marquee {
  margin-bottom: 57px;
  line-height: 35px;
  padding: 20px 0;
}
marquee a {
  font-size: 22px;
  font-weight: bold;
  font-family: "Helvetica Neue", "Hiragino Sans GB", "PingFang SC",
    "Microsoft Yahei", sans-serif;
  color: #fff;
  cursor: pointer;
  text-decoration: none;
}
.hot-tag-item {
  left: 0%;
  color: #fff;
  margin-right: 50px;
  font-size: 28px !important;
  text-shadow: -1px 0 #212121, 0 1px #212121, 1px 0 #212121, 0 -1px #212121;
}
.home_section {
  margin-bottom: 30px;
}
h2 {
  color: #212121;
  font-size: 20px;
  line-height: 24px;
  font-weight: 400;
  text-align: center;
}
.home_carousel {
  margin-bottom: 0;
  margin-top: 50px;
  overflow: hidden;
  margin-left: 10px;
  margin-right: 10px;
  width: 90%;
  padding-bottom: 70px;
  padding-left: 3%;
  padding-right: 3%;
  box-sizing: border-box;
}
.home_carousel img {
  width: 100%;
  height: 100%;
}
.best {
  padding-bottom: 70px;
}
.show{
  text-align: left;
  max-width: 1280px;
}
.products{
  width: 50%;
  float: left;
}
.show a {
  /* color: #333; */
  text-decoration: none;
  background-color: transparent;
  cursor: pointer;
  padding: 0 1px 2px 0;
  width: 50%;
}
.show img{
  height: 187px;
  width: 100%;
}
.title h3 {
  font-size: 14px;
  line-height: 20px;
  color: #212121;
  font-weight: 400;
  text-overflow: ellipsis;
  overflow: hidden;
  white-space: nowrap;
}
.title{
  padding: 15px 10px 20px;
}
.title p{
  text-transform: uppercase;
    font-size: 14px;
    line-height: 16px;
    margin-top: .5em;
    color: #333333;
    text-align: center;
}
.series{
  padding-bottom: 0;
}
.series_1{
  padding-left: 0;
  padding-right: 0;
  padding-top: 20px;
}
.h_2{
  margin-bottom: 30px;
  font-size: 20px;
  line-height: 24px;
  box-sizing: inherit;
  color: #212121;
  font-weight: 400;
}
.series_2{
  display: flex;
  flex-wrap: wrap;
  color: #fff;
}
.series_2 img{
  width: 100%;
  height: 100%;
}
.about{
  padding-top: 0;
  height: 440px;
  width: 375px;
}
.about img{
  width: 100%;
  height: 100%;
}
.mint-tabbar>>>.mint-tab-item.is-selected {
    background-color:#fafafa;
    color:black;
    border-top: 1px solid #D9D9D9;
}

</style>
