import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rent_demo/consts/consts.dart';
import './views/views.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        fontFamily: "gilroy",
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              color: fontColor,
              fontWeight: FontWeight.w600,
              fontSize: 22,
              fontFamily: "gilroy"),
          elevation: 0.0,
          backgroundColor: bgColor,
          centerTitle: true,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
