class ZoneModel {
  String? zoneId;
  String? countryId;
  String? name;
  String? code;
  String? status;

  ZoneModel({this.zoneId, this.countryId, this.name, this.code, this.status});

  factory ZoneModel.fromJson(Map<String, dynamic> json) => ZoneModel(
      zoneId: json['zone_id'],
      countryId: json['country_id'],
      name: json['name'],
      code: json['code'],
      status: json['status']);
}
