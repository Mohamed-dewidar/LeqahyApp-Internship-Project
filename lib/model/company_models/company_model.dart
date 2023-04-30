class Company {
  int? manfacId;
  String? name;
  String? image;
  String? sortOrder;

  Company({this.manfacId, this.name, this.image, this.sortOrder});

  factory Company.fromJson(Map<String, dynamic> json) {
    Company company = Company();
    company.manfacId = json['manufacturer_id'];
    company.name = json['name'];
    company.image = json['image'];
    company.sortOrder = json['sort_order'];
    return company;
  }
}
