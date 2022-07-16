import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_application/core/store.dart';
import 'package:store_application/models/cart_model.dart';
import 'package:store_application/widgets/homepage_widget/catalogHearder.dart';
import 'package:store_application/widgets/homepage_widget/catalog_list_item.dart';
import 'package:store_application/widgets/them.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:store_application/models/Catlog.dart';
import 'package:store_application/widgets/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "";
  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    var catlogJson = await rootBundle.loadString("assets/other/catlog.json");
    var decoded = jsonDecode(catlogJson);
    var productData = decoded["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as Mystore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (BuildContext context, store, VxStatus? status) {
          return FloatingActionButton(
                  backgroundColor: context.theme.buttonColor,
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.Cart);
                  },
                  child: Icon(
                    CupertinoIcons.cart,
                    size: 28,
                  ))
              .badge(
                  color: MyTheme.darkBlue,
                  size: 22,
                  count: _cart.items.length,
                  textStyle: TextStyle(color: Colors.white));
        },
      ),
      body: SafeArea(
        child: Container(
            padding: Vx.m24,
            child: Column(
              children: [
                CatalogHearder(),
                SizedBox(
                  height: 25,
                ),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().expand()
                else
                  Center(child: CircularProgressIndicator())
              ],
            )),
      ),
    );
    ;
  }
}
