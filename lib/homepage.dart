import 'dart:convert';
import 'package:carousel_slider_app/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carousel Slider App"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                mainAxisExtent: 250),
            itemCount: Global.allImage.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(
                        () {
                      Navigator.pushNamed(context, 'allimage' , arguments: index);
                    },
                  );
                },
                child: Column(
                  children: [
                    Container(
                      height: 210,
                      width: 150,
                      padding: EdgeInsets.all(30),
                      margin: EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                        image: DecorationImage(
                            image: AssetImage(
                              "${Global.allImage[index]['imagetype']}"
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                        child: Text(
                          "${Global.allImage[index]['type']}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black54),
                        ))
                  ],
                ),
              );
            }),
      ),
    );
  }
}
