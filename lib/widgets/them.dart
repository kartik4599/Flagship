import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData themeData(BuildContext context) => ThemeData(
      primarySwatch: Colors.red,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamColor,
      buttonColor: Colors.red,
      accentColor: Colors.red,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: GoogleFonts.eczar(),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.red, size: 30),
        titleSpacing: 100,
      ));

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBlue = Color(0xff403b58);
  static Color darkCream = Vx.gray900;
  static Color darkbluish = Vx.indigo900;
}
