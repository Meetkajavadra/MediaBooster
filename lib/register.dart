import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailcontroller,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter Email';
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email Address",
                  hintText: "Enter Email Here",
                ),
              ),
              TextFormField(
                controller: passwordcontroller,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter Password';
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  hintText: "Enter Password Here",
                ),
              ),
              ElevatedButton(
                  child: Text("Register"),
                  onPressed: () {
                    setData() async {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();

                      String email = emailcontroller.text;
                      String password = passwordcontroller.text;

                      pref.setBool('Registered', true);
                      pref.setString('email', email);
                      pref.setString('password', password);
                    }

                    setState(() {
                      if (formKey.currentState!.validate()) {
                        setData();
                        Navigator.of(context).pushReplacementNamed('login');
                      }
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
