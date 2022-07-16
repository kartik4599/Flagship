import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHearder extends StatelessWidget {
  const CatalogHearder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
          child: Text(
            "Flagship",
            style: TextStyle(
                shadows: [
                  Shadow(
                    color: Colors.grey,
                  )
                ],
                fontFamily: GoogleFonts.poly().fontFamily,
                fontSize: 50,
                color: Colors.red,
                fontWeight: FontWeight.bold),
          ),
        ),
        // "Flagship "
        //     .text
        //     .xl5
        //     .bold
        //     .color(context.accentColor)
        //     .make()
        //     .pOnly(left: 25),
        "Trending Products".text.bold.xl2.make().pOnly(left: 15),
      ],
    );
  }
}
