import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import * as Vue from "vue"; // in Vue 3
import axios from "axios";
import VueAxios from "vue-axios";

const app = Vue.createApp(App);
app.use(VueAxios, axios);

createApp(App).use(router).mount("#app");

import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap/dist/js/bootstrap.min.js";
