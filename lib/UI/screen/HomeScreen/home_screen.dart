import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:leqahy/UI/screen/HomeScreen/drawer.dart';
import 'package:leqahy/UI/screen/cart_screen.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_icon.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_logo.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_searchbar.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text_field.dart';
import 'package:leqahy/UI/widget/custom_wigets/cutstome_appBar.dart';
import 'package:leqahy/UI/widget/home_widget/banner_widget.dart';
import 'package:leqahy/UI/widget/home_widget/icon_stack.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:leqahy/constant/colors.dart';
import 'package:leqahy/constant/constant.dart';
import 'package:leqahy/model/home_models/banners_model/oc_banner.dart';
import 'package:leqahy/services/cart_services/cart_prodcuts_services.dart';
import 'package:leqahy/services/company_services/company_services.dart';
import 'package:leqahy/services/home_services/banners_services.dart';
import 'package:leqahy/viewmodel/home_viewmodel/home_screen_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../services/login services/user_data.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var _index = 0;

    return Consumer<HomeScreenViewModel>(
      builder: (context, home, child) {
        home.gridIconsFontSize =
            ((size.width * 0.01) / (size.height * 0.01)) * 0.4;
        home.fetchBanners();
        print('again');
        return SafeArea(
            child: Scaffold(
          key: _key,
          drawer: MyDrawer(
            home: home,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                //AppBar
                customAppBarNew(
                    size: size,
                    leading: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03),
                            child: customIcon(
                              click: true,
                              icon: home.leadingIcon2,
                              iconSize: size.width * 0.05,
                              iconColor: darkBlueColor,
                              onTap: () {
                                _key.currentState!.openDrawer();
                              },
                            )),
                        customIcon(
                          click: true,
                          icon: home.leadingIcon1,
                          iconSize: size.width * 0.05,
                          iconColor: darkBlueColor,
                          onTap: () async {
                            Navigator.pushNamed(context, CartScreen.routename);
                          },
                        )
                      ],
                    ),
                    title: Column(
                      children: [
                        customLogo(
                            width: size.width * 0.07,
                            height: size.height * 0.05,
                            image: home.leqahyLogoPath),
                        CustomText(
                            text: home.leqahyText,
                            color: darkBlueColor,
                            fontSize: size.width * 0.04)
                      ],
                    ),
                    actions: Row(
                      children: [
                        customIcon(
                            click: true,
                            onTap: () {
                              print('Notifcation');
                            },
                            icon: home.actionsIcon2,
                            iconSize: size.width * 0.05,
                            iconColor: darkBlueColor),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03),
                            child: customIcon(
                                click: true,
                                icon: home.actionIcon1,
                                iconSize: size.width * 0.05,
                                iconColor: darkBlueColor))
                      ],
                    )),
                //Search Bar
                customSearchBar(size: size, prefixIcon: home.searchPrefixIcon),

                //Banners
                bannerWiget(size: size, banners: home.bannersList),

                //Icons Grid
                GridView.count(
                    padding: EdgeInsets.only(
                        top: size.height * 0.06,
                        left: size.width * 0.13,
                        right: size.width * 0.13),
                    crossAxisCount: 3,
                    crossAxisSpacing: size.height * 0.02,
                    mainAxisSpacing: size.width * 0.02,
                    shrinkWrap: true,
                    children: home.childList(context: context)),
              ]),
            ),
          ),
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.white,
            items: [
              customIcon(click: true, icon: Icons.home, iconColor: whiteColor),
              customIcon(
                  click: true,
                  icon: Icons.shopping_basket,
                  iconColor: whiteColor),
              customIcon(
                  click: true, icon: Icons.settings, iconColor: whiteColor),
              customIcon(
                  click: true,
                  icon: Icons.question_mark,
                  iconColor: whiteColor),
              customIcon(
                  click: true, icon: Icons.person, iconColor: whiteColor),
            ],
            onTap: (value) {
              _index = value;
            },
            index: _index,
            color: darkBlueColor,
            height: size.height * 0.06,
          ),
        ));
      },
    );
  }
}
