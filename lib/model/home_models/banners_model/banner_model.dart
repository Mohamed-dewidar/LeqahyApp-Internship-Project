import 'oc_banner.dart';

class BannerModel {
  String? status;
  String? errNum;
  String? msg;
  OcBanners? oc;

  BannerModel({this.status, this.errNum, this.msg, this.oc});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    BannerModel banner = BannerModel();
    banner.status = json['status'];
    banner.errNum = json['errNum'];
    banner.msg = json['msg'];
    banner.oc = OcBanners.fromJson(json['Oc_banners']);
    return banner;
  }
}
