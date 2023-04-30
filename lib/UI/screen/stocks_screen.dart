import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_appbar.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_bottomnavbar.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_datepicker.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_icon.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text.dart';
import 'package:leqahy/UI/widget/stocks_widgets/category.dart';
import 'package:leqahy/UI/widget/stocks_widgets/category_cell.dart';
import 'package:leqahy/constant/colors.dart';
import 'package:leqahy/services/stocks_service.dart';
import 'package:leqahy/viewmodel/stocks_screen_viewmodel.dart';

class StocksScreen extends StatefulWidget {
  const StocksScreen({super.key});
  static const String routename = 'StocksScreen';

  @override
  State<StocksScreen> createState() => _StocksScreenState();
}

class _StocksScreenState extends State<StocksScreen> {
  StocksScreenViewModel vm = StocksScreenViewModel();
  String? cateName;
  int _index = 0;
  String _date = '';
  DateTime lastPicked = DateTime.now();
  DateFormat formatScreen = DateFormat('yyyy-M-d');

  //Future<List<String>> data = [];
  @override
  void initState() {
    super.initState();
    cateName = 'لحم';
    _date = formatScreen.format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: size.height * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: size.width,
                        child: customAppBar(
                            prefix: true,
                            preIcon: vm.preIcon,
                            onPressed: vm.preIconOnPressed,
                            preIconColor: vm.preIconColor,
                            backgrondcolor: backgroundColor,
                            title: vm.title,
                            posfix: true,
                            posfixIcon: customIcon(
                                click: true,
                                onTap: vm.posIconOnPressed,
                                icon: vm.posIcon,
                                iconColor: vm.posIconColor,
                                iconSize: vm.posIconSize))),
                    SizedBox(
                      child: customAppBar(
                          prefix: true,
                          preIconColor: vm.posIconColor,
                          preIcon: vm.preIconSec,
                          onPressed: vm.preIconSecOnPressed,
                          backgrondcolor: vm.backgroundcolor,
                          title: vm.tileSec,
                          posfix: true,
                          posfixIcon: customIcon(
                            click: true,
                            icon: vm.posIconSec,
                            iconColor: vm.posIconSecColor,
                            iconSize: vm.posIconSecSize,
                            onTap: () async {
                              DateTime currentDateTime = await customDatePicker(
                                      context: context,
                                      initialDate: lastPicked,
                                      currentDate: DateTime.now()) ??
                                  lastPicked;
                              setState(() {
                                _date = formatScreen.format(currentDateTime);
                                lastPicked = currentDateTime;
                              });
                            },
                          )),
                    ),
                    category(onMeatTap: () {
                      setState(() {
                        cateName = 'لحم';
                      });
                    }, onTapTwo: () {
                      setState(() {
                        cateName = 'بيض';
                      });
                    }, onTapThree: () {
                      setState(() {
                        cateName = 'علف';
                      });
                    }, onTapFour: () {
                      setState(() {
                        cateName = 'كتاكيت';
                      });
                    }),
                    CustomText(text: _date, color: darkBlueColor, fontSize: 20),
                  ],
                )),
            // ignore: sized_box_for_whitespace
            Container(
                height: size.height * 0.55,
                alignment: AlignmentDirectional.topCenter,
                child: FutureBuilder(
                    future: StockAPI().getwithDate(_date, cateName!),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return ListView.builder(
                            //scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return categoryCell(
                                  size: size,
                                  companyName: snapshot.data![index].name,
                                  price: snapshot.data![index].price,
                                  product: snapshot.data![index].price,
                                  unit: snapshot.data![index].unit);
                            },
                            itemCount: snapshot.data!.length);
                      }
                    })),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: customBottomNavBar(
          index: _index,
          onTap: (value) {
            setState(() {
              _index = value;
            });
          },
        ),
      ),
    ));
  }
}
