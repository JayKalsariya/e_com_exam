import 'package:e_com_exam/utils/routes.dart';
import 'package:e_com_exam/view/screens/cart_page.dart';
import 'package:e_com_exam/view/screens/detail_page.dart';
import 'package:e_com_exam/view/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xff93B1A6)),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        Routes.homePage: (context) => const HomePage(),
        Routes.detailPage: (context) => const DetailPage(),
        Routes.cartPage: (context) => const CartPage(),
      },
    );
  }
}
