import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:leqahy/UI/screen/Products/product_description_screen.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_logo.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text.dart';
import 'package:leqahy/UI/widget/product_screen_widget/prodcut_widget.dart';
import 'package:leqahy/constant/constant.dart';
import 'package:leqahy/model/product_model/product_description_model.dart';
import 'package:leqahy/services/cart_services/add_product_services.dart';
import 'package:leqahy/services/product_services/product_description_services.dart';
import 'package:leqahy/services/product_services/product_services.dart';
import 'package:leqahy/viewmodel/products_screen_viewmodel/prodcut_screen_viewmodel.dart';

import '../../constant/colors.dart';
import '../widget/custom_wigets/custom_icon.dart';
import '../widget/custom_wigets/custom_searchbar.dart';
import '../widget/custom_wigets/cutstome_appBar.dart';

class ProductScreen extends StatefulWidget {
  String? companyId;
  String? customerId;
  String? languageId;
  String? companyname;
  static const String routename = 'ProductScreen';
  ProductScreen(
      {this.companyId, this.customerId, this.languageId, this.companyname});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductScreenViewModel _vm = ProductScreenViewModel();
  String? _check;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Column(
        children: [
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

          //Search Bar
          customSearchBar(size: size, prefixIcon: _vm.searchPrefixIcon),

          //
          Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
              child: CustomText(
                  text: widget.companyname!,
                  color: darkBlueColor,
                  fontSize: size.width * 0.08,
                  fontWeight: FontWeight.bold)),
          //Products Grid
          Expanded(
            child: FutureBuilder(
              future: ProductApi().fetchProduct(
                  widget.companyId!, widget.customerId!, widget.languageId!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(
                        top: size.height * 0.01,
                        left: size.width * 0.1,
                        right: size.width * 0.1),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: size.width * 0.05,
                        mainAxisSpacing: size.height * 0.01,
                        childAspectRatio: 0.6),
                    itemBuilder: (context, index) {
                      return productSample(
                        size: size,
                        image: snapshot.data![index].image!,
                        disAmount: snapshot.data![index].viewed!,
                        viewed: snapshot.data![index].viewed!,
                        name: snapshot.data![index].productName!,
                        price: snapshot.data![index].price!,
                        check: snapshot.data![index].productChecks!,
                        onTapDesc: () async {
                          ProductDescription desc = await DescriptionApi()
                              .fetchDescription(
                                  snapshot.data![index].productId!,
                                  UserData().languageId);
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ProductDescriptionScreen(
                                        model: snapshot.data![index].model,
                                        productName:
                                            snapshot.data![index].productName,
                                        price: snapshot.data![index].price,
                                        textDes: desc.description,
                                        productId:
                                            snapshot.data![index].productId,
                                      )));
                        },
                        onTap: () async {
                          String msg = await AddProductApi().addProduct(
                              UserData().customerId,
                              snapshot.data![index].productId!);
                          setState(() {});
                        },
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )
        ],
      )),
    ));
  }
}
