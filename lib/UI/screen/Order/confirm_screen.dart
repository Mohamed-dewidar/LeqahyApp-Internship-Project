import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:leqahy/UI/widget/custom_button.dart';
import 'package:leqahy/services/order_services/confirm_order_service.dart';
import 'package:leqahy/viewmodel/order_screen_viewmodel/confirm_screen_viewmodel.dart';

import '../../../constant/colors.dart';
import '../../../constant/constant.dart';
import '../../widget/custom_wigets/custom_icon.dart';
import '../../widget/custom_wigets/custom_logo.dart';
import '../../widget/custom_wigets/custom_text.dart';
import '../../widget/custom_wigets/cutstome_appBar.dart';
import '../../widget/order_widget/details_card.dart';
import '../../widget/order_widget/order_bar_widget.dart';

class ConfirmScreen extends StatefulWidget {
  static String routename = 'ConfirmScreen';
  String? subTotal = '100';
  String? shipping = '20';
  String? fees = '20';
  String? total = '100';

  ConfirmScreen({this.subTotal, this.shipping, this.fees, this.total});

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    ConfirmScreenViewModel _vm = ConfirmScreenViewModel();
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          //App Bar
          Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
              child: customAppBarNew(
                  size: size,
                  leading: Padding(
                      padding: EdgeInsets.only(left: size.width * 0.05)),
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
                  actions: customIcon(
                    click: true,
                    icon: _vm.arrowRight,
                    iconColor: darkBlueColor,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ))),

          //Order Bar
          orderBarWidget(
              size: size,
              image1: _vm.deliveryImage,
              text1: 'Delivery',
              image2: _vm.payImage,
              text2: 'Pay',
              image3: _vm.confirmImage,
              text3: 'Confirm',
              phaseId: 3),

          //Total Details
          Container(
            height: size.height * 0.05,
            width: size.width * 0.4,
            margin: EdgeInsets.only(top: size.height * 0.03),
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
                color: darkBlueColor, borderRadius: BorderRadius.circular(12)),
            child: CustomText(
                text: 'Order Total',
                color: whiteColor,
                fontSize: size.width * 0.04),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.04, horizontal: size.width * 0.05),
            child: Table(
                textBaseline: TextBaseline.alphabetic,
                border: TableBorder.symmetric(
                    inside: BorderSide(color: darkBlueColor)),
                children: [
                  TableRow(children: [
                    Container(
                        alignment: AlignmentDirectional.center,
                        height: size.height * 0.07,
                        child: CustomText(
                            text: 'Price',
                            color: darkBlueColor,
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold)),
                    Container(
                        alignment: AlignmentDirectional.center,
                        height: size.height * 0.07,
                        child: CustomText(
                            text: widget.subTotal!,
                            color: darkBlueColor,
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold))
                  ]),
                  TableRow(children: [
                    Container(
                        alignment: AlignmentDirectional.center,
                        height: size.height * 0.07,
                        child: CustomText(
                            text: 'Shipping',
                            color: darkBlueColor,
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold)),
                    Container(
                        alignment: AlignmentDirectional.center,
                        height: size.height * 0.07,
                        child: CustomText(
                            text: widget.shipping!,
                            color: darkBlueColor,
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold))
                  ]),
                  TableRow(children: [
                    Container(
                        alignment: AlignmentDirectional.center,
                        height: size.height * 0.07,
                        child: CustomText(
                            text: 'Fees',
                            color: darkBlueColor,
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold)),
                    Container(
                        alignment: AlignmentDirectional.center,
                        height: size.height * 0.07,
                        child: CustomText(
                            text: widget.fees!,
                            color: darkBlueColor,
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold))
                  ]),
                  TableRow(children: [
                    Container(
                        alignment: AlignmentDirectional.center,
                        height: size.height * 0.07,
                        child: CustomText(
                            text: 'Total',
                            color: darkBlueColor,
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold)),
                    Container(
                        alignment: AlignmentDirectional.center,
                        height: size.height * 0.07,
                        child: CustomText(
                            text: widget.total!,
                            color: darkBlueColor,
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold))
                  ]),
                ]),
          ),

          //Address Details
          Container(
            height: size.height * 0.05,
            width: size.width * 0.4,
            margin: EdgeInsets.only(top: size.height * 0.03),
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
                color: darkBlueColor, borderRadius: BorderRadius.circular(12)),
            child: CustomText(
                text: 'Address Details',
                color: whiteColor,
                fontSize: size.width * 0.04),
          ),
          //Delivery Details
          detailsCard(title: 'Name', data: UserData().firstName, size: size),
          detailsCard(title: 'Company', data: 'Medavic', size: size),
          detailsCard(title: 'Adress', data: UserData().address1, size: size),
          detailsCard(
              title: 'Sub Adress', data: UserData().address2, size: size),
          detailsCard(title: 'City', data: UserData().city, size: size),
          detailsCard(title: 'District', data: UserData().zoneName, size: size),
          detailsCard(
              title: 'Postal Code', data: UserData().postCode, size: size),

          //Confirm Button
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.2, vertical: size.height * 0.04),
            child: customButton(
              text: 'Confirm Payment',
              textColor: whiteColor,
              textSize: size.width * 0.05,
              size: size,
              context: context,
              onTap: () async {
                await ConfirmOrderApi().confirmOrder();
              },
            ),
          )
        ],
      )),
    ));
  }
}
