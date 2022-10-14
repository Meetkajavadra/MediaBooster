import 'package:flutter/material.dart';
import 'package:login_logout/homepage.dart';
import 'login.dart';
import 'register.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool? isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  bool? Registered = prefs.getBool('Registered') ?? false;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: (Registered == false) ? 'register' : (isLoggedIn == true) ? 'homepage' : 'login',
      routes: {
        'register': (context) => RegisterPage(),
        'login': (context) => LogIn_Page(),
        'homepgae': (context) => HomePage(),
      },
    ),
  );
}
