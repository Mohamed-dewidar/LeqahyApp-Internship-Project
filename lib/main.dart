import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leqahy/UI/screen/DoctorScreens/doctor_appointment_screen.dart';
import 'package:leqahy/UI/screen/Order/confirm_screen.dart';
import 'package:leqahy/UI/screen/Order/delivery_screen.dart';
import 'package:leqahy/UI/screen/Order/pay_screen.dart';
import 'package:leqahy/UI/screen/Products/product_description_screen.dart';
import 'package:leqahy/UI/screen/cart_screen.dart';
import 'package:leqahy/UI/screen/HomeScreen/home_screen.dart';
import 'package:leqahy/UI/screen/lab_vaccine_screen.dart';
import 'package:leqahy/UI/screen/location_screen.dart';
import 'package:leqahy/UI/screen/LoginScreens/login_screen.dart';
import 'package:leqahy/UI/screen/company_screen.dart';
import 'package:leqahy/UI/screen/prodcuts_screen.dart';
import 'package:leqahy/UI/screen/LoginScreens/register_screen.dart';
import 'package:leqahy/UI/screen/stocks_screen.dart';
import 'package:leqahy/constant/cach_helper.dart';
import 'package:leqahy/constant/colors.dart';
import 'package:leqahy/viewmodel/doctor_screen_viewmode/doctor_appointment_viewmodel.dart';
import 'package:leqahy/viewmodel/home_viewmodel/home_screen_viewmodel.dart';
import 'package:provider/provider.dart';

import 'UI/screen/Order/data_edit_screen.dart';
import 'UI/screen/DoctorScreens/doctor_screen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DoctorAppointmentViewModel()),
        ChangeNotifierProvider(create: (_) => HomeScreenViewModel())
      ],
      child: EasyLocalization(
          path: 'assets/languages',
          startLocale: const Locale('en', 'US'),
          supportedLocales: const [Locale('ar', 'EG'), Locale('en', 'US')],
          fallbackLocale: const Locale('en', 'US'),
          child: const MyApp())));
  await CachHelper.init();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      theme: ThemeData(backgroundColor: backgroundColor),
      initialRoute: HomeScreen.routename,
      routes: {
        LoginScreen.routename: (_) => const LoginScreen(),
        RegisterScreen.routename: (_) => const RegisterScreen(),
        LocationScreen.routename: (_) => const LocationScreen(),
        StocksScreen.routename: (_) => const StocksScreen(),
        HomeScreen.routename: (_) => const HomeScreen(),
        CompanyScreen.routename: (_) => CompanyScreen(),
        ProductScreen.routename: (_) => ProductScreen(),
        ProductDescriptionScreen.routename: (_) => ProductDescriptionScreen(),
        CartScreen.routename: (_) => CartScreen(),
        LabVaccineScreen.routename: (_) => const LabVaccineScreen(),
        DoctorScreen.routename: (_) => const DoctorScreen(),
        DeliveryScreen.routename: (_) => const DeliveryScreen(),
        PayScreen.routename: (_) => PayScreen(),
        ConfirmScreen.routename: (_) => ConfirmScreen(),
        DataEditScreen.routename: (_) => DataEditScreen(),
        DoctorAppointmentScreen.routename: (_) =>
            const DoctorAppointmentScreen(),
      },
    );
  }
}
