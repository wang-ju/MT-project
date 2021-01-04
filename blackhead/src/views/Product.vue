<template>
  <div>
    <!-- 标题 -->
    <Header></Header>

    <!-- 筛选 -->
    <div style="margin-top:56px">
      <van-dropdown-menu>
        <van-dropdown-item v-model="value1" :options="option1" title="分类" />
        <van-dropdown-item v-model="value2" :options="option2" title="筛选" />
      </van-dropdown-menu>
    </div>

    <!-- 所有商品 -->
    <div class="home">
      <section class="home_section">
        <h3 class="h3">所有商品</h3>
        <van-row gutter="20" type="flex" justify="space-around" >
          <van-col span="10" v-for="(k, i) of Products" :key="i">
            <div class="products">
              <router-link :to="{path:'/details',query:{id:k.pid}}">
                <!-- <img :src="'http://127.0.0.1:5050' + k.img" /> -->
                <img v-lazy="'http://127.0.0.1:5050' + k.img" />
                <div class="title">
                  <h3>{{ k.title }}</h3>
                  <p>RMB {{ k.price }}</p>
                </div>
              </router-link>
            </div>
          </van-col>
        </van-row>
      </section>
    </div>

    <!-- 分页 -->
    <van-pagination
      v-model="currentPage"
      @change="next"
      :total-items="60"
      :show-page-size="3"
      :page-count="6"
      force-ellipses
    />

    <!-- footer -->
    <Footer></Footer>

    <!--底部选项卡开始  -->
    <Footed></Footed>
    <!--底部选项卡结束  -->
  </div>
</template>

<script>
import Header from "../components/Header";
import Footer from "../components/Footer";
import Footed from "../components/Footed";

export default {
  components: {
    Header,
    Footer,
    Footed
  },
  data() {
    return {
      value1: 0,
      value2: "a",
      option1: [
        { text: "全部商品", value: 0 },
        { text: "新款商品", value: 1 },
        { text: "活动商品", value: 2 },
      ],
      option2: [
        { text: "默认排序", value: "a" },
        { text: "好评排序", value: "b" },
        { text: "销量排序", value: "c" },
      ],
      Products: [],
      currentPage: 1,
      tabbar: "",
      // 初始化的页码
      page:1,
      // 储存总页数
      pagecount:0
    };
  },
  methods: {
    // 加载数据的方法
    loadData(page){
      let str = '?' + this.qs.stringify({page:page});
      this.axios.get('/home/product' + str)
      .then((res) => {
        console.log(res.data.results)
        // 获取总页数
        this.pagecount = res.data.pagecount;
        // 获取数据
        this.Products = res.data.results;
      })
    },
    // 点击按钮时调用的方法
    next(pg){
      // 页码累加
      // this.page++;
      this.page = pg;
      // 调用loadData()方法
      if(this.page <= this.pagecount){
        this.loadData(this.page);
      }
      console.log(pg)
    }
  },
  mounted() {
    this.loadData(this.page);
  },
};
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
}
.van-dropdown-menu >>> .van-dropdown-menu__bar {
  height: 44px;
}
.van-dropdown-menu >>> .van-dropdown-menu__title {
  font-size: 13px;
}
.home {
  padding-top: 30px;
  width: 100%;
}
.home_section {
  /* padding-bottom: 70px; */
  position: relative;
}
.h3 {
  text-align: center;
  margin: 0px 0 20px 0;
  font-size: 16px;
  line-height: 20px;
  font-weight: 400;
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
.van-pagination >>> .van-pagination__item {
  color: #333333;
  font-size: 14px;
  height: 24px;
}
.van-pagination >>> .van-pagination__item--active {
  background-color: white;
  border-bottom: 2px solid #000;
}
.van-pagination >>> .van-pagination__item--disabled {
  background-color: white;
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
</style>
