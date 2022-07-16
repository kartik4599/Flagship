import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_application/core/store.dart';
import 'package:store_application/models/cart_model.dart';
import 'package:store_application/models/Catlog.dart';
import 'package:store_application/widgets/them.dart';
import 'package:velocity_x/src/extensions/bool_ext.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/padding.dart';
import 'package:velocity_x/velocity_x.dart';

class addTo_Cart extends StatelessWidget {
  final Item catalog;
  addTo_Cart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(
      context,
      on: [AddMutation, RemoveMutation],
    );
    final CartModel _cart = (VxState.store as Mystore).cart;
    bool isOnCart = _cart.items.contains(catalog);
    return ElevatedButton(
        onPressed: () {
          if (!isOnCart) {
            AddMutation(item: catalog);
          }
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all(StadiumBorder()),
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor)),
        child: isOnCart ? Icon(Icons.done) : "Add to Cart".text.bold.make());
  }
}

class addToDetailCart extends StatelessWidget {
  final Item catalog;
  addToDetailCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as Mystore).cart;
    bool isOnCart = _cart.items.contains(catalog);
    return ElevatedButton.icon(
        icon: Icon(CupertinoIcons.cart),
        onPressed: () {
          if (!isOnCart) {
            AddMutation(item: catalog);
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(MyTheme.darkBlue),
            shape: MaterialStateProperty.all(StadiumBorder())),
        label: "Add to Cart".text.xl.bold.make());
  }
}
