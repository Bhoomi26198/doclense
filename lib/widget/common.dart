import 'dart:io';

import 'package:flutter/material.dart';

File? selectedImage;

Widget buildIcons(IconData icon) {
  return Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      // color: Colors.white,
    ),
    child: Icon(icon, color: Colors.black, size: 20),
  );
}

AppBar customAppBar(
  String title,
) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    backgroundColor: Colors.blueGrey,
    actions: const [
      Visibility(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: SizedBox(
                height: 35,
                width: 35,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      NetworkImage("https://picsum.photos/500/500"),
                ),
              )))
    ],
  );
}

Widget profileImage(image) {
  return Stack(
    children: [
      image != null
          ? CircleAvatar(
              radius: 100,
              backgroundImage: FileImage(File(image!.path)),
            )
          : CircleAvatar(radius: 100, backgroundImage: NetworkImage(image)),
    ],
  );
}
