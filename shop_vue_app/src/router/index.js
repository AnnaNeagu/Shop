import { createRouter, createWebHistory } from "vue-router";
import Products from "../views/Products.vue";
import Product from "../views/Product.vue";
import NewProduct from "../views/NewProduct.vue";
import Basket from "../views/Basket.vue";
import Order from "../views/Order.vue";
import Order_info from "../views/Order_info.vue";
import Orders from "../views/Orders.vue";
import LogIn from "../components/LogIn.vue";
import Login from "../views/Login.vue";
import Secure from "../views/Secure.vue";
import SignUp from "../views/SignUp.vue";
import Signup from "../components/Signup.vue";
import { store } from "@/main";

// const store = new Vuex.Store({
//   state: {
//     authenticated: false,
//   },
//   mutations: {
//     setAuthentication(state, status) {
//       state.authenticated = status;
//     },
//   },
// });

const routes = [
  {
    path: "/",
    name: "Products",
    component: Products,
  },
  {
    path: "/products/:id",
    name: "Product",
    component: Product,
    props: true,
  },
  {
    path: "/new",
    name: "NewProduct",
    component: NewProduct,
  },
  {
    path: "/basket",
    name: "Basket",
    component: Basket,
  },
  {
    path: "/order",
    name: "Order",
    component: Order,
  },
  {
    path: "/orderinfo/:id",
    name: "Order_info",
    component: Order_info,
    props: true,
  },
  {
    path: "/orders",
    name: "Orders",
    component: Orders,
  },
  {
    path: "/signup",
    name: "SignUp",
    component: SignUp,
  },
  {
    path: "/signuplocal",
    name: "Signup",
    component: Signup,
  },
  {
    path: "/login",
    name: "Login",
    component: Login,
  },
  {
    path: "/logIn",
    name: "LogIn",
    component: LogIn,
  },
  {
    path: "/secure",
    name: "secure",
    component: Secure,
    beforeEnter: (to, from, next) => {
      if (store.state.authenticated == false) {
        next(false);
      } else {
        next();
      }
    },
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
