import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:leqahy/UI/widget/home_widget/banner_widget.dart';
import 'package:leqahy/constant/cach_helper.dart';
import 'package:leqahy/constant/constant.dart';
import 'package:leqahy/services/home_services/banners_services.dart';
import 'package:leqahy/services/product_services/product_description_services.dart';
import 'package:leqahy/viewmodel/products_screen_viewmodel/product_des_screen_viewmodel.dart';

import '../../../constant/colors.dart';
import '../../widget/custom_wigets/custom_icon.dart';
import '../../widget/custom_wigets/custom_logo.dart';
import '../../widget/custom_wigets/custom_text.dart';
import '../../widget/custom_wigets/cutstome_appBar.dart';

class ProductDescriptionScreen extends StatefulWidget {
  static const String routename = "ProductDescriptionScreen";
  String? productName;
  String? textDes;
  String? price;
  String? model;
  String? productId;
  ProductDescriptionScreen(
      {this.productName, this.textDes, this.price, this.model, this.productId});

  @override
  State<ProductDescriptionScreen> createState() =>
      _ProductDescriptionScreenState();
}

class _ProductDescriptionScreenState extends State<ProductDescriptionScreen> {
  ProductDescriptionScreenViewModel _vm = ProductDescriptionScreenViewModel();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Column(children: [
        //AppBar
        Padding(
            padding: EdgeInsets.only(top: size.height * 0.03),
            child: customAppBarNew(
                size: size,
                leading: Padding(
                    padding: EdgeInsets.only(right: size.width * 0.05),
                    child: customIcon(
                      click: true,
                      icon: _vm.leadingIcon1,
                      iconColor: darkBlueColor,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    )),
                title: Column(
                  children: [
                    customLogo(
                        width: size.width * 0.08,
                        height: size.height * 0.05,
                        image: _vm.leqahyLogoPath),
                    CustomText(
                        text: _vm.leqahyText,
                        color: darkBlueColor,
                        fontSize:
                            ((size.width * 0.05 * size.height * 0.03) * 0.04))
                  ],
                ),
                actions: SizedBox(
                  width: size.width * 0.1,
                ))),

        //Product Name
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.03),
          child: Text(
            widget.productName!,
            style: TextStyle(
                color: darkBlueColor,
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.05),
          ),
        ),

        //Product Des Images
        // Padding(
        //     padding: EdgeInsets.only(top: size.height * 0.04),
        //     child: bannerWiget(
        //         size: size,
        //         future: DescriptionApi().fetchDescImage(widget.productId!))),

        //Description Text

        Container(
          height: size.height * 0.3,
          width: size.width * 0.9,
          margin: EdgeInsets.only(top: size.height * 0.04),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: whiteColor,
              boxShadow: const [
                BoxShadow(
                    color: darkBlueColor,
                    blurRadius: 10,
                    blurStyle: BlurStyle.outer)
              ]),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.02, right: size.width * 0.6),
                child: Text(
                  'Description',
                  style: TextStyle(
                    color: darkBlueColor,
                    fontSize: size.width * 0.05,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.01, left: size.width * 0.05),
                child: Text(
                  widget.textDes!,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: size.width * 0.04,
                  ),
                ),
              ),
            ],
          ),
        ),

        //Price & Model
        Container(
          height: size.height * 0.08,
          width: size.width * 0.9,
          margin: EdgeInsets.only(top: size.height * 0.04),
          child: Card(
            color: greyColor,
            elevation: 1,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text: 'Price : ${widget.price!}',
                      color: darkBlueColor,
                      fontSize: size.width * 0.04),
                  CustomText(
                      text: 'Model : ${widget.model!}',
                      color: darkBlueColor,
                      fontSize: size.width * 0.04),
                ]),
          ),
        )
      ])),
    ));
  }
}
