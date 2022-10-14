import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intro_Page extends StatefulWidget {
  const Intro_Page({Key? key}) : super(key: key);

  @override
  State<Intro_Page> createState() => _Intro_PageState();
}

class _Intro_PageState extends State<Intro_Page> {
  final pagecontroller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 60),
        child: PageView(
          controller: pagecontroller,
          onPageChanged: (val) {
            setState(() {
              isLastPage = (val == 2);
            });
          },
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              color: Colors.blue,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "To",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              color: Colors.blueGrey,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Intro Screen App",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              color: Colors.indigo,
            ),
          ],
        ),
      ),
      bottomSheet: (isLastPage == true)
          ? SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  await prefs.setBool('isIntroVisited', true);

                  Navigator.of(context).pushReplacementNamed('homepage');
                },
                child: Text("Get Started"),
              ),
            )
          : Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () async {
                     // pagecontroller.jumpToPage(2);

                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();

                      await prefs.setBool('isIntroVisited', true);

                      Navigator.of(context).pushReplacementNamed('homepage');

                    },
                    child: Text("Skip"),
                  ),
                  TextButton(
                    onPressed: () {
                      pagecontroller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    },
                    child: Text("Next"),
                  ),
                ],
              ),
            ),
    );
  }
}
