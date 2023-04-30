import 'package:flutter/rendering.dart';

class OcBanners {
  String? bannerId;
  String? name;
  String? status;
  String? bannerImageId;
  String? languageId;
  String? title;
  String? image;
  String? sortOrder;

  OcBanners(
      {this.bannerId,
      this.name,
      this.status,
      this.bannerImageId,
      this.languageId,
      this.title,
      this.image,
      this.sortOrder});

  factory OcBanners.fromJson(Map<String, dynamic> json) {
    OcBanners oc = OcBanners();
    oc.bannerId = json['banner_id'];
    oc.name = json['name'];
    oc.status = json['status'];
    oc.bannerImageId = json['banne_image_id'];
    oc.title = json['title'];
    oc.languageId = json['language_id'];
    oc.image = json['image'];
    oc.sortOrder = json['sort_order'];
    return oc;
  }
}
