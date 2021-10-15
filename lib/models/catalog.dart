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

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      img: map["img"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "img": img,
      };
}

class Catalog {
  static final catalog = Catalog._internal();

  Catalog._internal();
  factory Catalog() => catalog;

  static List<Items> items = [];

  Items getItemById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  Items getItemByPosition(int pos) => items[pos];
}
