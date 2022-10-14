import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn_Page extends StatefulWidget {
  const LogIn_Page({Key? key}) : super(key: key);

  @override
  State<LogIn_Page> createState() => _LogIn_PageState();
}

class _LogIn_PageState extends State<LogIn_Page> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  String rightemail = '';
  String rightpassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
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
                child: Text("Log In"),
                onPressed: () {
                  setData() async {
                    SharedPreferences pref =
                    await SharedPreferences.getInstance();

                    String email = pref.getString('email') ?? '';
                    String password = pref.getString('password') ?? '';

                    rightemail = email;
                    rightpassword = password;

                    if(email == emailcontroller.text && password == passwordcontroller.text){

                      pref.setBool('isLoggedIn', true);

                     Navigator.of(context).pushReplacementNamed('homepage');
                    }
                  }
                    setState(() {
                      if(formKey.currentState!.validate()){
                        setData();
                      }
                    });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

