import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home'
import Product from '../views/Product'
import Details from '../views/Details'
import Login from '../views/Login'
import Res from '../views/Res'
import MyAccount from '../views/MyAccount'
import Shop from '../views/Shop'
import SearchDel from '../components/SearchDel'
import Error from '../components/Error.vue'

// 解决路由重复问题
const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => err)
}

Vue.use(VueRouter)

const routes = [
  {
    path: '*', 
    name: '',
    component: Error
  },
  {
    path: '/search',
    name: 'SearchDel',
    component: SearchDel
  },
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/login',
    name: 'login',
    component: Login
  },
  {
    path: '/res',
    name: 'res',
    component: Res
  },
  {
    path: '/myAccount',
    name: 'myAccount',
    component: MyAccount
  },
  {
    path: '/product',
    name: 'Product',
    component: Product
  },
  {
    path: '/shop',
    name: 'shop',
    component: Shop
  },
  {
    path: '/details',
    name: 'Details',
    component: Details
  }

  // {
    // path: '/about',
    // name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    // component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  // }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
