import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:leqahy/UI/screen/Order/data_edit_screen.dart';
import 'package:leqahy/UI/screen/Order/pay_screen.dart';
import 'package:leqahy/UI/widget/custom_button.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_appbar.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_icon.dart';
import 'package:leqahy/UI/widget/custom_wigets/cutstome_appBar.dart';
import 'package:leqahy/UI/widget/order_widget/details_card.dart';
import 'package:leqahy/UI/widget/order_widget/order_bar_widget.dart';
import 'package:leqahy/UI/widget/order_widget/paymeny_location_widget.dart';
import 'package:leqahy/constant/cach_helper.dart';
import 'package:leqahy/constant/constant.dart';
import 'package:leqahy/services/cart_services/cart_total_services.dart';
import 'package:leqahy/viewmodel/order_screen_viewmodel/delivery_screen_viewmodel.dart';

import '../../../constant/colors.dart';
import '../../widget/custom_wigets/custom_logo.dart';
import '../../widget/custom_wigets/custom_text.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});
  static const String routename = "DeliveryScreen";

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  DeliveryScreenViewModel _vm = DeliveryScreenViewModel();
  bool _value1 = true;
  bool _value2 = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(CachHelper.getData(key: 'firstName'));
    initState() {
      _value1 = true;
      _value2 = false;
    }

    ;
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        //App Bar
        Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
            child: customAppBarNew(
                size: size,
                leading:
                    Padding(padding: EdgeInsets.only(left: size.width * 0.05)),
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
            phaseId: 1),

        //Payment Location
        paymentLocationWidget(
            value1: _value1,
            value2: _value2,
            onChanged1: (p0) {
              setState(() {
                _value1 = p0!;
                _value2 = !_value1;
              });
            },
            onChanged2: (p1) {
              setState(() {
                _value2 = p1!;
                _value1 = !_value2;
              });
            },
            text1: 'Payment Location same as Delivery Location',
            text2: 'Payment Location not same as Delivery Location',
            size: size),

        //Delivery Details
        Expanded(
          child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: size.height * 0.03, horizontal: size.width * 0.05),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: whiteColor),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: size.height * 0.01,
                          horizontal: size.width * 0.01),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                                color: darkBlueColor,
                                blurRadius: 10,
                                blurStyle: BlurStyle.outer)
                          ]),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomText(
                                text: 'Delivery Details',
                                color: darkBlueColor,
                                fontSize: size.width * 0.05,
                                fontWeight: FontWeight.bold),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DataEditScreen(
                                              type: 1,
                                            )));
                              },
                              child: Row(
                                children: [
                                  CustomText(
                                      text: 'Edit',
                                      color: darkBlueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * 0.05),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      _vm.editIcon,
                                      size: size.width * 0.04,
                                      color: darkBlueColor,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ]),
                    ),

                    //Delivery Details
                    detailsCard(
                        title: 'Name', data: UserData().firstName, size: size),
                    detailsCard(title: 'Company', data: 'Medavic', size: size),
                    detailsCard(
                        title: 'Adress', data: UserData().address1, size: size),
                    detailsCard(
                        title: 'Sub Adress',
                        data: UserData().address2,
                        size: size),
                    detailsCard(
                        title: 'City', data: UserData().city, size: size),
                    detailsCard(
                        title: 'Zone', data: UserData().zoneName, size: size),
                    detailsCard(
                        title: 'Postal Code',
                        data: UserData().postCode,
                        size: size),

                    //if payment location not same as delivery location
                    if (_value2)
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: size.height * 0.01,
                                horizontal: size.width * 0.01),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                      color: darkBlueColor,
                                      blurRadius: 10,
                                      blurStyle: BlurStyle.outer)
                                ]),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                      text: 'Payment Location Details',
                                      color: darkBlueColor,
                                      fontSize: size.width * 0.05,
                                      fontWeight: FontWeight.bold),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DataEditScreen(
                                                    type: 2,
                                                  )));
                                    },
                                    child: Row(
                                      children: [
                                        CustomText(
                                            text: 'Edit',
                                            color: darkBlueColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.width * 0.05),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            _vm.editIcon,
                                            size: size.width * 0.04,
                                            color: darkBlueColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                          ),

                          //Delivery Details
                          detailsCard(
                              title: 'Name',
                              data: UserData().shippingFirstName,
                              size: size),
                          detailsCard(
                              title: 'Company', data: 'Medavic', size: size),
                          detailsCard(
                              title: 'Adress',
                              data: UserData().shippingAddress1,
                              size: size),
                          detailsCard(
                              title: 'Sub Adress',
                              data: UserData().shippingAddress2,
                              size: size),
                          detailsCard(
                              title: 'City',
                              data: UserData().shippingCity,
                              size: size),
                          detailsCard(
                              title: 'Zone',
                              data: UserData().shippingZoneName,
                              size: size),
                          detailsCard(
                              title: 'Postal Code',
                              data: UserData().shippingPostCode,
                              size: size),
                        ],
                      ),

                    ////////////////////////////

                    //Next Step
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.2),
                        child: customButton(
                          text: 'Next Step',
                          textColor: whiteColor,
                          textSize: size.width * 0.05,
                          size: size,
                          context: context,
                          onTap: () async {
                            var total = await CartTotalApi()
                                .totalAmount(UserData().customerId);
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PayScreen(
                                    subTotal: total.subTotal.toString(),
                                    shipping: total.shipping.toString(),
                                    fees: total.fees.toString(),
                                    total: total.total.toString(),
                                  ),
                                ));
                          },
                        ))
                  ],
                ),
              )),
        )
      ],
    )));
  }
}
