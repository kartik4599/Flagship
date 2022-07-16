import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_application/widgets/addToCart.dart';
import 'package:store_application/widgets/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:store_application/models/Catlog.dart';
import 'package:intl/intl.dart';

class HomeDetail extends StatelessWidget {
  final Item catalog;
  const HomeDetail({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,##,000');
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: context.canvasColor,
      ),
      body: Column(
        children: [
          Container(
              height: 300,
              width: 400,
              child: Hero(
                  tag: '${catalog.id}',
                  child: Image.network(
                    catalog.image,
                  ))),
          Expanded(
              child: VxArc(
            height: 30,
            arcType: VxArcType.CONVEY,
            edge: VxEdge.TOP,
            child: Container(
              width: context.screenWidth,
              color: context.cardColor,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      catalog.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.poppins().fontFamily),
                    ),
                  ),
                  Container(
                    height: 20,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      catalog.desc,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: Column(children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            catalog.color,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: GoogleFonts.sora().fontFamily,
                            ),
                          ).p12(),
                        ),
                      ),
                    ]),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      "Rs ${formatter.format(catalog.price)}"
                          .text
                          .bold
                          .xl2
                          .make(),
                      addToDetailCart(
                        catalog: catalog,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, MyRoutes.Credit);
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(StadiumBorder()),
                            backgroundColor: MaterialStateProperty.all(
                                context.theme.buttonColor),
                          ),
                          child: "Buy".text.xl.bold.make().p8())
                    ],
                  ).pOnly(left: 3, right: 3, top: 5)
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
