<template>
  <div id="app">
      <router-view/>
    <tab-bar v-if="$route.meta.showTabBar"/>
  </div>
</template>

<script>
import Vue from 'vue'
import TabBar from './components/TabBar/TabBar'
import 'mint-ui/lib/style.css'
import {Button} from 'element-ui'
  Vue.use(Button)
  Vue.config.productionTip = false;
  
export default {
  name: 'App',
  components: {TabBar}
}
</script>

<style scoped lang="stylus" ref="stylesheet/stylus">
  #app
    width 100%
    height 100%
</style>
