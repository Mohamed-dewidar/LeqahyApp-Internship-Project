import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:leqahy/UI/screen/Order/delivery_screen.dart';
import 'package:leqahy/UI/widget/custom_button.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_icon.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text_field.dart';
import 'package:leqahy/UI/widget/order_widget/oder_data_textfield.dart';
import 'package:leqahy/constant/cach_helper.dart';
import 'package:leqahy/constant/colors.dart';
import 'package:leqahy/constant/constant.dart';
import 'package:leqahy/services/geo_services/zone_service.dart';
import 'package:leqahy/viewmodel/order_screen_viewmodel/data_edit_screen_viewmodel.dart';

import '../../widget/lab_vaccine_widgets/lab_textFeild.dart';

class DataEditScreen extends StatefulWidget {
  static String routename = 'DataEditScreen';
  int? type;
  DataEditScreen({this.type});

  @override
  State<DataEditScreen> createState() => _DataEditScreenState();
}

class _DataEditScreenState extends State<DataEditScreen> {
  DataEditScreenViewModel _vm = DataEditScreenViewModel();

  // @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
            alignment: AlignmentDirectional.center,
            child: CustomText(
                text: 'Edit Payment Data',
                color: darkBlueColor,
                fontSize: size.width * 0.07,
                fontWeight: FontWeight.bold)),
        orderDataTextFiled(
            size: size,
            maintext: 'First Name',
            hintText: 'first name',
            controller: widget.type == 1
                ? _vm.firstNameController
                : _vm.shippingfirstNameController,
            oldData: UserData().firstName),
        orderDataTextFiled(
            size: size,
            maintext: 'Last Name',
            hintText: 'last name',
            controller: widget.type == 1
                ? _vm.lastNameController
                : _vm.shippinglastNameController,
            oldData: UserData().lastName),
        orderDataTextFiled(
            size: size,
            maintext: 'Telephone',
            hintText: 'telephone',
            controller: _vm.phone,
            oldData: UserData().telephone),
        orderDataTextFiled(
            size: size,
            maintext: 'Address',
            hintText: 'address',
            controller: widget.type == 1
                ? _vm.address1Controller
                : _vm.shippingaddress1Controller,
            oldData: UserData().address1),
        orderDataTextFiled(
            size: size,
            maintext: 'Sub Address',
            hintText: 'sub address',
            controller: widget.type == 1
                ? _vm.address2Controller
                : _vm.shippingaddress2Controller,
            oldData: UserData().address2),
        orderDataTextFiled(
            size: size,
            maintext: 'Zone',
            hintText: 'zone',
            controller: widget.type == 1
                ? _vm.zoneController
                : _vm.shippingzoneController,
            oldData: UserData().zoneName,
            readOnly: true,
            suffixIcon: customIcon(
              click: true,
              icon: _vm.zoneIcon,
              iconColor: darkBlueColor,
              onTap: () async {
                return showDialog(
                  context: context,
                  builder: (context) {
                    return FutureBuilder(
                      future: ZoneApi().fetchZones(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Center(
                            child: Material(
                              type: MaterialType.transparency,
                              child: Container(
                                alignment: AlignmentDirectional.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12)),
                                width: size.width * 0.8,
                                height: size.height * 0.7,
                                child: ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (widget.type == 1) {
                                            CachHelper.saveData(
                                                key: 'zoneName',
                                                value:
                                                    snapshot.data![index].name);
                                            _vm.zoneController.text =
                                                UserData().zoneName;
                                          } else {
                                            CachHelper.saveData(
                                                key: 'shippingzoneName',
                                                value:
                                                    snapshot.data![index].name);
                                            _vm.shippingzoneController.text =
                                                UserData().shippingZoneName;
                                          }
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Card(
                                          borderOnForeground: true,
                                          shadowColor: darkBlueColor,
                                          color: whiteColor,
                                          elevation: 1.0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          semanticContainer: false,
                                          child: Container(
                                            height: size.height * 0.05,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: size.width * 0.1),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Expanded(
                                                    child: CustomText(
                                                        text: snapshot
                                                            .data![index].name!,
                                                        color: darkBlueColor,
                                                        fontSize:
                                                            size.width * 0.04,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Icon(
                                                  _vm.locIcon,
                                                  color: darkBlueColor,
                                                )
                                              ],
                                            ),
                                          )),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    );
                  },
                );
              },
            )),
        Center(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
              width: size.width * 0.5,
              child: customButton(
                text: 'Confirm',
                size: size,
                textColor: whiteColor,
                textSize: size.width * 0.04,
                context: context,
                onTap: () {
                  print(_vm.firstNameController.text);
                  if (widget.type == 1) {
                    CachHelper.saveData(
                        key: 'firstName', value: _vm.firstNameController.text);
                    CachHelper.saveData(
                        key: 'lastName', value: _vm.lastNameController.text);
                    CachHelper.saveData(
                        key: 'telephone', value: _vm.phone.text);
                    CachHelper.saveData(
                        key: 'address1', value: _vm.address1Controller.text);
                    CachHelper.saveData(
                        key: 'address2', value: _vm.address2Controller.text);
                  } else {
                    CachHelper.saveData(
                        key: 'shippingfirstName',
                        value: _vm.shippingfirstNameController.text);
                    CachHelper.saveData(
                        key: 'shippinglastName',
                        value: _vm.shippinglastNameController.text);
                    CachHelper.saveData(
                        key: 'telephone', value: _vm.phone.text);
                    CachHelper.saveData(
                        key: 'shippingaddress1',
                        value: _vm.shippingaddress1Controller.text);
                    CachHelper.saveData(
                        key: 'shippingaddress2',
                        value: _vm.shippingaddress2Controller.text);
                  }

                  Navigator.pushReplacementNamed(
                      context, DeliveryScreen.routename);
                  //setState(() {});
                },
              )),
        ),
      ]),
    )));
  }
}
