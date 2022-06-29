import { createRouter, createWebHistory } from "vue-router";
import Products from "../views/Products.vue";
import Product from "../views/Product.vue";
import NewProduct from "../views/NewProduct.vue";
import Basket from "../views/Basket.vue";
import Order from "../views/Order.vue";
import Order_info from "../views/Order_info.vue";
import Orders from "../views/Orders.vue";
import Login from "../views/Login.vue";
import SignUp from "../views/SignUp.vue";

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
    path: "/orderinfo",
    name: "Order_info",
    component: Order_info,
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
    path: "/login",
    name: "Login",
    component: Login,
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
