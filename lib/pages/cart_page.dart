import 'package:flutter/material.dart';
import 'package:store_application/core/store.dart';
import 'package:store_application/widgets/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:store_application/models/cart_model.dart';
import 'package:intl/intl.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: context.canvasColor,
        titleSpacing: 90,
        title: Text(
          "Cart",
          style: TextStyle(
            color: Colors.red,
            fontSize: 35,
          ),
        ).pOnly(top: 10),
      ),
      body: Column(
        children: [
          cartlist().p12().expand(),
          Divider(
            thickness: 1,
          ),
          total(),
        ],
      ),
    );
  }
}

class total extends StatefulWidget {
  const total({Key? key}) : super(key: key);

  @override
  State<total> createState() => _totalState();
}

class _totalState extends State<total> {
  get mutations => null;

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as Mystore).cart;
    var formatter = NumberFormat('#,##,000');
    return SizedBox(
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
            mutations: {RemoveMutation},
            builder: (BuildContext context, store, VxStatus? status) {
              return "Rs ${formatter.format(_cart.totalPrice)}".text.xl4.make();
            },
          ),
          30.widthBox,
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.Credit);
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(context.theme.buttonColor),
                  shape: MaterialStateProperty.all(StadiumBorder())),
              child: "Buy".text.xl2.bold.make().px12().py8())
        ],
      ),
    );
  }
}

class cartlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as Mystore).cart;
    return _cart.items.isEmpty
        ? "Please Select Product"
            .text
            .color(context.theme.buttonColor)
            .xl2
            .bold
            .makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                leading: Icon(Icons.done),
                trailing: IconButton(
                    onPressed: () {
                      RemoveMutation(item: _cart.items[index]);
                    },
                    icon: Icon(Icons.cancel)),
                title: _cart.items[index].name.toString().text.xl2.make(),
                subtitle: "Rs ${_cart.items[index].price}".text.xl.make()));
  }
}
