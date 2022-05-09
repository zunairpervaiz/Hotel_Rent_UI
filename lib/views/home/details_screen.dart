import 'package:flutter/material.dart';
import 'package:rent_demo/consts/consts.dart';
import 'package:rent_demo/models/items_model.dart';

class DetailsScreen extends StatelessWidget {
  final Items? item;

  const DetailsScreen({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: item!.name!.text.make(),
        leading: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: fontColor,
        ).card.rounded.make().onTap(() {
          Navigator.pop(context);
        }),
        actions: const [
          CircleAvatar(
            radius: 15,
            backgroundColor: Colors.redAccent,
            child: Icon(
              Icons.favorite,
              size: 14.0,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          item!.image.toString(),
                          width: context.screenWidth,
                          height: 220,
                          fit: BoxFit.cover,
                        ).box.roundedSM.clip(Clip.antiAlias).make(),
                        10.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            item!.name!.text.semiBold.make(),
                            "${item!.price}/month"
                                .text
                                .semiBold
                                .color(Colors.redAccent)
                                .make()
                          ],
                        ),
                        5.heightBox,
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_rounded,
                              size: 14.0,
                              color: Colors.grey,
                            ),
                            5.widthBox,
                            item!.location!.text.make(),
                          ],
                        ),
                        10.heightBox,
                        description.text.black.semiBold.make(),
                        10.heightBox,
                        item!.desc!.text.color(fontColor).make(),
                        10.heightBox,
                        gallery.text.black.semiBold.make(),
                        10.heightBox,
                        Row(
                          children: imageList
                              .map((e) => Image.asset(
                                    e,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  )
                                      .box
                                      .roundedSM
                                      .clip(Clip.antiAlias)
                                      .margin(const EdgeInsets.only(right: 8.0))
                                      .make())
                              .toList(),
                        ),
                      ],
                    ),
                    Positioned(
                        top: 10,
                        right: 10,
                        child: Row(
                          children: [
                            const Icon(Icons.star_rounded,
                                size: 12.0, color: Colors.orangeAccent),
                            10.widthBox,
                            item!.rating!.text.white.make()
                          ],
                        )
                            .box
                            .color(Colors.black.withOpacity(0.4))
                            .roundedLg
                            .padding(const EdgeInsets.symmetric(
                                horizontal: padding8, vertical: 8.0))
                            .make())
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: buttonsList
                    .mapIndexed((button, index) => SizedBox(
                          height: 60,
                          width: context.screenWidth / 2.5,
                          child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(padding12),
                                  primary: Colors.redAccent),
                              onPressed: () {},
                              icon: Icon(buttonIconsList[index]),
                              label: button.text.semiBold.make()),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
