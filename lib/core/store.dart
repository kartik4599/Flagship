import 'package:store_application/models/cart_model.dart';
import 'package:store_application/models/Catlog.dart';
import 'package:velocity_x/velocity_x.dart';

class Mystore extends VxStore {
  late CatalogModel catalog;
  late CartModel cart;

  Mystore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
