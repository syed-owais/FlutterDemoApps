import 'package:first_app/models/cart.dart';
import 'package:first_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class Mystore extends VxStore {
  CartModel cart = CartModel();
  Catalog catalog = Catalog();

  Mystore() {
    cart.catalog = catalog;
  }
}
