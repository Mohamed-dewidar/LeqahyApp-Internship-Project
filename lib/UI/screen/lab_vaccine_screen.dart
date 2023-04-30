import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:leqahy/UI/widget/custom_button.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_datepicker.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text_field.dart';
import 'package:leqahy/UI/widget/lab_vaccine_widgets/lab_dropdown_items.dart';
import 'package:leqahy/UI/widget/lab_vaccine_widgets/lab_textFeild.dart';
import 'package:leqahy/constant/constant.dart';
import 'package:leqahy/services/lab_vaccine_services/add_reservation_service.dart';
import 'package:leqahy/viewmodel/lab_vaccine_screen_viewmodel/lab_vaccine_screen_viewmodel.dart';

import '../../constant/colors.dart';
import '../../model/lab_vaccine_models/lab_vaccine.dart';
import '../../services/lab_vaccine_services/lab_vaccine_service.dart';
import '../widget/custom_wigets/custom_icon.dart';
import '../widget/custom_wigets/custom_logo.dart';
import '../widget/custom_wigets/custom_text.dart';
import '../widget/custom_wigets/cutstome_appBar.dart';
import 'cart_screen.dart';

class LabVaccineScreen extends StatefulWidget {
  static const String routename = 'LabVaccineScreen';
  const LabVaccineScreen({super.key});

  @override
  State<LabVaccineScreen> createState() => _LabVaccineScreenState();
}

class _LabVaccineScreenState extends State<LabVaccineScreen> {
  LabVaccineScreenViewModel _vm = LabVaccineScreenViewModel();
  var _date = DateTime.now();
  String apiDate = '';
  DateFormat foramt = DateFormat('dd/MM/yyyy');
  DateFormat APIforamt = DateFormat('yyyy-MM-dd');
  bool _select = false;
  Set<String> items = {};

  @override
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            //AppBar
            Padding(
                padding: EdgeInsets.only(top: size.height * 0.03),
                child: customAppBarNew(
                    size: size,
                    leading: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03),
                            child: customIcon(
                                click: true,
                                icon: _vm.leadingIcon2,
                                iconSize: size.width * 0.05,
                                iconColor: darkBlueColor)),
                        customIcon(
                          click: true,
                          icon: _vm.leadingIcon1,
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
                            width: size.width * 0.08,
                            height: size.height * 0.05,
                            image: _vm.leqahyLogoPath),
                        CustomText(
                            text: _vm.leqahyText,
                            color: darkBlueColor,
                            fontSize:
                                ((size.width * 0.05 * size.height * 0.03) *
                                    0.04))
                      ],
                    ),
                    actions: Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03),
                            child: customIcon(
                                click: true,
                                icon: _vm.basketIcon,
                                iconSize: size.width * 0.05,
                                iconColor: darkBlueColor))
                      ],
                    ))),

            //Lab Vaccine Text
            Row(
              children: [
                Container(
                  height: size.height * 0.035,
                  width: size.width * 0.02,
                  color: Colors.grey,
                  margin: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                      vertical: size.height * 0.03),
                ),
                CustomText(
                    text: 'Lab Vaccine',
                    color: darkBlueColor,
                    fontSize: size.width * 0.055,
                    fontWeight: FontWeight.bold)
              ],
            ),

            //Customer Name
            labVaccineTextFeild(
                size: size,
                mainText: 'Customer Name',
                hintText: 'Customer Name',
                controller: _vm.nameController),

            //Customer Phone
            labVaccineTextFeild(
                size: size,
                mainText: 'Customer Phone',
                hintText: 'Customer Phone',
                controller: _vm.phoneController),

            //Lab
            labVaccineTextFeild(
                size: size,
                mainText: 'Lab',
                hintText: 'Lab',
                controller: _vm.labController),

            //Number
            labVaccineTextFeild(
                size: size,
                mainText: 'Number',
                hintText: 'Number',
                controller: _vm.numController),

            //Date
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.1, vertical: size.height * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.01),
                      child: CustomText(
                          text: 'Date',
                          color: Colors.grey[600],
                          fontSize: size.width * 0.05)),
                  Container(
                      height: size.height * 0.05,
                      child: CustomTextFeild(
                          radius: 10,
                          size: size,
                          controller: _vm.dateController,
                          hintText: foramt.format(DateTime.now()),
                          readOnly: true,
                          suffixIcon: customIcon(
                            click: true,
                            icon: _vm.dateicon,
                            iconColor: darkBlueColor,
                            onTap: () async {
                              _date = await customDatePicker(
                                    context: context,
                                    initialDate: _date,
                                    currentDate: DateTime.now(),
                                  ) ??
                                  _date;

                              setState(() {
                                _vm.dateController.text = foramt.format(_date);
                                apiDate = APIforamt.format(_date);
                              });
                            },
                          )))
                ],
              ),
            ),

            //Reservation
            labVaccineTextFeild(
                size: size,
                mainText: 'Reservation',
                hintText: 'Reservation',
                controller: _vm.reservationController),

            //Transactions
            Container(
              alignment: AlignmentDirectional.center,
              width: size.width * 0.8,
              padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.1, vertical: size.height * 0.02),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: greyColor,
              ),
              child: CustomText(
                  text: 'Transactions',
                  color: darkBlueColor,
                  fontSize: size.width * 0.06,
                  fontWeight: FontWeight.bold),
            ),

            //dropDown Category
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: FutureBuilder(
                future: LabVaccineApi().fetctVaccine(languageId: '1'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ExpansionPanelList(
                        elevation: 0.0,
                        dividerColor: whiteColor,
                        expansionCallback: (panelIndex, isExpanded) {
                          setState(() {
                            LabVaccineScreenViewModel.ExapandView[
                                LabVaccineScreenViewModel.LabProducts.elementAt(
                                    panelIndex)] = !isExpanded;
                          });
                        },
                        children: LabVaccineScreenViewModel.LabProducts.map(
                          (e) {
                            return ExpansionPanel(
                                canTapOnHeader: true,
                                backgroundColor: whiteColor,
                                isExpanded:
                                    LabVaccineScreenViewModel.ExapandView[e]!,
                                headerBuilder: (context, isExpanded) {
                                  return CustomText(
                                      text: e,
                                      fontSize: size.width * 0.05,
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.bold);
                                },
                                body: Container(
                                  height: size.height * 0.3,
                                  child: ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      if (snapshot
                                              .data![index].productTypeName ==
                                          e) {
                                        return CheckboxListTile(
                                          title: CustomText(
                                              text: snapshot.data![index].name!,
                                              fontSize: size.width * 0.03,
                                              color: darkBlueColor),
                                          value: LabVaccineScreenViewModel
                                                  .selectMap[
                                              snapshot.data![index].name],
                                          onChanged: (value) {
                                            setState(() {
                                              LabVaccineScreenViewModel
                                                      .selectMap[
                                                  snapshot.data![index]
                                                      .name!] = value!;

                                              if (value) {
                                                items.add(snapshot
                                                    .data![index].name!);
                                              } else {
                                                items.remove(snapshot
                                                    .data![index].name!);
                                              }
                                            });
                                          },
                                        );
                                      } else {
                                        return Container();
                                      }
                                    },
                                  ),
                                ));
                          },
                        ).toList());
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            )
          ]),
        ),
        floatingActionButton: Container(
            height: size.height * 0.05,
            width: size.width * 0.4,
            child: customButton(
                size: size,
                context: context,
                onTap: () async {
                  List<Map<String, String>> _items = [];
                  _items = items.map((e) => {'item_name': e}).toList();
                  String msg = await ReservationApi().makeReservation(
                      customerName: _vm.nameController.text,
                      customerPhone: _vm.phoneController.text,
                      labName: _vm.labController.text,
                      checkCount: _vm.numController.text,
                      date: apiDate,
                      reserverName: _vm.reservationController.text,
                      items: _items);
                  return Fluttertoast.showToast(
                      msg: msg,
                      fontSize: size.width * 0.05,
                      textColor: whiteColor,
                      backgroundColor: Colors.green);
                },
                text: 'Send',
                textColor: whiteColor)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
