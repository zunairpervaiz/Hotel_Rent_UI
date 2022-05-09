import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_demo/models/items_model.dart';
import 'package:rent_demo/consts/consts.dart';
import 'package:rent_demo/views/home/details_screen.dart';

class NearbySection extends StatefulWidget {
  const NearbySection({Key? key}) : super(key: key);

  @override
  State<NearbySection> createState() => _NearbySectionState();
}

class _NearbySectionState extends State<NearbySection> {
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
          return SingleChildScrollView(
            child: Column(
              children: items
                  .mapIndexed((item, index) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            item.image.toString(),
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ).box.roundedSM.clip(Clip.antiAlias).make(),
                          10.widthBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    item.name!.text.semiBold.make(),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: item.price!.text.semiBold
                                          .color(Colors.redAccent)
                                          .make(),
                                    )
                                  ],
                                ),
                                10.heightBox,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on_rounded,
                                          size: 14.0,
                                          color: Colors.grey,
                                        ),
                                        5.widthBox,
                                        item.location!.text.make(),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.star_rounded,
                                            size: 12.0,
                                            color: Colors.orangeAccent),
                                        5.widthBox,
                                        item.rating!.text
                                            .color(fontColor)
                                            .make()
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                          .box
                          .margin(const EdgeInsets.only(bottom: 8.0))
                          .roundedSM
                          .padding(const EdgeInsets.all(8.0))
                          .white
                          .width(context.screenWidth)
                          .make()
                          .onTap(() {
                        Get.to(() => DetailsScreen(
                              item: item,
                            ));
                      }))
                  .toList(),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
