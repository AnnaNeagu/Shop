import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import * as Vue from "vue"; // in Vue 3
import axios from "axios";
import VueAxios from "vue-axios";
import Vuex from "vuex";
import VueSweetalert2 from "vue-sweetalert2";
import "sweetalert2/dist/sweetalert2.min.css";

const app = Vue.createApp(App);
app.use(VueAxios, axios);

export const store = new Vuex.Store({
  state: {
    authenticated: false,
  },
  mutations: {
    setAuthentication(state, status) {
      state.authenticated = status;
    },
  },
});

const options = {
  confirmButtonColor: "#556b2f",
};

createApp(App).use(router).use(VueSweetalert2, options).mount("#app");

import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap/dist/js/bootstrap.min.js";
