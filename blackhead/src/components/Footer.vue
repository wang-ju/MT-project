<template>
  <div class="footer">
      <div class="content">
          <ul class="links">
              <li>
                  <router-link to="">关于</router-link>
              </li>
              <li>
                  <router-link to="">联系我们</router-link>
              </li>
              <li>
                  <router-link to="">线下店铺</router-link>
              </li>
              <li class="links_right">Copyright 2019 © BLACKHEAD
                  <router-link to="">沪ICP备15034523号-1</router-link>
              </li>
              <li class="yz">
                  <router-link to="">
                      <img src="../assets/img/yyzz.png" alt="">
                  </router-link>
              </li>
          </ul>
      </div>
  </div>
</template>

<script>
export default {

}
</script>

<style scoped>
*{
    margin: 0%;
    padding: 0%;
}

.footer{
    text-align: center;
}

.content{
    margin-bottom: 56px;
}

.links{
    background: #000000;
    color: #ffffff;
    border-top: 1px solid #000000;
    padding: 15px 0;
    height: auto;
    text-align: center;
}

.links li{
    float: none;
    display: block;
    margin: 0 20px;
    line-height: 43px;
    font-size: 13px;
}

.links>li a{
    color: #ffffff;
    cursor: pointer;
    line-height: 43px;
    font-size: 13px;
    text-decoration: none;
}

.links_right{
    float: none;
    margin: 0 20px;
    font-size: 11px;
    line-height: 2;

}

.yz{
    width: 26px;
    height: 32px;
}

.yz img{
    width: 100%;
    height: 100%;
    margin-left: 150px;
}

</style>
