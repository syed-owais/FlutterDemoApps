import 'package:flutter/cupertino.dart';

class Items {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String img;

  Items(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.img});
}

class Catalog {
  static final items = [
    Items(
      id: 1,
      name: "Samsung Galaxy Note 20",
      desc:
          "Glass front (Gorilla Victus Glass), glass back (Gorilla Victus Glass), stainless steel frame",
      price: 1360,
      color: "#d0a39d",
      img:
          "https://specifications-pro.com/wp-content/uploads/2020/07/Samsung-Galaxy-Note-20-Ultra-2-600x600.jpg",
    )
  ];
}
