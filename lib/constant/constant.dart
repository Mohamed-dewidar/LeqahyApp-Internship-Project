import 'package:leqahy/constant/cach_helper.dart';

import '../model/geo_models/zones_model.dart';

const String BaseUrl = 'https://leqahyapp.hypercare-eg.com/leqahy-app/api/v1';
const String MediaUrl = 'https://leqahyapp.hypercare-eg.com/media';

class UserData {
  var customerId = CachHelper.getData(key: 'customerId');
  var customerGroupId = CachHelper.getData(key: 'customerGroupId');
  var email = CachHelper.getData(key: 'email');
  var telephone = CachHelper.getData(key: 'telephone');
  var languageId = CachHelper.getData(key: 'languageId');
  var firstName = CachHelper.getData(key: 'firstName');
  var lastName = CachHelper.getData(key: 'lastName');
  var address1 = CachHelper.getData(key: 'address1');
  var address2 = CachHelper.getData(key: 'address2');
  var city = CachHelper.getData(key: 'city');
  var zoneName = CachHelper.getData(key: 'zoneName');
  var country = CachHelper.getData(key: 'country');
  var zoneId = CachHelper.getData(key: 'zoneId');
  var postCode = CachHelper.getData(key: 'postCode');
  var ip = CachHelper.getData(key: 'ip');

  //Shipping Data
  var shippingFirstName = CachHelper.getData(key: 'shippingfirstName');
  var shippingLastName = CachHelper.getData(key: 'shippinglastName');
  var shippingAddress1 = CachHelper.getData(key: 'shippingaddress1');
  var shippingAddress2 = CachHelper.getData(key: 'shippingaddress2');
  var shippingCity = CachHelper.getData(key: 'shippingcity');
  var shippingZoneName = CachHelper.getData(key: 'shippingzoneName');
  var shippingCountry = CachHelper.getData(key: 'shippingcountry');
  var shippingZoneId = CachHelper.getData(key: 'shippingzoneId');
  var shippingPostCode = CachHelper.getData(key: 'shippingpostCode');
}
