import 'package:flutter/material.dart';
import 'package:leqahy/UI/screen/Order/delivery_screen.dart';
import 'package:leqahy/UI/widget/cart_screen_widget/cart_product_widget.dart';
import 'package:leqahy/UI/widget/custom_button.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_icon.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_logo.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text.dart';
import 'package:leqahy/UI/widget/custom_wigets/cutstome_appBar.dart';
import 'package:leqahy/constant/cach_helper.dart';
import 'package:leqahy/constant/colors.dart';
import 'package:leqahy/constant/constant.dart';
import 'package:leqahy/model/cart_model/remove_cart_item.dart';
import 'package:leqahy/model/geo_models/zones_model.dart';
import 'package:leqahy/services/cart_services/clear_cart_services.dart';
import 'package:leqahy/services/cart_services/product_quantity_services.dart';
import 'package:leqahy/services/cart_services/remove_cart_item_services.dart';
import 'package:leqahy/services/geo_services/zone_service.dart';
import 'package:leqahy/services/login%20services/user_data.dart';
import 'package:leqahy/viewmodel/cart_screen_viewmodel/cart_screen_viewmodel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../model/cart_model/clear_cart.dart';
import '../../services/cart_services/cart_prodcuts_services.dart';

class CartScreen extends StatefulWidget {
  static const String routename = 'CartScreen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartScreenViewModel _vm = CartScreenViewModel();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        //AppBar
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.03),
          child: customAppBarNew(
              size: size,
              leading: Padding(
                  padding: EdgeInsets.only(right: size.width * 0.0),
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
              actions: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customIcon(
                    click: true,
                    icon: _vm.actionIcon1,
                    iconColor: darkBlueColor,
                    onTap: () async {
                      ClearCart clear =
                          await ClearCartApi().clearCart(UserData().customerId);
                      setState(() {});
                      return Fluttertoast.showToast(
                          msg: clear.msg!,
                          backgroundColor: Colors.green,
                          toastLength: Toast.LENGTH_LONG,
                          textColor: Colors.white,
                          fontSize: size.width * 0.04);
                    },
                  )
                ],
              )),
        ),

        //Your Cart text
        Padding(
            padding: EdgeInsets.only(top: size.height * 0.02),
            child: CustomText(
              text: 'Cart',
              fontSize: size.width * 0.07,
              color: darkBlueColor,
            )),
        SizedBox(height: size.height * 0.015),
        // Cart Items
        Expanded(
            child: FutureBuilder(
          future: CartProductsApi()
              .fetchProducts(UserData().customerId, UserData().languageId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return cartProductWidget(
                    size: size,
                    productName: snapshot.data![index].productName!,
                    pirce: snapshot.data![index].price!,
                    avatarimage: snapshot.data![index].image!,
                    quantity: int.parse(snapshot.data![index].quantity!),
                    onTapTrash: () async {
                      RemoveItem item = await RemvoeCartItemApi().deleteItem(
                          UserData().customerId,
                          snapshot.data![index].productId!);
                      setState(() {});
                      return Fluttertoast.showToast(
                          msg: item.msg!,
                          backgroundColor: Colors.green,
                          toastLength: Toast.LENGTH_LONG,
                          textColor: Colors.white,
                          fontSize: size.width * 0.04);
                    },
                    onTapPlus: () async {
                      int quantity = int.parse(snapshot.data![index].quantity!);
                      int mainQuantity =
                          int.parse(snapshot.data![index].mainQuantity!);
                      if (quantity + 1 <= mainQuantity) {
                        await ProductQuantityApi().quantityUpdated(
                            UserData().customerId,
                            snapshot.data![index].productId!,
                            (quantity + 1).toString());
                        setState(() {});
                      } else {
                        return Fluttertoast.showToast(
                            msg: 'الكميه غير صحيحه',
                            backgroundColor: Colors.red,
                            toastLength: Toast.LENGTH_LONG,
                            textColor: Colors.white,
                            fontSize: size.width * 0.04);
                      }
                    },
                    onTapMinus: () async {
                      int quantity = int.parse(snapshot.data![index].quantity!);
                      int mainQuantity =
                          int.parse(snapshot.data![index].mainQuantity!);
                      if (quantity - 1 >= 0) {
                        await ProductQuantityApi().quantityUpdated(
                            UserData().customerId,
                            snapshot.data![index].productId!,
                            (quantity - 1).toString());
                        setState(() {});
                      } else {
                        return Fluttertoast.showToast(
                            msg: 'الكميه غير صحيحه',
                            backgroundColor: Colors.red,
                            toastLength: Toast.LENGTH_LONG,
                            textColor: Colors.white,
                            fontSize: size.width * 0.04);
                      }
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
        )),
        //CheckOut button
        Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01, horizontal: size.width * 0.3),
            child: customButton(
              text: 'Check Out',
              textSize: size.width * 0.05,
              textColor: whiteColor,
              size: size,
              context: context,
              onTap: () async {
                await UserDataApi().getUserData(
                    customerId: UserData().customerId,
                    languageId: UserData().languageId);
                var list = await ZoneApi().fetchZones();
                ZoneModel zone;
                for (var i = 0; i < list.length; i++) {
                  if (list[i].name == UserData().zoneName) {
                    zone = list[i];
                    CachHelper.saveData(key: 'zoneId', value: list[i].zoneId);
                    CachHelper.saveData(
                        key: 'shippingzoneId', value: list[i].zoneId);
                    print(UserData().address2);
                    break;
                  }
                }

                Navigator.pushNamed(context, DeliveryScreen.routename);
              },
            ))
      ]),
    ));
  }
}
