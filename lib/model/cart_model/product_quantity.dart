class ProductQuantity {
  String? mainQuantity;
  String? cartQuantity;

  ProductQuantity({this.mainQuantity, this.cartQuantity});

  factory ProductQuantity.fromJson(Map<String, dynamic> json) {
    ProductQuantity product = ProductQuantity();
    product.mainQuantity = json['Main Quantity'];
    product.cartQuantity = json['Cart Quantity'];
    return product;
  }
}
