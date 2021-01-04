<template>
  <!--底部选项卡开始  -->
    <div>
      <mt-tabbar fixed v-model="tabbar" class="footer">
        <mt-tab-item id="home">
          首页
          <img src="../assets/img/home.svg" slot="icon" />
        </mt-tab-item>
        <mt-tab-item id="product">
          商品
          <img src="../assets/img/fl.svg" slot="icon" />
        </mt-tab-item>
        <mt-tab-item id="shop">
          购物袋
          <img src="../assets/img/shop.svg" slot="icon" />
        </mt-tab-item>
        <mt-tab-item id="me">
          我的订单
          <img src="../assets/img/ding.svg" slot="icon" />
        </mt-tab-item>
      </mt-tabbar>
    </div>
    <!--底部选项卡结束  -->
</template>

<script>
export default {
    data() {
        return {
            tabbar: "",
        }
    },
    watch: {
      // 监听底部选项卡
      tabbar(value) {
        if (value == "home") {
          this.$router.push("/");
        }
        if (value == "product") {
          this.$router.push("/product");
        }
        if (value == "shop") {
          this.$router.push("/shop");
        }
        if (value == "me") {
          this.$router.push("/login");
        }
      }
    },
    mounted() {
      if(this.isLogined) {
        this.$router.push('/myAccount');
      }
    }
}
</script>

<style scoped>
*{margin: 0;padding: 0;}
.footer {
  height: 57px;
  margin-top: 0px;
}
.footer img {
  width: 20px;
  height: 20px;
}
.mint-tabbar>.mint-tab-item.is-selected {
    background-color:#fafafa;
    color:black;
    border-top: 1px solid #D9D9D9;
}
</style>