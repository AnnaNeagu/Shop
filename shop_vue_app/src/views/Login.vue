<template>
  <body style="background: -webkit-linear-gradient(left, #52b788, #d8f3dc)">
    <div class="register">
      <div class="row">
        <div class="col-md-3 register-left" style="margin-top: 150px">
          <h3>Fresh products</h3>
          <a
            class="btn btn-success btn-lg"
            href="/signup"
            role="button"
            style="margin-top: 50px"
            >Sign up</a
          >
        </div>
        <div class="col-md-9 register-right">
          <div class="tab-content" id="myTabContent">
            <div
              class="tab-pane fade show active"
              id="home"
              role="tabpanel"
              aria-labelledby="home-tab"
            >
              <h2 class="register-heading">Log in</h2>
              <div class="row register-form">
                <div class="row justify-content-md-center">
                  <div class="col-md-4">
                    <label for="exampleInputEmail1">Email address</label>
                    <input
                      type="email"
                      class="form-control"
                      id="exampleInputEmail1"
                      aria-describedby="emailHelp"
                      placeholder="Enter email"
                      v-model="state.email"
                    />
                    <span v-if="v$.email.$error" style="color: rgb(0, 0, 0)">
                      {{ v$.email.$errors[0].$message }}
                    </span>
                    <div class="invalid-feedback">
                      Please enter email address.
                    </div>
                  </div>
                </div>
                <div class="row justify-content-md-center">
                  <div class="col-md-4">
                    <label for="exampleInputPassword1">Password</label>
                    <input
                      type="password"
                      class="form-control"
                      id="exampleInputPassword1"
                      placeholder="Password"
                      v-model="state.password"
                    />
                    <span v-if="v$.password.$error" class="error">
                      {{ v$.password.$errors[0].$message }}
                    </span>
                    <div class="invalid-feedback">Please enter password.</div>
                  </div>
                </div>
                <div class="row justify-content-md-center">
                  <div class="col-md-4"></div>
                </div>
                <div class="row justify-content-md-center">
                  <div
                    class="form-group"
                    align="center"
                    style="color: 52b788; margin-top: 20px"
                  >
                    <button
                      @click="login(state.email, state.password)"
                      type="submit"
                      class="btn btn-success"
                    >
                      Log in
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</template>
<script>
import useValidate from "@vuelidate/core";
import { required, email, minLength } from "@vuelidate/validators";
import { reactive, computed } from "vue";
export default {
  name: "Basket",
  props: {},
  setup() {
    const state = reactive({
      email: "",
      password: "",
    });

    const rules = computed(() => {
      return {
        email: { required, email },
        password: { required, minLenght: minLength(3) },
      };
    });
    const v$ = useValidate(rules, state);

    return {
      state,
      v$,
    };
  },
  data() {
    return {
      email: "",
      password: "",
    };
  },
  methods: {
    async login(email, password) {
      this.v$.$validate();
      if (!this.v$.$error) {
        alert("Form successfuly submitted.");
        if (localStorage.getItem(email) !== null) {
          // console.log(`${email}: ${localStorage.getItem(email)}`);
          // console.log(localStorage.getItem(email));
          if (password == localStorage.getItem(email)) {
            console.log(`Email address exists`);
            sessionStorage.setItem(email, password);
            window.location.href = "/order";
          }
          sessionStorage.setItem(email, password);
        }
      } else {
        alert("Form failed validation.");
        console.log(this.state.email);
        console.log(this.state.password);
      }

      // localStorage.setItem(email, pass);
      // window.location.href = "/order";
    },
  },
};
</script>

<style scoped>
.register {
  background: -webkit-linear-gradient(left, #52b788, #d8f3dc);
  margin-top: 3%;
  padding: 3%;
}
.register-left {
  text-align: center;
  color: #fff;
  margin-top: 4%;
}
.register-left input {
  border: none;
  border-radius: 1.5rem;
  padding: 2%;
  width: 60%;
  background: #f8f9fa;
  font-weight: bold;
  color: #383d41;
  margin-top: 30%;
  margin-bottom: 3%;
  cursor: pointer;
}
.register-right {
  background: #f8f9fa;
  border-top-left-radius: 10% 50%;
  border-bottom-left-radius: 10% 50%;
}
.register-left img {
  margin-top: 15%;
  margin-bottom: 5%;
  width: 25%;
  -webkit-animation: mover 2s infinite alternate;
  animation: mover 1s infinite alternate;
}
@-webkit-keyframes mover {
  0% {
    transform: translateY(0);
  }
  100% {
    transform: translateY(-20px);
  }
}
@keyframes mover {
  0% {
    transform: translateY(0);
  }
  100% {
    transform: translateY(-20px);
  }
}
.register-left p {
  font-weight: lighter;
  padding: 12%;
  margin-top: -9%;
}
.register .register-form {
  padding: 10%;
  margin-top: 10%;
}
.btnRegister {
  float: right;
  margin-top: 10%;
  border: none;
  border-radius: 1.5rem;
  padding: 2%;
  background: #0062cc;
  color: #fff;
  font-weight: 600;
  width: 50%;
  cursor: pointer;
}
.register .nav-tabs {
  margin-top: 3%;
  border: none;
  background: #0062cc;
  border-radius: 1.5rem;
  width: 28%;
  float: right;
}
.register .nav-tabs .nav-link {
  padding: 2%;
  height: 34px;
  font-weight: 600;
  color: #fff;
  border-top-right-radius: 1.5rem;
  border-bottom-right-radius: 1.5rem;
}
.register .nav-tabs .nav-link:hover {
  border: none;
}
.register .nav-tabs .nav-link.active {
  width: 100px;
  color: #0062cc;
  border: 2px solid #0062cc;
  border-top-left-radius: 1.5rem;
  border-bottom-left-radius: 1.5rem;
}
.register-heading {
  text-align: center;
  margin-top: 8%;
  margin-bottom: -15%;
  color: #495057;
}
/* .container{
            margin-top: 8%;
            margin-left: 8%;
            } */
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
.error {
  border-color: red;
  background: #fdd;
}
</style>
