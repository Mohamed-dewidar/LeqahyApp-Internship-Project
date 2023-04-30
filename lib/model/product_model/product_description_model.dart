class ProductDescription {
  String? productId;
  String? languageId;
  String? name;
  String? description;
  String? tag;
  String? metaTitle;
  String? metaDescritption;
  String? metaKeyword;

  ProductDescription(
      {this.productId,
      this.languageId,
      this.name,
      this.description,
      this.tag,
      this.metaTitle,
      this.metaDescritption,
      this.metaKeyword});

  factory ProductDescription.fromJson(Map<String, dynamic> json) {
    ProductDescription product = ProductDescription();
    product.productId = json['product_id'];
    product.languageId = json['product_id'];
    product.name = json['name'];
    product.description = json['description'];
    product.tag = json['tag'];
    product.metaTitle = json['meta_title'];
    product.metaDescritption = json['meta_description'];
    product.metaKeyword = json['meta_keyword'];
    return product;
  }
}
