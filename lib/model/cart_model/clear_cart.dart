class ClearCart {
  String? msg;
  ClearCart({this.msg});

  factory ClearCart.fromJson(Map<String, dynamic> json) {
    ClearCart cart = ClearCart();
    cart.msg = json['msg'];
    return cart;
  }
}
