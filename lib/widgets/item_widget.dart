import 'package:flutter/material.dart';
import 'package:store_application/models/Catlog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: ListTile(
        leading: Image.network(
          item.image,
        ),
        onTap: () {},
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$ ${item.price}",
          style: TextStyle(color: Colors.red, fontSize: 18),
        ),
      ),
    );
  }
}
