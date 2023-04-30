import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leqahy/UI/screen/company_screen.dart';
import 'package:leqahy/UI/screen/DoctorScreens/doctor_screen.dart';
import 'package:leqahy/UI/screen/stocks_screen.dart';
import 'package:leqahy/UI/widget/home_widget/icon_stack.dart';
import 'package:leqahy/main.dart';
import 'package:leqahy/model/home_models/banners_model/oc_banner.dart';
import 'package:leqahy/services/home_services/banners_services.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeScreenViewModel extends ChangeNotifier {
  //URL
  final String bannersURL =
      'https://leqahyapp.hypercare-eg.com/leqahy-app/api/v1/get-main-oc_banners';

  //AppBar
  //Leading
  IconData leadingIcon1 = FontAwesomeIcons.basketShopping;
  IconData leadingIcon2 = FontAwesomeIcons.list;
  //Title
  String leqahyText = 'Leqahy'.tr();
  String leqahyLogoPath = 'assets/images/leqahy_logo.jpeg';
  //Actions
  IconData actionIcon1 = FontAwesomeIcons.arrowRightFromBracket;
  IconData actionsIcon2 = FontAwesomeIcons.bell;

  //Search Bar
  IconData searchPrefixIcon = FontAwesomeIcons.magnifyingGlass;

  //GridView
  static const String leqahyImage = 'assets/images/logoMark.png';

  static const String vaccineImage = 'assets/images/G1.png';
  static const String drugsImage = 'assets/images/G2.png';
  static const String disImage = 'assets/images/G3.png';
  static const String stockImage = 'assets/images/G4.png';
  static const String labVacImage = 'assets/images/G5.png';
  static const String labSerImage = 'assets/images/G6.png';
  static const String docImage = 'assets/images/G7.png';
  static const String acdeImage = 'assets/images/G8.png';
  static const String wuzufImage = 'assets/images/G9.png';

  childList({required BuildContext context}) {
    return <Widget>[
      iconStack(
          avatarimage: vaccineImage,
          image: leqahyImage,
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => CompanyScreen(
                      classID: '1',
                      image: 'assets/images/vaccine.png',
                      title: 'Vaccine',
                    )));
          },
          imagefromAsset: true),
      iconStack(
          avatarimage: drugsImage,
          image: leqahyImage,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => CompanyScreen(
                          classID: '2',
                          image: 'assets/images/drug.png',
                          title: 'Drugs',
                        )));
          },
          imagefromAsset: true),
      iconStack(
          avatarimage: disImage,
          image: leqahyImage,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => CompanyScreen(
                          classID: '4',
                          image: 'assets/images/antisep.png',
                          title: 'Disfictant',
                        )));
          },
          imagefromAsset: true),
      iconStack(
          avatarimage: stockImage,
          image: leqahyImage,
          onTap: () {
            Navigator.pushNamed(context, StocksScreen.routename);
          },
          imagefromAsset: true),
      iconStack(
          avatarimage: labVacImage,
          image: leqahyImage,
          onTap: () {},
          imagefromAsset: true),
      iconStack(
          avatarimage: labSerImage,
          image: leqahyImage,
          onTap: () {},
          imagefromAsset: true),
      iconStack(
          avatarimage: docImage,
          image: leqahyImage,
          onTap: () {
            Navigator.pushNamed(context, DoctorScreen.routename);
          },
          imagefromAsset: true),
      iconStack(
          avatarimage: acdeImage,
          image: leqahyImage,
          onTap: () {},
          imagefromAsset: true),
      iconStack(
          avatarimage: wuzufImage,
          image: leqahyImage,
          onTap: () {},
          imagefromAsset: true)
    ];
  }

  /******* Banners ******* */
  List<OcBanners> bannersList = [];
  fetchBanners() async {
    bannersList = await BannersApi().fetchBanners();
    notifyListeners();
  }

  /************************ */

  //****Drawer *** */
  setLangAr(BuildContext context) async {
    await context.setLocale(const Locale('ar', 'EG'));
    print('Done');
    notifyListeners();
  }

  setLangEn(BuildContext context) async {
    await context.setLocale(const Locale('en', 'US'));
    print('Done');
    notifyListeners();
  }

  /************************** */
  double gridIconsFontSize = 0;
}
