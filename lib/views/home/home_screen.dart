import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_demo/consts/consts.dart';
import 'package:rent_demo/views/home/search_screen.dart';
import '../views.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appname.text.make(),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.redAccent,
            child: IconButton(
                onPressed: () {
                  Get.to(() => const SearchScreen());
                },
                icon: const Icon(Icons.search_rounded, color: Colors.white)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(padding12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CategoriesSection(),
              30.heightBox,
              popular.text.color(blackColor).xl.semiBold.make(),
              10.heightBox,
              const PopularSection(),
              20.heightBox,
              nearby.text.color(blackColor).xl.semiBold.make(),
              10.heightBox,
              const NearbySection()
            ],
          ),
        ),
      ),
    );
  }
}
