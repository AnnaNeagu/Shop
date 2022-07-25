<template>
  <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
    crossorigin="anonymous"
  />
  <div class="topnav">
    <router-link :to="{ name: 'Products' }"> <b>Products</b> </router-link>

    <div v-if="status_admin == 'true'">
      <router-link :to="{ name: 'NewProduct' }">
        <b>New Product </b></router-link
      >
    </div>
    <s v-if="email_user != null">
      <router-link :to="{ name: 'Basket' }"><b> Basket </b></router-link>
    </s>
    <h1 v-if="email_user !== NULL">
      <a style="float: right; color: #04aa6d" @click="logout()"
        ><b>Logout</b></a
      >
      <router-link
        :to="{ name: 'Orders' }"
        style="float: right"
        @click="setuser()"
        ><b> Orders </b></router-link
      >
      <h5 style="float: right; margin-top: 10px">Welcome, {{ email_user }}!</h5>
    </h1>
    <p v-else style="float: right">
      <router-link :to="{ name: 'Login' }"> <b>Login </b> </router-link>
      <router-link :to="{ name: 'SignUp' }"> <b>Sign Up </b> </router-link>
    </p>
  </div>
  <router-view />
</template>
<script>
import axios from "axios";
export default {
  props: {
    id_p: Object,
  },
  params: {
    check_session: Object,
  },
  data() {
    let keys = Object.keys(sessionStorage);
    return {
      keys: Object.keys(sessionStorage),
      email: keys[0],
      email_user: document.cookie
        .split("; ")
        .find((row) => row.startsWith("email="))
        ?.split("=")[1],
      id_user: document.cookie
        .split("; ")
        .find((row) => row.startsWith("id="))
        ?.split("=")[1],
      status_admin: document.cookie
        .split("; ")
        .find((row) => row.startsWith("admin="))
        ?.split("=")[1],
      check_sessions: [],
    };
  },
  mounted() {
    fetch("http://localhost:3000/apis/products/v1/check_sessions")
      .then((res) => res.json())
      .then((data) => (this.check_sessions = data))
      .catch((err) => console.log(err.message));

    console.log("Aici e sesion lenght " + sessionStorage.length);

    if (sessionStorage.length == 0) {
      const res = axios.post(
        "http://localhost:3000/apis/products/v1/check_sessions",
        {
          value: sessionStorage.length,
          headers: {
            origin: "http://localhost:3000",
          },
        }
      );
      if (res.status == 200) {
        this.$router.go(0);
      }
    } else {
      console.log(this.alex);
      const res = axios.put(
        "http://localhost:3000/apis/products/v1/check_sessions/" + 17,
        {
          value: sessionStorage.length,
          headers: {
            origin: "http://localhost:3000",
          },
        }
      );
      if (res.status == 200) {
        this.$router.go(0);
      }
    }
  },

  methods: {
    async logout() {
      document.cookie = "email" + "=; expires=Thu, 01-Jan-70 00:00:01 GMT;";
      document.cookie = "admin" + "=; expires=Thu, 01-Jan-70 00:00:01 GMT;";
      sessionStorage.clear();
      window.location.href = "/";
    },
    async setuser() {
      const res = await axios.post(
        "http://localhost:3000/apis/products/v1/orders",
        {
          user: this.id_user,
          headers: {
            origin: "http://localhost:3000",
          },
        }
      );
      // sessionStorage.setItem("test", 1);
      // alert(sessionStorage.getItem("test")); // after refresh: 1
      console.log(res);
      if (res.status == 200) {
        this.$router.replace({ name: "Orders" });
      }
    },
  },
};
</script>
>
<style>
.card:hover {
  -webkit-box-shadow: -1px 9px 40px -12px rgba(0, 0, 0, 0.75);
  -moz-box-shadow: -1px 9px 40px -12px rgba(0, 0, 0, 0.75);
  box-shadow: -1px 9px 40px -12px rgba(0, 0, 0, 0.75);
}
/* _card.scss:41 */
.card-title {
  color: green;
}
.card-text {
  color: green;
}
body {
  margin: 0;
  /* font-family: Times New Roman, Helvetica, sans-serif; */
  background: -webkit-linear-gradient(left, #52b788, #d8f3dc);
}
.topnav {
  overflow: hidden;
  background-color: -webkit-linear-gradient(left, #52b788, #d8f3dc);
}
.topnav a {
  float: left;
  display: block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}
.topnav a:hover {
  background-color: black;
  color: #52b788;
}
.topnav a.active {
  background-color: #04aa6d;
  color: #52b788;
}
.topnav .icon {
  display: none;
}
@media screen and (max-width: 600px) {
  .topnav a:not(:first-child) {
    display: none;
  }
  .topnav a.icon {
    float: right;
    display: block;
  }
}
@media screen and (max-width: 600px) {
  .topnav.responsive {
    position: relative;
  }
  .topnav.responsive .icon {
    position: absolute;
    right: 0;
    top: 0;
  }
  .topnav.responsive a {
    float: none;
    display: block;
    text-align: left;
  }
}
</style>
