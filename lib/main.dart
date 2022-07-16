import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_application/core/Constant.dart';
import 'package:store_application/core/store.dart';
import 'package:store_application/pages/CreateAcc.dart';
import 'package:store_application/pages/CreditCard.dart';
import 'package:store_application/pages/HomePage.dart';
import 'package:store_application/pages/LoginPage.dart';
import 'package:store_application/pages/cart_page.dart';
import 'package:store_application/widgets/routes.dart';
import 'package:store_application/widgets/them.dart';
import 'package:velocity_x/velocity_x.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constant.prefs = await SharedPreferences.getInstance();
  runApp(VxState(store: Mystore(), child: MyApp()));
  debugDumpApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.themeData(context),
      home:
          Constant.prefs.getBool("LoggedIn") == true ? HomePage() : LoginPage(),
      routes: {
        MyRoutes.Homepage: (context) => HomePage(),
        MyRoutes.Loginpage: (context) => LoginPage(),
        MyRoutes.CreateAcc: (context) => CreateAcc(),
        MyRoutes.CreateAcc2: (context) => CreateAcc2(),
        MyRoutes.Cart: (context) => CartPage(),
        MyRoutes.Credit: (context) => Creadit()
      },
    );
  }
}
