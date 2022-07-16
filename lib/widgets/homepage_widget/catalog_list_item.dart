import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:store_application/models/Catlog.dart';
import 'package:store_application/pages/HomeDetail.dart';
import 'package:store_application/widgets/homepage_widget/catalogImage.dart';
import '../addToCart.dart';
import 'package:intl/intl.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeDetail(catalog: catalog))),
          child: CatalogItem(
            catalog: catalog,
          ),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,##,000');
    return VxBox(
      child: Row(
        children: [
          Hero(tag: '${catalog.id}', child: CatalogImage(image: catalog.image)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.bold.xl.make(),
              catalog.desc.text.size(12).make(),
              SizedBox(
                height: 8,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  Text(
                    "Rs ${formatter.format(catalog.price)}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  addTo_Cart(catalog: catalog)
                ],
              )
            ],
          ))
        ],
      ),
    )
        .color(context.cardColor)
        .roundedLg
        .square(150)
        .make()
        .pOnly(top: 10, bottom: 10);
  }
}
