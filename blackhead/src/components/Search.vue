<template>
  <div class="layout" v-show="show">
        <div class="layoutPop" @click.prevent="hide">
        </div>
        <div class="layoutCont">
            <div class="searchPop">
                <input name="terms" v-model="getkeyword" @keyup.enter="search" type="text" placeholder="" autocomplete="off">
                <div class="searchPop-submit">
                    <i  @click="search">搜索</i>
                </div>
            </div>
        </div>
  </div>
</template>

<script>
export default {
    data() {
        return {
            show:true,
            getkeyword:''
        }
    },
    methods:{
        hide(){
            // console.log(this.$parent)
            this.$parent.isSearch = false
        },
        search() {
            // 触发当前实例上的'keyword'事件,后面的keyword是let 声明的变量
            // this.Bus.$emit('keyword',keyword)
            this.$router.push('/search?keyword=' + this.getkeyword);
            // this.$store.commit('getkeyword',this.getkeyword);
            this.$store.commit('share',this.msg);
            this.show = !this.show;
        }
    }
}
</script>

<style scoped>
*{
    margin: 0;padding: 0;border: 0;
}
.layout{
    width: 100%;
    height: 100%;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 997;
}
.layoutPop {
    width: 100%;
    height: 100%;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 998;
    background: rgba(0, 0, 0, .7);
}
.layoutCont{
    width: 90%;
    text-align: center;
    max-width: 600px;
    position: absolute;
    top: 40%;
    left: 5%;
    z-index: 999;
}

.searchPop {
    width: 100%;
    height: 46px;
    line-height: 46px;
    padding: 0 5px 0 0;
    box-sizing: border-box;
    position: relative;
    background: #d7d8dc;
    border-radius: 5px;
}

.searchPop input {
    width: 100%;
    height: 100%;
    border: none;
    border-radius: 5px 0 0 5px;
    box-sizing: border-box;
    padding: 0 20px;
    background: #d7d8dc;
    font-size: 16px;
}

.searchPop .searchPop-submit {
    cursor: pointer;
    width: 80px;
    height: 46px;
    position: absolute;
    top: 0;
    right: 0;
    border-width: 0;
    border-style: solid;
    border-color: #262626;
    border-radius: 0 5px 5px 0;
    box-sizing: border-box;
    text-align: center;
    font-size: 16px;
}

i {
    font-style: normal;
    text-align: center;
    font-size: 16px;
    line-height: 46px;
    color: #000;
}

</style>