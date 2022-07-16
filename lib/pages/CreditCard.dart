import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_application/main.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';

class Creadit extends StatelessWidget {
  const Creadit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: context.canvasColor,
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 50, left: 25, bottom: 20, right: 25),
                child: Text(
                  "Set Up Your Credit or Debit Card",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poly().fontFamily),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, top: 10, right: 25, bottom: 10),
                child: TextFormField(
                  style: TextStyle(color: Colors.red),
                  decoration: const InputDecoration(
                    labelText: "First Name",
                    labelStyle: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, top: 10, right: 25, bottom: 10),
                child: TextFormField(
                  style: TextStyle(color: Colors.red),
                  decoration: const InputDecoration(
                    labelText: "Last Name",
                    labelStyle: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, top: 10, right: 25, bottom: 10),
                child: TextFormField(
                  style: TextStyle(color: Colors.red),
                  decoration: const InputDecoration(
                    labelText: "Card Number",
                    hintText: "XXXX XXXX XXXX XXXX",
                    labelStyle: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, top: 10, right: 25, bottom: 10),
                child: TextFormField(
                  style: TextStyle(color: Colors.red),
                  decoration: const InputDecoration(
                    hintText: "MM/YY",
                    labelText: "Expired Date",
                    labelStyle: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, top: 10, right: 25, bottom: 10),
                child: TextFormField(
                  style: TextStyle(color: Colors.red),
                  decoration: const InputDecoration(
                    labelText: "Security Code (CVV)",
                    labelStyle: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Card Detail Not Valid"),
                    )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      "Submit",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
