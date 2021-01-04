<template>
  <div class="error">
      <h2>{{msg}}</h2>
  </div>
</template>

<script>
export default {
    data() {
        return {
            msg: 'Error:404'
        }
    }
}
</script>

<style>
.error{
    width: 100%;
    text-align: center;
    padding: 30px 0;
    background-color:#ccc;
}
h2{
    font-size: 50px;
}
</style>