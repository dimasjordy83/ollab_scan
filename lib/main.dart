import 'package:flutter/material.dart';
import 'package:flutter_ar/constant/approute.dart';
import 'package:flutter_ar/view/home.dart';
import 'package:flutter_ar/view/result.dart';
import 'package:flutter_ar/view/scanner.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      canvasColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    ),
    getPages: [
      GetPage(
        name: AppRoute.scanner,
        page: () => const ScannerView(),
      ),
      GetPage(
        name: AppRoute.result,
        page: () => const ResultView(),
      ),
      GetPage(
        name: AppRoute.home,
        page: () => const HomeView(),
      ),
    ],
    initialRoute: AppRoute.home,

    // home: const Root(),
  ));
}
