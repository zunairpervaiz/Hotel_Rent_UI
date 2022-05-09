import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_demo/consts/consts.dart';
import '../../views.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: categoriesList
          .mapIndexed((category, index) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    foregroundColor: Colors.redAccent,
                    backgroundColor: Colors.white,
                    child: Icon(categoryIconsList[index]),
                  ).card.roundedLg.make(),
                  5.heightBox,
                  category.text.make()
                ],
              ).onTap(() {
                Get.to(() => ItemsScreen(name: category));
              }))
          .toList(),
    );
  }
}
