class Reservation {
  String? customerName;
  String? customerPhone;
  String? labName;
  String? checkCount;
  String? labVacDate;
  String? reserverName;
  int? labVacStatus;
  String? updatedAt;
  String? createdAt;
  int? id;

  Reservation(
      {this.customerName,
      this.customerPhone,
      this.labName,
      this.checkCount,
      this.labVacDate,
      this.reserverName,
      this.labVacStatus,
      this.updatedAt,
      this.createdAt,
      this.id});

  factory Reservation.fromJson(Map<String, dynamic> json) {
    Reservation reservation = Reservation();
    reservation.customerName = json['customer_name'];
    reservation.customerPhone = json['customer_phone'];
    reservation.labName = json['lab_name'];
    reservation.checkCount = json['check_count'];
    reservation.labVacDate = json['labvac_date'];
    reservation.reserverName = json['reserver_name'];
    reservation.labVacStatus = json['labvac_status'];
    reservation.updatedAt = json['updated_at'];
    reservation.createdAt = json['created_at'];
    reservation.id = json['id'];
    return reservation;
  }
}
