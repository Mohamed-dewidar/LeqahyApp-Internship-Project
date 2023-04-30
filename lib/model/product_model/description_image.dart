class DescriptionImage {
  String? productImageId;
  String? productId;
  String? image;
  String? sortOrder;

  DescriptionImage(
      {this.productImageId, this.productId, this.image, this.sortOrder});

  factory DescriptionImage.fromJson(Map<String, dynamic> json) {
    DescriptionImage image = DescriptionImage();
    image.productImageId = json['product_image_id'];
    image.productId = json['product_id'];
    image.image = json['image'];
    image.sortOrder = json['product_id'];
    return image;
  }
}
