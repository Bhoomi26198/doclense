import 'dart:io';

import 'package:doclense/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';

var emailText = TextEditingController();
var numberText = TextEditingController();
var ageText = TextEditingController();
var addressText = TextEditingController();
Uint8List? _image;
File? selectedImage;

class DetailsPage extends StatefulWidget {
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Flexible(child: SingleChildScrollView(child: updateProfile()))
        ],
      )),
    );
  }

  Widget updateProfile() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(12),
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: profileImage()),
              const SizedBox(height: 11),
              TextField(
                controller: emailText,
                decoration: InputDecoration(
                    hintText: "Enter Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              const SizedBox(height: 11),
              TextField(
                keyboardType: TextInputType.phone,
                // maxLength: 10,
                controller: numberText,
                decoration: InputDecoration(
                    hintText: "Enter Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              const SizedBox(height: 11),
              TextField(
                keyboardType: TextInputType.number,
                controller: ageText,
                decoration: InputDecoration(
                    hintText: "Enter Age",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              const SizedBox(height: 11),
              TextField(
                controller: addressText,
                decoration: InputDecoration(
                    hintText: "Enter Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              const SizedBox(height: 11),
              Positioned(
                bottom: 11,
                right: 11,
                child: Container(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.userList);
                      },
                      child: Text("Submit")),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget profileImage() {
    return Stack(
      children: [
        _image != null
            ? CircleAvatar(
                radius: 100,
                backgroundImage: MemoryImage(_image!),
              )
            : const CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(
                    "https://beforeigosolutions.com/pascale-atkinson/attachment/dummy-profile-pic-300x300-1/"),
              ),
        Positioned(
            bottom: 5,
            left: 140,
            child: IconButton(
              onPressed: () {
                showImagePickerModal(context);
              },
              icon: const Icon(
                Icons.add_a_photo,
                size: 30,
                color: Colors.black87,
              ),
            ))
      ],
    );
  }

  void showImagePickerModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 6.5,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        pickImageFromGallery();
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(Icons.image, size: 50),
                            Text("Gallery")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        pickImageFromCamera();
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 50,
                            ),
                            Text("Camera")
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future pickImageFromGallery() async {
    final returnImange =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (returnImange == null) return;
      selectedImage = File(returnImange.path);
      _image = File(returnImange.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

  Future pickImageFromCamera() async {
    final returnImange =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      if (returnImange == null) return;
      selectedImage = File(returnImange.path);
      _image = File(returnImange.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}
