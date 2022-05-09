import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_demo/models/items_model.dart';
import 'package:rent_demo/consts/consts.dart';
import 'package:rent_demo/views/home/details_screen.dart';

class PopularSection extends StatefulWidget {
  const PopularSection({Key? key}) : super(key: key);

  @override
  State<PopularSection> createState() => _PopularSectionState();
}

class _PopularSectionState extends State<PopularSection> {
  late List<Items> items;

  readJson() async {
    var data = await DefaultAssetBundle.of(context)
        .loadString("lib/models/items.json");

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readJson(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          items = itemsFromJson(snapshot.data.toString());
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: items
                .mapIndexed((item, index) => Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              item.image.toString(),
                              width: context.screenWidth * 0.45,
                              fit: BoxFit.cover,
                              height: 170,
                            ),
                            10.heightBox,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  item.name!.text.semiBold.make(),
                                  "${item.price}/month"
                                      .text
                                      .semiBold
                                      .color(Colors.redAccent)
                                      .make()
                                ],
                              ),
                            ),
                            5.heightBox,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_rounded,
                                    size: 14.0,
                                    color: Colors.grey,
                                  ),
                                  5.widthBox,
                                  item.location!.text.make()
                                ],
                              ),
                            ),
                            10.heightBox,
                          ],
                        )
                            .box
                            .width(context.screenWidth * 0.45)
                            .roundedSM
                            .white
                            .clip(Clip.antiAlias)
                            .make(),
                        Positioned(
                            top: 10,
                            right: 10,
                            child: Row(
                              children: [
                                const Icon(Icons.star_rounded,
                                    size: 12.0, color: Colors.orangeAccent),
                                10.widthBox,
                                item.rating!.text.white.make()
                              ],
                            )
                                .box
                                .color(Colors.black.withOpacity(0.4))
                                .roundedLg
                                .padding(const EdgeInsets.symmetric(
                                    horizontal: padding8, vertical: 4.0))
                                .make())
                      ],
                    ).onTap(() {
                      Get.to(() => DetailsScreen(
                            item: item,
                          ));
                    }))
                .toList(),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
