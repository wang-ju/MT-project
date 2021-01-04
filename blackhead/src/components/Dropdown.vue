<template>
  <!-- 筛选 -->
    <div style="margin-top:74px">
      <van-dropdown-menu>
        <van-dropdown-item v-model="value1" :options="option1" title="分类" />
        <van-dropdown-item v-model="value2" :options="option2" title="筛选" />
      </van-dropdown-menu>
    </div>
</template>

<script>
export default {
    data() {
      return {
        value1:0,
        value2:'a',
        option1: [
        { text: "主推系列", value: 0 },
        { text: "饰品分类", value: 1 },
        { text: "箱包", value: 2 },
        { text: "帽子", value: 2 },
        { text: "明星", value: 2 },
        { text: "全部", value: 2 },
      ],
      option2: [],
    }
  },
}
</script>

<style>

.van-dropdown-menu__bar--opened>.van-dropdown-item{
    height: 100%;
    z-index: 1;
}
.van-dropdown-item>.van-popup--top{
    top: 0;
    left: 0;
    width: 50%;
}
</style>