<template>
  <div id="header_o">
    <div class="header">
      <mt-header  class="shortcut" fixed>
        <span slot="left" @click="show = true">
          <mt-button icon="" class="more" >
              <img src="../assets/img/list.svg" alt="">
              <router-link to="/" class="header_logo">
                  <img src="../assets/img/logo.jpg" alt />
              </router-link>
          </mt-button>
        </span>
        <mt-button icon="" slot="right" @click="isSearch = !isSearch">
            <img src="../assets/img/search.svg" alt="">
        </mt-button>
      </mt-header>
    </div>
    <search v-show="isSearch"></search>
    <van-popup v-model="show" position="right">
      <select></select>
    </van-popup>
  </div>
</template>

<script>
import Search from '../components/Search'
import Select from '../components/Select'

export default {
  components:{
    Search,Select
  },
  data(){
    return {
      isSearch:false,
      show:false
    }
  }
};
</script>

<style scoped>
*{margin: 0;padding: 0;}
.mint-header.shortcut{
 height: 56px;
 background-color: #000;
 line-height: 0px;
}
.shortcut a {
  display: inline-block;
  text-decoration: none;
  margin-left: 130px;
  height: 100%;
}
.more img{
    width: 30px;
    height: 100%;
}
.header_logo img{
    width: auto;
}
</style>