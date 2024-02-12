import 'package:doclense/constants/app_strings.dart';
import 'package:flutter/material.dart';

var images = [
  Image.asset('assets/images/woman.png'),
  Image.asset('assets/images/man.png'),
  Image.asset('assets/images/man_2.png'),
  Image.asset('assets/images/man_3.png'),
  Image.asset('assets/images/woman.png'),
  Image.asset('assets/images/woman_1.png'),
  Image.asset('assets/images/man.png'),
  Image.asset('assets/images/man_3.png'),
  Image.asset('assets/images/man_2.png'),
  Image.asset('assets/images/woman.png'),
];

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.category),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 11,
        mainAxisSpacing: 11,
        children: [
          Container(
              width: 30,
              height: 30,
              child: Image.asset('assets/images/book.png')),
          Container(
              width: 50,
              height: 50,
              child: Image.asset('assets/images/man_2.png')),
          Container(
              width: 50,
              height: 50,
              child: Image.asset('assets/images/woman_1.png')),
          Container(
              width: 50,
              height: 50,
              child: Image.asset('assets/images/man_3.png')),
          Container(
              width: 50,
              height: 50,
              child: Image.asset('assets/images/man.png')),
          Container(
              width: 50,
              height: 50,
              child: Image.asset('assets/images/man_2.png')),
          Container(
              width: 50,
              height: 50,
              child: Image.asset('assets/images/woman.png')),
          Container(
              width: 50,
              height: 50,
              child: Image.asset('assets/images/man.png')),
          Container(
              width: 50,
              height: 50,
              child: Image.asset('assets/images/man_2.png')),
          Container(
              width: 50,
              height: 50,
              child: Image.asset('assets/images/man.png')),
          Container(
              width: 50,
              height: 50,
              child: Image.asset('assets/images/woman_1.png')),
          Container(
              width: 50,
              height: 50,
              child: Image.asset('assets/images/man_3.png')),
          Container(
              width: 50,
              height: 50,
              child: Image.asset('assets/images/man_2.png')),
          Container(
              width: 50,
              height: 50,
              child: Image.asset('assets/images/woman.png')),
          Container(
              width: 50,
              height: 50,
              child: Image.asset('assets/images/woman_1.png')),
          Container(
              width: 50,
              height: 50,
              child: Image.asset('assets/images/man_3.png')),
          Container(
              width: 50,
              height: 50,
              child: Image.asset('assets/images/man.png')),
          Container(
              width: 50,
              height: 50,
              child: Image.asset('assets/images/woman.png')),
          Container(
              width: 50,
              height: 50,
              child: Image.asset('assets/images/man_2.png')),
        ],
      ),
    );
  }
}
