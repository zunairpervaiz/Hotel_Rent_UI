import 'package:flutter/material.dart';
import 'package:rent_demo/consts/consts.dart';
import '../views.dart';

import '../../models/items_model.dart';

class ItemsScreen extends StatefulWidget {
  final String? name;
  const ItemsScreen({Key? key, this.name}) : super(key: key);

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  late List<Items> items;

  readJson() async {
    var data = await DefaultAssetBundle.of(context)
        .loadString("lib/models/items.json");

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.name!.text.make(),
        leading: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: fontColor,
        ).card.rounded.make().onTap(() {
          Navigator.pop(context);
        }),
      ),
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: NearbySection(),
      ),
    );
  }
}
