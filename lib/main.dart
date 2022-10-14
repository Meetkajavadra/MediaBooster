import 'package:flutter/material.dart';
import 'package:intro_screen/homepage.dart';
import 'package:intro_screen/intro_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool? isIntroVisited = prefs.getBool('isIntroVisited') ?? false;

  await prefs.setBool('isIntroVisited', isIntroVisited);

  runApp(
    MaterialApp(
      initialRoute: (isIntroVisited == false) ? 'intro_page' : 'homepage',
      routes: {
        'homepage': (context) => HomePage(),
        'intro_page': (context) => Intro_Page(),
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}


