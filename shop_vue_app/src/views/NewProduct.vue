<template>
  <body style="background: -webkit-linear-gradient(left, #52b788, #d8f3dc)">
    <div class="register">
      <div class="row">
        <div class="col-md-3 register-left">
          <img
            src="https://cdn.picpng.com/tree/transparency-tree-25046.png"
            alt=""
          />
          <h3>Fresh products</h3>
          <p>In this section, you can add a new product!</p>
        </div>
        <div class="col-md-9 register-right">
          <div class="tab-content" id="myTabContent">
            <div
              class="tab-pane fade show active"
              id="home"
              role="tabpanel"
              aria-labelledby="home-tab"
            >
              <h3 class="register-heading">New product</h3>
              <div class="row register-form">
                <form>
                  <div class="row justify-content-md-center">
                    <div class="col-md-4">
                      <label>Name</label>
                      <input
                        type="text"
                        class="form-control"
                        placeholder="Name"
                        v-model="state.name"
                      />
                      <span v-if="v$.name.$error">
                        {{ v$.name.$errors[0].$message }}
                      </span>

                      <div class="invalid-feedback">Please enter a name.</div>
                    </div>
                    <div class="col-md-4">
                      <label>Bar code</label>
                      <input
                        type="text"
                        class="form-control"
                        placeholder="Bar code"
                        v-model="state.bar_code"
                      />
                      <span v-if="v$.bar_code.$error">
                        {{ v$.bar_code.$errors[0].$message }}
                      </span>

                      <div class="invalid-feedback">
                        Please enter a bar code.
                      </div>
                    </div>
                  </div>
                  <div class="row justify-content-md-center">
                    <div class="col-md-4">
                      <label> Price </label>
                      <div class="input-group has-validation">
                        <input
                          type="text"
                          class="form-control"
                          placeholder="Price"
                          v-model="state.price"
                        />

                        <span class="input-group-text">RON</span>
                        <div class="invalid-feedback">
                          Please enter a price.
                        </div>
                      </div>
                      <span v-if="v$.price.$error">
                        {{ v$.price.$errors[0].$message }}
                      </span>
                    </div>

                    <div class="col-md-4">
                      <label>Image</label>
                      <input
                        class="form-control"
                        type="file"
                        ref="inputFile"
                        @change="uploadFile()"
                      />
                    </div>
                  </div>

                  <div class="row justify-content-md-center">
                    <div class="col-md-8">
                      <label>Description</label>
                      <input
                        type="text"
                        class="form-control"
                        placeholder="Description"
                        v-model="state.description"
                      />
                      <span v-if="v$.description.$error">
                        {{ v$.description.$errors[0].$message }}
                      </span>
                    </div>

                    <div
                      class="form-group"
                      align="center"
                      style="color: 52b788; margin-top: 20px"
                    >
                      <button
                        type="button"
                        class="btn btn-success"
                        @click="submitForm"
                      >
                        Create product
                      </button>
                    </div>
                  </div>
                </form>
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
import { required } from "@vuelidate/validators";
import { reactive, computed } from "vue";
import axios from "axios";
export default {
  name: "NewProduct",
  setup() {
    const state = reactive({
      name: "",
      bar_code: "",
      price: "",
      image: null,
      description: "",
    });

    const rules = computed(() => {
      return {
        name: { required },
        bar_code: { required },
        price: { required },

        description: { required },
        // description: { required, minLength: minLength(10) },
      };
    });
    const v$ = useValidate(rules, state);

    return {
      state,
      v$,
    };
  },
  methods: {
    // onFileSelected(event) {
    //   this.state.image = event.target.files[0];
    //   console.log(this.state.image.name);
    //   console.log(event.target.files[0]);
    // },

    uploadFile: function () {
      this.state.image = this.$refs.inputFile.files[0];
      console.log(this.state.image);
      console.log(this.state);
    },
    async submitForm() {
      this.v$.$validate();
      if (!this.v$.$error) {
        alert("Form successfuly submitted.");
        //adding data by constant res

        const res = await axios.post(
          //path to rails app
          "http://localhost:3000/apis/products/v1/products",
          {
            //data taken from the form
            name: this.state.name,
            bar_code: this.state.bar_code,
            price: this.state.price,
            picture: this.state.image,
            description: this.state.description,

            headers: {
              origin: "http://localhost:3000",
            },
          }
        );
        console.log(this.state.name);
        console.log(this.state.bar_code);
        console.log(this.state.price);
        console.log(this.state.image);
        console.log(this.state.description);
        //for test in console
        console.log(res);
        //if the data is added correctly
        if (res.status == 200) {
          //redirect to products page
          this.$router.replace({ name: "Products" });
        }
      } else {
        alert("Form failed validation.");
        console.log(this.state.name);
        console.log(this.state.bar_code);
        console.log(this.state.price);
        console.log(this.state.image);
        console.log(this.state.description);
      }
    },
    postData(e) {
      this.axios.post("http://localhost:3000/apis/products/v1/products");
      console.warn(this.state);
      e.preventDefault();
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
</style>
