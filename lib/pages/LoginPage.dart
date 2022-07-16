import 'package:flutter/material.dart';
import 'package:store_application/core/Constant.dart';
import 'package:store_application/widgets/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";

  bool chame = false;

  bool tap = false;
  final _formkey = GlobalKey<FormState>();
  movetoHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        tap = true;
      });
      await Future.delayed(Duration(milliseconds: 500));
      Constant.prefs.setBool("LoggedIn", true);
      await Navigator.pushReplacementNamed(context, MyRoutes.Homepage);
      setState(() {
        tap = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset("assets/images/Wel.png"),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              chame ? "Welcome $name" : "Login",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 33,
                  fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "UserName",
                  hintText: "Enter Id",
                  icon: Icon(Icons.login),
                ),
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return "Username is not empty";
                  }
                },
                onChanged: (value) {
                  name = value;
                  setState(() {});
                  chame = true;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter Password",
                  icon: Icon(Icons.security),
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Password is not empty";
                  } else if (value != null && value.length < 6) {
                    return "Password Be atleast 6 Charcters";
                  }
                },
              ),
            ),
            SizedBox(
              height: 45,
            ),
            InkWell(
              onTap: () => movetoHome(context),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: tap ? 45 : 130,
                height: 43,
                alignment: Alignment.center,
                child: tap
                    ? Icon(Icons.done)
                    : Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                decoration: BoxDecoration(
                  color: tap ? Colors.green : Colors.redAccent,
                  borderRadius: BorderRadius.circular(tap ? 46 : 7),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.CreateAcc);
              },
              color: Colors.indigo[400],
              child: Text(
                "   Create Account   ",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
