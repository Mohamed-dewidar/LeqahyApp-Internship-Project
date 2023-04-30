import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constant/constant.dart';

class DataEditScreenViewModel {
  IconData zoneIcon = FontAwesomeIcons.angleDown;
  IconData locIcon = FontAwesomeIcons.locationCrosshairs;
  final TextEditingController firstNameController =
      TextEditingController(text: UserData().firstName);
  final TextEditingController lastNameController =
      TextEditingController(text: UserData().lastName);
  final TextEditingController phone =
      TextEditingController(text: UserData().telephone);
  final TextEditingController address1Controller =
      TextEditingController(text: UserData().address1);
  final TextEditingController address2Controller =
      TextEditingController(text: UserData().address2);
  final TextEditingController zoneController =
      TextEditingController(text: UserData().zoneName);

  final TextEditingController shippingfirstNameController =
      TextEditingController(text: UserData().shippingFirstName);
  final TextEditingController shippinglastNameController =
      TextEditingController(text: UserData().shippingLastName);
  final TextEditingController shippingphone =
      TextEditingController(text: UserData().telephone);
  final TextEditingController shippingaddress1Controller =
      TextEditingController(text: UserData().shippingAddress1);
  final TextEditingController shippingaddress2Controller =
      TextEditingController(text: UserData().shippingAddress2);
  final TextEditingController shippingzoneController =
      TextEditingController(text: UserData().shippingZoneName);
}
