class AddProduct {
  String? customerId;
  String? productId;
  String? price;
  int? quantity;
  String? updatedAt;
  String? createdAt;
  int? cartId;

  AddProduct(
      {this.customerId,
      this.productId,
      this.price,
      this.quantity,
      this.updatedAt,
      this.createdAt,
      this.cartId});

  factory AddProduct.fromJson(Map<String, dynamic> json) {
    AddProduct product = AddProduct();
    product.customerId = json['customer_id'];
    product.productId = json['product_id'];
    product.price = json['price'];
    product.quantity = json['quantity'];
    product.updatedAt = json['updated_at'];
    product.createdAt = json['created_at'];
    product.cartId = json['cart_id'];
    return product;
  }
}
