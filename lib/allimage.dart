import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider_app/global.dart';
import 'package:flutter/material.dart';

class All_image extends StatefulWidget {
  const All_image({Key? key}) : super(key: key);

  @override
  State<All_image> createState() => _All_imageState();
}

class _All_imageState extends State<All_image> {
  List image = [];

  @override
  Widget build(BuildContext context) {
    var res = ModalRoute.of(context)!.settings.arguments;

    dynamic toRes = res;

    int index = toRes;

    image = Global.allImage[index]['typeofimages'];

    return Scaffold(
      appBar: AppBar(
        title: Text("${Global.allImage[index]['type']}"),
        centerTitle: true,
      ),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            height: 400,
            enlargeCenterPage: true
          ),
          items: image
              .map((e) => Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage(e['imagee']), fit: BoxFit.cover)),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
