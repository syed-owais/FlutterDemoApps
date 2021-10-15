import 'package:first_app/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();
  factory CartModel() => cartModel;

  //catalog field
  late Catalog _catalog;

  //Collection of IDs - Store Ids of  each item
  final List<int> _itemIds = [];

  //Get catalog
  Catalog get catalog => _catalog;

  // Set catalog
  set catalog(Catalog newCatalog) {
    _catalog = newCatalog;
  }

  //Get Items in the cart list
  List<Items> get items =>
      _itemIds.map((id) => _catalog.getItemById(id)).toList();

  num get totalPrice =>
      items.fold(0, (previousValue, element) => previousValue + element.price);

  // Add item
  void add(Items item) {
    _itemIds.add(item.id);
  }

  // Remove item
  void remove(Items item) {
    _itemIds.remove(item.id);
  }
}
