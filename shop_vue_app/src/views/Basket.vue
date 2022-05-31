<template>
  <body style="background: -webkit-linear-gradient(left, #52b788, #d8f3dc)">
    <div class="card">
      <div class="row">
        <div class="col-md-8 cart">
          <div class="title">
            <div class="row">
              <div class="col">
                <h4><b>Basket</b></h4>
              </div>
            </div>
          </div>

          <div v-for="order_item in order_items" :key="order_item.id">
            <div v-for="id_p in keys" :key="id_p">
              <div v-if="order_item.id == id_p">
                <div class="border-top border-bottom">
                  <div class="row main align-items-center">
                    <div class="col-2">
                      <img
                        class="card-img-top"
                        style="height: 90px; width: 90%"
                        v-bind:src="order_item.image"
                      />
                    </div>
                    <div class="col" style="margin-top: 40px">
                      <div class="row text-muted">
                        <h4>
                          {{ order_item.name }} {{ order_item.price }} RON/KG
                        </h4>
                        <h5></h5>
                      </div>
                    </div>
                    <div class="col" style="margin-top: 40px">
                      <select
                        class="form-select"
                        style="max-width: 200px"
                        id="quantity_drop_down"
                        v-model="quantity"
                      >
                        <option value="" selected disabled>
                          {{ order_item.quantity }}
                        </option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                      </select>
                    </div>
                    <div class="col">
                      <button class="btn btn-dark">Update</button>
                      <!-- <%= a.submit("Update", :class => "btn btn-dark", :onClick => "window.location.reload();")%>   
                          
                        <% end %>  -->
                    </div>
                    <div class="col">
                      <h3>{{ order_item.total }} RON</h3>
                    </div>
                    <div class="col">
                      <button
                        type="button"
                        class="btn btn-dark"
                        @click="deleteProduct(order_item.id_item, id_p)"
                      >
                        Delete
                      </button>

                      <!-- <%= button_to "Delete", order_item_path(item), method: :delete, class: "btn btn-outline-dark", :onClick => "window.location.reload();"  %> -->
                    </div>
                  </div>
                </div>
                <!-- <% end %> -->
              </div>
            </div>
          </div>
          <div class="back-to-shop">
            <a href="/products">&leftarrow;</a
            ><span class="text-muted">Back to shop</span>
          </div>
        </div>

        <div class="col-md-4 summary">
          <div>
            <h5><b>ORDER</b></h5>
          </div>

          <div class="row">
            <div class="col text-right">
              <p>
                <b>TOTAL PRICE: {{}} RON </b>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</template>
<script>
import axios from "axios";
export default {
  name: "Basket",
  props: {
    order_item: Object,
    id_p: Object,
    // keys: Object.keys(sessionStorage),
  },

  data() {
    let keys = Object.keys(sessionStorage);
    console.log(keys);
    for (let key of keys) {
      console.log(`${key}: ${sessionStorage.getItem(key)}`);
      console.log(key);
    }
    return {
      order_items: [],
      quantity: "",
      keys: Object.keys(sessionStorage),
    };
  },

  mounted() {
    fetch("http://localhost:3000/apis/products/v1/basket")
      .then((res) => res.json())
      .then((data) => (this.order_items = data))
      .catch((err) => console.log(err.message));
  },

  methods: {
    async deleteProduct(num, id_pp) {
      const res = await axios.delete(
        "http://localhost:3000/apis/products/v1/order_item/" + num
      );
      // console.log(this.order_items);
      console.log(id_pp);
      console.log("ceva");
      // console.log(sessionStorage);
      console.log(num);

      sessionStorage.removeItem(id_pp);
      // this.$delete(this.order_items, this.order_item.id);

      // sessionStorage.clear(id_pp);
      if (res.status == 200) {
        this.$router.go(0);
      }
    },
  },
};
</script>

<style scoped>
.card:hover {
  -webkit-box-shadow: -1px 9px 40px -12px rgba(0, 0, 0, 0.75);
  -moz-box-shadow: -1px 9px 40px -12px rgba(0, 0, 0, 0.75);
  box-shadow: -1px 9px 40px -12px rgba(0, 0, 0, 0.75);
}
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

.title {
  margin-bottom: 5vh;
}
.cart {
  background-color: #fff;
  padding: 4vh 5vh;
  border-bottom-left-radius: 1rem;
  border-top-left-radius: 1rem;
}
@media (max-width: 767px) {
  .cart {
    padding: 4vh;
    border-bottom-left-radius: unset;
    border-top-right-radius: 1rem;
  }
}
.summary {
  background: -webkit-linear-gradient(left, #52b788, #d8f3dc);
  border-top-right-radius: 1rem;
  border-bottom-right-radius: 1rem;
  padding: 4vh;
  color: rgb(65, 65, 65);
}
@media (max-width: 767px) {
  .summary {
    border-top-right-radius: unset;
    border-bottom-left-radius: 1rem;
  }
}
.summary .col-2 {
  padding: 0;
}
.summary .col-10 {
  padding: 0;
}
.row {
  margin: 0;
}
.title b {
  font-size: 1.5rem;
}
.main {
  margin: 0;
  padding: 2vh 0;
  width: 100%;
}
.col-2,
.col {
  padding: 0 1vh;
}
a {
  padding: 0 1vh;
}
.close {
  margin-left: auto;
  font-size: 0.7rem;
}
img {
  width: 3.5rem;
}
.back-to-shop {
  margin-top: 4.5rem;
}
h5 {
  margin-top: 4vh;
}
hr {
  margin-top: 1.25rem;
}
form {
  padding: 2vh 0;
}
select {
  border: 1px solid rgba(0, 0, 0, 0.137);
  padding: 1.5vh 1vh;
  margin-bottom: 4vh;
  outline: none;
  width: 100%;
  background-color: rgb(247, 247, 247);
}
input {
  border: 1px solid rgba(0, 0, 0, 0.137);
  padding: 1vh;
  margin-bottom: 4vh;
  outline: none;
  width: 100%;
  background-color: rgb(247, 247, 247);
}
input:focus::-webkit-input-placeholder {
  color: transparent;
}
.btn {
  background-color: #000;
  border-color: #000;
  color: white;
  width: 100%;
  font-size: 0.7rem;
  padding: 1vh;
  border-radius: 0;
}
.btn:focus {
  box-shadow: none;
  outline: none;
  box-shadow: none;
  color: white;
  -webkit-box-shadow: none;
  -webkit-user-select: none;
  transition: none;
}
.btn:hover {
  color: white;
}
a {
  color: black;
}
a:hover {
  color: black;
  text-decoration: none;
}
#code {
  background-image: linear-gradient(
      to left,
      rgba(255, 255, 255, 0.253),
      rgba(255, 255, 255, 0.185)
    ),
    url("https://img.icons8.com/small/16/000000/long-arrow-right.png");
  background-repeat: no-repeat;
  background-position-x: 95%;
  background-position-y: center;
}
.btn-circle.btn-s {
  width: 40px;
  height: 40px;
  padding: 6px 9px;
  border-radius: 30px;
  font-size: 16px;
  text-align: center;
}
</style>
