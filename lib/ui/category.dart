import 'dart:developer';

import 'package:doclense/constants/app_strings.dart';
import 'package:doclense/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List images = [
    {
      "id": 1,
      "image_path": 'assets/images/laptop.jpg',
      'name': "MacBook Air 13″",
      'price': "99900.00",
      'details': "The most affordable Mac laptop to get things done on the go."
    },
    {
      "id": 2,
      "image_path": 'assets/images/headphone_1.jpg',
      'name': "Beats Solo3 Wireless Headphones",
      'price': "24000.00",
      'details': "Beats Studio Pro Wireless Headphones — Sandstone"
    },
    {
      "id": 3,
      "image_path": 'assets/images/macbook.webp',
      'name': "MacBook Air 13″",
      'price': "95900.00",
      'details': "The most affordable Mac laptop to get things done on the go."
    },
    {
      "id": 4,
      "image_path": 'assets/images/mobile_new.jpg',
      'name': "Apple iPhone 15 Pro Max″",
      'price': "1,59.000.00",
      'details': "Apple iPhone 15 Pro Max 256GB Natural Titanium"
    }
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.category),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Stack(
          children: [
            InkWell(
              onTap: () {
                log("message----$currentIndex");
              },
              child: CarouselSlider(
                  items: images
                      .map((item) => InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.categoryDetails,
                                arguments: item,
                              );
                              log("message----$currentIndex");
                            },
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0)),
                              child: Hero(
                                tag: 'background',
                                child: Image.asset(
                                  item['image_path'],
                                  fit: BoxFit.cover,
                                  height: 200,
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                  carouselController: carouselController,
                  options: CarouselOptions(
                    scrollPhysics: const BouncingScrollPhysics(),
                    autoPlay: true,
                    aspectRatio: 2,
                    viewportFraction: 1,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    height: 200,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  )),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: images.asMap().entries.map((entry) {
                  // print(entry);
                  // print(entry.key);
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: currentIndex == entry.key ? 17 : 7,
                      height: 7.0,
                      margin: const EdgeInsets.symmetric(horizontal: 3.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentIndex == entry.key
                              ? Colors.black
                              : Colors.grey),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        const Card(
          margin: EdgeInsets.all(20),
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.laptop),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Laptop",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Card(
          margin: EdgeInsets.only(right: 20, left: 20, bottom: 20),
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.headphones),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Headphone",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Card(
          margin: EdgeInsets.only(right: 20, left: 20, bottom: 20),
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.laptop),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "MacBook",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Card(
          margin: EdgeInsets.only(right: 20, left: 20, bottom: 20),
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.mobile_friendly),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Mobile",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
