import 'package:flutter/material.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_icon.dart';

customBottomNavBar(
    {Function()? home,
    Function()? cate,
    Function()? cart,
    Function()? stocks,
    Function()? account,
    Function(dynamic)? onTap,
    int? index}) {
  return BottomNavigationBar(
      backgroundColor: Colors.blue[900],
      elevation: 0,
      unselectedFontSize: 15,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.red,
      showUnselectedLabels: true,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      currentIndex: index ?? 0,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
            label: 'Home',
            icon: customIcon(
                click: true, icon: Icons.home, onTap: home ?? () => {})),
        BottomNavigationBarItem(
            label: 'Categories',
            icon: customIcon(
                click: true, icon: Icons.list_sharp, onTap: cate ?? () => {})),
        BottomNavigationBarItem(
            label: 'Cart',
            icon: customIcon(
                click: true,
                icon: Icons.shopping_basket,
                onTap: cart ?? () => {})),
        BottomNavigationBarItem(
            label: 'Stocks',
            icon: customIcon(
                click: true, icon: Icons.add_chart, onTap: stocks ?? () => {})),
        BottomNavigationBarItem(
            label: 'Account',
            icon: customIcon(
                click: true, icon: Icons.person, onTap: account ?? () => {})),
      ]);
}
