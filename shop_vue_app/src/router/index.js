import { createRouter, createWebHistory } from "vue-router";
import Products from "../views/Products.vue";
import Product from "../views/Product.vue";
import NewProduct from "../views/NewProduct.vue";
import Basket from "../views/Basket.vue";

const routes = [
  {
    path: "/",
    name: "Products",
    component: Products,
  },
  {
    path: "/:id",
    name: "Product",
    component: Product,
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
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
