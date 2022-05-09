import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_demo/consts/consts.dart';
import 'package:rent_demo/models/items_model.dart';
import 'package:rent_demo/views/home/details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();
  late List<Items> items;
  var results = <Items>[];
  var searching = false;
  readJson() async {
    var data = await DefaultAssetBundle.of(context)
        .loadString("lib/models/items.json");
    items = itemsFromJson(data.toString());
  }

  searchResults(String search) {
    results.clear();
    results = items.where((element) {
      var d = element.name!.toLowerCase().contains(search);
      return d;
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Search".text.make(),
        leading: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: fontColor,
        ).card.rounded.make().onTap(() {
          Navigator.pop(context);
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: const Icon(
                  Icons.search_sharp,
                  color: Colors.redAccent,
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.redAccent)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onChanged: (value) {
                if (value.length > 1) {
                  setState(() {
                    searchResults(value);
                    searching = true;
                  });
                } else {
                  setState(() {
                    searching = false;
                  });
                }
              },
            ).box.roundedSM.white.make(),
            20.heightBox,
            searching && results.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: results.isEmpty ? 0 : results.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () {
                          Get.to(() => DetailsScreen(
                                item: results[index],
                              ));
                        },
                        contentPadding: const EdgeInsets.all(padding8),
                        tileColor: Colors.white,
                        leading: Image.asset(
                          results[index].image.toString(),
                          fit: BoxFit.cover,
                          width: 80,
                        )
                            .box
                            .roundedSM
                            .clip(Clip.antiAliasWithSaveLayer)
                            .make(),
                        title: results[index].name!.text.black.semiBold.make(),
                        subtitle: "Price: ${results[index].price}"
                            .text
                            .color(fontColor)
                            .make(),
                      )
                          .box
                          .roundedSM
                          .margin(const EdgeInsets.only(bottom: 4))
                          .make();
                    },
                  )
                : Container(
                    child: results.isEmpty
                        ? notFound.text.makeCentered()
                        : "".text.make(),
                  ),
          ],
        ),
      ),
    );
  }
}
