// To parse this JSON data, do
//
//     final items = itemsFromJson(jsonString);

import 'dart:convert';

List<Items> itemsFromJson(String str) =>
    List<Items>.from(json.decode(str).map((x) => Items.fromJson(x)));

String itemsToJson(List<Items> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Items {
  Items(
      {this.name,
      this.desc,
      this.price,
      this.location,
      this.image,
      this.rating});

  String? name;
  String? desc;
  String? price;
  String? location;
  String? image;
  String? rating;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
      name: json["name"],
      desc: json["desc"],
      price: json["price"],
      location: json["location"],
      image: json["image"],
      rating: json["rating"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "desc": desc,
        "price": price,
        "location": location,
        "image": image,
      };
}
