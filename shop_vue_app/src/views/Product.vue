<template>
  <body style="background: -webkit-linear-gradient(left, #52b788, #d8f3dc)">
    <div class="container">
      <h1 class="display-1" style="text-align: center">Fresh products</h1>
      <div class="container" style="margin-top: 100px">
        <div class="row">
          <div class="col-sm-6">
            <h1 v-if="product.image !== null">
              <img class="card-img-top" v-bind:src="product.image" />
            </h1>
            <h1 v-else>
              <img class="card-img-top" src="@/assets/fresh.jpg" />
            </h1>
          </div>
          <div class="col-sm-6">
            <div class="row justify-content-md-center">
              <div class="col-md-4">
                <h2>{{ product.name }}</h2>
              </div>
            </div>
            <div class="row justify-content-md-center">
              <div class="col-md-4">
                <p>{{ product.description }}</p>
              </div>
            </div>
            <h5>Price</h5>
            <p>{{ product.price }} RON/ KG</p>
            <p></p>

            <div class="col-sm-3">
              <h4 style="margin-top: 20px">Quantity</h4>
              <select
                class="form-select"
                style="max-width: 2000px"
                id="quantity_drop_down"
              >
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
              <br />
              <button type="button" class="btn btn-dark">Add to basket</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</template>
<script>
export default {
  props: ["id"],

  data() {
    return {
      product: {},
    };
  },
  mounted() {
    fetch("http://localhost:3000/products/" + this.id + ".json")
      .then((res) => res.json())
      .then((data) => (this.product = data))
      .catch((err) => console.log(err.message));
  },
  // methods: {
  //   async fetchAProduct() {
  //     try {
  //       const res = await fetch(
  //         "http://localhost:3000/products/" + this.id + ".json"
  //       );
  //       const data = await res.json();
  //       return data;
  //     } catch (error) {
  //       console.log(error);
  //     }
  //   },
  // },
};
</script>
<style>
/* @import "./assets/css/style.css"; */

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
