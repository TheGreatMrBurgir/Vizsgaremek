<template>
    <div class="product-card">
      <div class="image-container">
        <img :src="image" :alt="name" class="product-image" />
        <button class="wishlist-btn">&#x2661;</button>
      </div>
      <div class="product-info">
        <span v-if="isNew" class="new-badge">NEW</span>
        <h3 class="product-name">{{ name }}</h3>
        <p class="product-fit">{{ fit }}</p>
        <p class="product-color">{{ color }}</p>
        <p class="product-price">{{ price }} Ft</p>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    props: {
      image: String,
      name: String,
      fit: String,
      color: String,
      price: Number,
      isNew: Boolean
    }
  };
  </script>
  
  <style scoped>
  .product-card {
    background: #000;
    color: white;
    padding: 10px;
    border-radius: 5px;
    overflow: hidden;
    position: relative;
  }
  .image-container {
    position: relative;
  }
  .product-image {
    width: 100%;
    border-radius: 5px;
  }
  .wishlist-btn {
    position: absolute;
    top: 10px;
    right: 10px;
    background: transparent;
    border: none;
    color: white;
    font-size: 20px;
    cursor: pointer;
  }
  .new-badge {
    background: white;
    color: black;
    font-size: 12px;
    padding: 3px 5px;
    border-radius: 3px;
    display: inline-block;
    margin-bottom: 5px;
  }
  .product-info {
    padding: 10px;
    text-align: left;
  }
  .product-name {
    font-size: 16px;
    margin: 5px 0;
  }
  .product-price {
    font-weight: bold;
  }
  </style>
  