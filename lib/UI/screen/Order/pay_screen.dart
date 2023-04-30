import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:leqahy/UI/screen/Order/confirm_screen.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_code_widget.dart';
import 'package:leqahy/constant/constant.dart';
import 'package:leqahy/model/cart_model/cart_total.dart';
import 'package:leqahy/services/cart_services/cart_total_services.dart';

import '../../../constant/colors.dart';
import '../../../viewmodel/order_screen_viewmodel/pay_screen_viewmodel.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_wigets/custom_icon.dart';
import '../../widget/custom_wigets/custom_logo.dart';
import '../../widget/custom_wigets/custom_text.dart';
import '../../widget/custom_wigets/cutstome_appBar.dart';
import '../../widget/order_widget/order_bar_widget.dart';

class PayScreen extends StatefulWidget {
  static String routename = 'PayScreen';
  String? subTotal = '';
  String? shipping = '';
  String? fees = '';
  String? total = '';
  PayScreen({this.subTotal, this.shipping, this.fees, this.total});

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    PayScreenViewModel _vm = PayScreenViewModel();
    CartTotal total = CartTotal();

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
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
              phaseId: 2),

          //Code
          SizedBox(height: size.height * 0.01),
          customCode(
            size: size,
            code: 'code',
            onPressed: () {},
          ),

          //Total Price Table
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.05, horizontal: size.width * 0.05),
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
                ]),
          ),

          //Divider
          Divider(
            color: darkBlueColor,
            indent: size.width * 0.1,
            endIndent: size.width * 0.1,
            thickness: size.height * 0.003,
          ),

          //Total
          Container(
            height: size.height * 0.05,
            width: size.width * 0.6,
            margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 10,
                      blurStyle: BlurStyle.outer,
                      color: darkBlueColor)
                ]),
            child: CustomText(
                text: 'Total | ${widget.total}',
                color: darkBlueColor,
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.bold),
          ),

          //Next Step
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.2, vertical: size.height * 0.05),
              child: customButton(
                text: 'Next Step',
                textColor: whiteColor,
                textSize: size.width * 0.05,
                size: size,
                context: context,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConfirmScreen(
                                subTotal: widget.subTotal,
                                shipping: widget.shipping,
                                fees: widget.fees,
                                total: widget.total,
                              )));
                },
              ))
        ]),
      ),
    ));
  }
}
