import 'package:first_app/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:first_app/models/catalog.dart';

class CartModel {
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

class AddMutation extends VxMutation<Mystore> {
  final Items item;
  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}
