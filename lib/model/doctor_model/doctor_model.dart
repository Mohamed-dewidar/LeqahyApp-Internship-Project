import 'dart:convert';

class Doctor {
  Doctor({
    this.doctorSpecialityId,
    this.languageId,
    this.specialityName,
    this.doctorId,
    this.doctorImage,
    this.dayOff,
    this.email,
    this.telephone,
    this.status,
    this.token,
    this.code,
    this.price,
    this.sortOrder,
    this.dateAdded,
    this.doctorName,
    this.description,
    this.labDescription,
    this.metaTitle,
    this.metaDescription,
    this.metaKeyword,
    this.image,
  });

  String? doctorSpecialityId;
  String? languageId;
  String? specialityName;
  String? doctorId;
  String? doctorImage;
  String? dayOff;
  String? email;
  String? telephone;
  String? status;
  dynamic token;
  dynamic code;
  String? price;
  String? sortOrder;
  dynamic dateAdded;
  String? doctorName;
  String? description;
  String? labDescription;
  String? metaTitle;
  String? metaDescription;
  String? metaKeyword;
  String? image;

  factory Doctor.fromJson(Map<String?, dynamic> json) => Doctor(
        doctorSpecialityId: json["doctor_speciality_id"],
        languageId: json["language_id"],
        specialityName: json["Speciality Name"],
        doctorId: json["doctor_id"],
        doctorImage: json["doctor_image"],
        dayOff: json["day_off"],
        email: json["email"],
        telephone: json["telephone"],
        status: json["status"],
        token: json["token"],
        code: json["code"],
        price: json["price"],
        sortOrder: json["sort_order"],
        dateAdded: json["date_added"],
        doctorName: json["Doctor_name"],
        description: json["description"],
        labDescription: json["lab_description"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaKeyword: json["meta_keyword"],
        image: json["image"],
      );

  Map<String?, dynamic> toJson() => {
        "doctor_speciality_id": doctorSpecialityId,
        "language_id": languageId,
        "Speciality Name": specialityName,
        "doctor_id": doctorId,
        "doctor_image": doctorImage,
        "day_off": dayOff,
        "email": email,
        "telephone": telephone,
        "status": status,
        "token": token,
        "code": code,
        "price": price,
        "sort_order": sortOrder,
        "date_added": dateAdded,
        "Doctor_name": doctorName,
        "description": description,
        "lab_description": labDescription,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_keyword": metaKeyword,
        "image": image,
      };
}
