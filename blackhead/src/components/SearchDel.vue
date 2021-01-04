<template>
  <div>
    <!--顶部 -->
    <Header></Header>
    <!-- 背景图片 -->
    <div>
      <img class="brandimg" src="../assets/img/account.jpg" alt />
      <p class="niname">{{keyword}}</p>
    </div>
    <!-- 筛选 -->
    <dropdown></dropdown>
    <!-- 搜索商品 -->
    <van-row gutter="20" type="flex" justify="space-around">
        <van-col span="10" v-for="(s,index) of Select" :key="index">
              <div class="products">
                <router-link :to="{path:'/details',query:{id:s.pid}}">
                    <!-- <img :src="'http://127.0.0.1:5050' + k.img" /> -->
                    <img v-lazy="'http://127.0.0.1:5050' + s.img" />
                    <div class="title">
                    <h3>{{s.title}}</h3>
                    <p>RMB {{ s.price }}</p>
                    </div>
                </router-link>
            </div>
        </van-col>
        <van-col span="10"></van-col>
    </van-row>
    <!-- 分页 -->
    <!-- <van-pagination
      v-model="currentPage"
      :total-items="60"
      :show-page-size="3"
      :page-count="6"
      force-ellipses
    /> -->
    <!-- footer -->
    <Footer></Footer>
    <!-- 底部 -->
    <Footed></Footed>
  </div>
</template>

<script>
import Header from "../components/Header";
import Footer from "../components/Footer";
import Footed from "../components/Footed";
import Dropdown from "../components/Dropdown";

import {mapState,mapGetters} from 'vuex'

export default {
  data() {
      return {
          Select:[],
          currentPage: 1,
          keyword: '',
          tabbar: "",
          }
  },
  computed: {
    // ...mapState(['keyword']),
    ...mapGetters(['shareInfo'])
  },
  // watch: {
  //   keyword() {
  //     this.getSelect()
  //   }
  // },
  methods: {
      getSelect() {
        this.axios.get('/search',{
            params:{
                keyword:this.keyword
            }
        }).then(result=>{
            this.Select = result.data;
            console.log(result.data);
        })
      }
  },
  beforeRouteUpdate(to, from, next) {
    this.keyword = to.query.keyword;
    this.getSelect();
    next();
  },
  mounted() {
    this.keyword = this.$route.query.keyword;
    this.getSelect();
  },
  components: {
    Header,
    Footer,
    Footed,
    Dropdown
  }
};
</script>

<style>
*{margin: 0;padding: 0;}
.brandimg {
  width: 100%;
  position: absolute;
  left: 0;
  top: 0;
  overflow: hidden;
  height: 50vw;
  object-fit: cover;
  margin-top: 56px;
  z-index: 0;
}
.niname {
  text-align: center;
  margin-top: 150px;
  font-size: 16px;
  line-height: 20px;
  position: relative;
  color: #fff;
}
.products {
  width: 100%;
}
.products>a>img{
  width: 100%;
  max-height: 178px;
  height: 187px;
}
.title {
  box-sizing: border-box;
  padding: 15px 10px 20px;
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
.title p {
  text-transform: uppercase;
  font-size: 14px;
  line-height: 16px;
  margin-top: 0.5em;
  color: #333333;
  text-align: center;
}
.van-pagination {
  width: 100%;
  margin: 0 auto 0;
  text-align: center;
  padding-bottom: 40px;
  font-size: 14px;
  padding-top: 70px;
}
.van-pagination > .van-pagination__item {
  color: #333333;
  font-size: 14px;
  height: 24px;
}
.van-pagination > .van-pagination__item--active {
  background-color: white;
  border-bottom: 2px solid #000;
}
.van-pagination > .van-pagination__item--disabled {
  background-color: white;
}
</style>