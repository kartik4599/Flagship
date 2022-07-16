import 'package:flutter/material.dart';
import 'package:store_application/widgets/routes.dart';

class CreateAcc extends StatefulWidget {
  const CreateAcc({Key? key}) : super(key: key);

  @override
  State<CreateAcc> createState() => _CreateAccState();
}

class _CreateAccState extends State<CreateAcc> {
  final _formkey = GlobalKey<FormState>();
  movetoCr2(BuildContext context) {
    if (_formkey.currentState!.validate()) {
      Navigator.pushNamed(context, MyRoutes.CreateAcc2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Center(
            child: Column(
              children: [
                Container(
                  child: Image.asset("assets/images/Create.png"),
                  height: 280,
                ),
                Text(
                  "Create New Account",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "First Name",
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "First name can't be empty";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Last Name",
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Last name can't be empty";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email Address",
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Email Address can't be empty";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Phone Number",
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Phone number can't be empty";
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                    onPressed: () => movetoCr2(context),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    color: Colors.red)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CreateAcc2 extends StatefulWidget {
  const CreateAcc2({Key? key}) : super(key: key);

  @override
  State<CreateAcc2> createState() => _CreateAcc2State();
}

class _CreateAcc2State extends State<CreateAcc2> {
  var pass;
  bool tap = false;
  final _Secondkey = GlobalKey<FormState>();
  movetoLogin(BuildContext context) async {
    if (_Secondkey.currentState!.validate()) {
      setState(() {
        tap = true;
      });

      await Future.delayed(Duration(milliseconds: 600));
      await Navigator.pushNamed(context, MyRoutes.Loginpage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Form(
          key: _Secondkey,
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "UserName",
                    hintText: "Enter new username",
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Username can't be empty";
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "New Password",
                    hintText: "Enter new password",
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Password can't be empty";
                    } else if (value != null && value.length < 6) {
                      return "Password Should be more than 6 characters";
                    }
                    pass = value;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    hintText: "Confirm given password",
                  ),
                  validator: (value) {
                    if (pass != value) {
                      return "Enter Correct password";
                    }
                  },
                ),
              ),
              SizedBox(
                height: 100,
              ),
              InkWell(
                onTap: () => movetoLogin(context),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 600),
                  height: 45,
                  width: tap ? 45 : 150,
                  child: tap
                      ? Icon(Icons.done)
                      : Text(
                          "Create Account",
                          style: TextStyle(fontSize: 17.5, color: Colors.white),
                        ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: tap ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(tap ? 45 : 6)),
                ),
              )
              // RaisedButton(
              //   onPressed: () => movetoLogin(context),
              //   child: Padding(
              //     padding: const EdgeInsets.all(6.0),
              //     child: Text(
              //       "Create Account",
              //       style: TextStyle(fontSize: 18),
              //     ),
              //   ),
              //   color: Colors.red,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
