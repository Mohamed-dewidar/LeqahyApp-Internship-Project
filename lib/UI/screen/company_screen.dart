import 'package:flutter/material.dart';
import 'package:leqahy/UI/screen/prodcuts_screen.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_icon.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_logo.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_searchbar.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text.dart';
import 'package:leqahy/UI/widget/custom_wigets/cutstome_appBar.dart';
import 'package:leqahy/UI/widget/home_widget/icon_stack.dart';
import 'package:leqahy/constant/colors.dart';
import 'package:leqahy/constant/constant.dart';
import 'package:leqahy/main.dart';
import 'package:leqahy/services/company_services/company_services.dart';
import 'package:leqahy/viewmodel/company_screen_viewmodel/company_screen_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompanyScreen extends StatefulWidget {
  String? classID;
  String? image;
  String? title;
  CompanyScreen({this.classID, this.image, this.title});
  static const String routename = 'CompanyScreen';

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  CompanyScreenViewModel _vm = CompanyScreenViewModel();
  // String productImage = '';
  // String product = '';
  // int _id = ;
  @override
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            //SizedBox
            SizedBox(
              height: size.height * 0.03,
            ),
            //AppBar
            customAppBarNew(
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
                )),

            //Search Bar
            customSearchBar(size: size, prefixIcon: _vm.searchPrefixIcon),

            //Product page Image
            Container(
              height: size.height * 0.25,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  color: darkBlueColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 10,
                        color: darkBlueColor,
                        blurStyle: BlurStyle.outer)
                  ]),
              child: Image.asset(widget.image!),
            ),

            //Prodcut Text
            Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
                child: CustomText(
                    text: widget.title!,
                    color: darkBlueColor,
                    fontSize: size.width * 0.08,
                    fontWeight: FontWeight.bold)),
            //Grid
            FutureBuilder(
              future: CompanyApi().fetchCompany(widget.classID!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.01,
                        left: size.width * 0.13,
                        right: size.width * 0.13),
                    child: GridView.builder(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: size.width * 0.05,
                        mainAxisSpacing: size.height * 0.001,
                      ),
                      itemBuilder: (context, index) {
                        print(snapshot.data![index].image);

                        return iconStack(
                          avatarimage: snapshot.data![index].image!,
                          image: _vm.image,
                          imagefromAsset: false,
                          onTap: () async {
                            final prefs = await SharedPreferences.getInstance();
                            // ignore: use_build_context_synchronously
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ProductScreen(
                                          companyId: snapshot
                                              .data![index].manfacId
                                              .toString(),
                                          languageId: UserData().languageId,
                                          customerId: UserData().customerId,
                                          companyname:
                                              snapshot.data![index].name,
                                        )));
                          },
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ],
        ),
      )),
    ));
  }
}
