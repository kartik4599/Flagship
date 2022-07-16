import 'package:velocity_x/velocity_x.dart';
import 'package:store_application/core/store.dart';
import 'package:store_application/models/Catlog.dart';

class CartModel {
  //collection of Id's
  late CatalogModel _catalog;

  //Get Catalog
  final List<int> _itemIds = [];

  CatalogModel get catlog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  //Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<Mystore> {
  late final Item item;
  AddMutation({
    required this.item,
  });

  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<Mystore> {
  late final Item item;
  RemoveMutation({
    required this.item,
  });

  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
