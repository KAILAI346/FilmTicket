import Vue from 'vue'
import Router from 'vue-router'
import Login from '../pages/Login/Login'
import Home from '../pages/Home/Home'
import UserManage from '../pages/Home/children/UserManage'
import MovieManage from '../pages/Home/children/MovieManage'
import CinemaManage from '../pages/Home/children/CinemaManage'
import OrderManage from '../pages/Home/children/OrderManage'
import CommentManage from '../pages/Home/children/CommentManage'
import HomeCinema from '../pages/home-cinema/HomeCinema'
import CHallManage from '../pages/home-cinema/children/HallManage'
import CMovieSchedule from '../pages/home-cinema/children/MovieSchedule'
import COrderManage from '../pages/home-cinema/children/OrderManage'
import BoxOffice from '../pages/home-cinema/children/BoxOffice'

Vue.use(Router);

export default new Router({
  routes: [
    {path:'/',redirect:'/login',},
    {
      path:'/login',
      name:'login',
      component:Login
    },
    {
      path: '/home',
      name: 'home',
      component: Home,
      children:[
        {path:'user_manage',component:UserManage},
        {path:'movie_manage',component:MovieManage},
        {path:'cinema_manage',component:CinemaManage},
        {path:'order_manage',component:OrderManage},
        {path:'comment_manage',component:CommentManage},
        {path:'/home',redirect: '/home/user_manage'},

      ]
    },
    {
      path:'/home_cinema',
      name:'cinemaHome',
      component:HomeCinema,
      children:[
        {path:'box_office',component:BoxOffice},
        {path:'movie_schedule',component:CMovieSchedule},
        {path:'hall_manage',component:CHallManage},
        {path:'order_manage',component:COrderManage},
        {path:'/home_cinema',redirect: '/home_cinema/hall_manage'}
      ]
    }
  ]
})
