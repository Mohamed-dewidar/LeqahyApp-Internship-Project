import 'package:http/http.dart' as http;
import 'package:leqahy/UI/screen/LoginScreens/register_screen.dart';
import 'package:leqahy/model/Login%20Models/register_model.dart';

class RegisterApi {
  adduser(String name, String email, String phone, String passwrod) async {
    var headers = {"Content-Type": "application/json", "Accept": "/"};
    RegisterModel user = RegisterModel(
        firstname: name, email: email, phone: phone, password: passwrod);
    Map<String, dynamic> data = user.toJson();
    print(data);
  }
}
