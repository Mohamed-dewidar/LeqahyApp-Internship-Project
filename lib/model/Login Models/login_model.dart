import 'dart:developer';

class Login {
  String? customerId;
  String? customer_group_id;
  String? store_id;
  String? language_id;
  String? firstname;
  String? lastname;
  String? email;
  String? telephone;
  String? fax;
  String? status;

  Login(
      {this.customerId,
      this.customer_group_id,
      this.store_id,
      this.language_id,
      this.firstname,
      this.lastname,
      this.email,
      this.telephone,
      this.fax,
      this.status});

  factory Login.fromJson(Map<String, dynamic> json) {
    Login login = Login();
    login.customerId = json['customer_id'].toString();
    login.customer_group_id = json['customer_group_id'];
    login.store_id = json['store_id'];
    login.language_id = json['language_id'];
    login.firstname = json['firstname'];
    login.lastname = json['lastname'];
    login.email = json['email'];
    login.telephone = json['telephone'];
    login.fax = json['fax'];
    login.status = json['status'];
    return login;
  }
}
