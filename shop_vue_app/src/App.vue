<template>
  <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
    crossorigin="anonymous"
  />
  <div class="topnav">
    <router-link :to="{ name: 'Products' }"> <b>Products</b> </router-link>
    <router-link :to="{ name: 'NewProduct' }"> <b>New Product </b></router-link>
    <router-link :to="{ name: 'Basket' }"><b> Basket </b></router-link>
    <!-- <p>ana</p> -->
    <h1 v-if="keys != 0">
      <h5 v-if="keys[0].length > 3">
        <a style="float: right; color: #04aa6d" @click="logout(keys[0])"
          ><b>Logout</b></a
        >
        <p style="float: right; margin-top: 10px">Welcome, {{ keys[0] }}!</p>
      </h5>
      <p v-else style="float: right">
        <router-link :to="{ name: 'Login' }"> <b>Login </b> </router-link>
        <router-link :to="{ name: 'SignUp' }"> <b>Sign Up </b> </router-link>
      </p>
    </h1>
  </div>
  <router-view />
</template>
<script>
export default {
  // name: "Login",
  props: {
    id_p: Object,
  },
  // params: {
  //   email: "",
  //   pass: "",
  // },
  data() {
    let keys = Object.keys(sessionStorage);
    console.log(keys);
    console.log(keys[0]);

    if (keys[0] === "ana@test.com") {
      console.log("string");
    } else console.log("no");

    // const emailRegex = RegExp(
    //   /^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/
    // );
    // if (keys[0].match(emailRegex)) {
    //   console.log("string");
    // } else console.log("no");

    for (let key of keys) {
      console.log(`${key}: ${sessionStorage.getItem(key)}`);
      console.log(key);
    }

    return {
      keys: Object.keys(sessionStorage),
    };
  },
  methods: {
    async logout(email) {
      sessionStorage.removeItem(email);
      window.location.reload();
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
