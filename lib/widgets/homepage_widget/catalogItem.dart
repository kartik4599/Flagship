import 'package:flutter/material.dart';
import 'package:store_application/models/Catlog.dart';
import 'package:velocity_x/velocity_x.dart';
import '../them.dart';
import 'catalogImage.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(image: catalog.image),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.bold.xl.color(MyTheme.darkBlue).make(),
              catalog.desc.text.size(12).make(),
              SizedBox(
                height: 8,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(StadiumBorder())),
                      child: "Buy".text.make())
                ],
              ).pOnly(right: 8)
            ],
          ))
        ],
      ),
    ).white.roundedLg.square(150).make().p16();
  }
}
