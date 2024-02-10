import 'dart:io';

import 'package:doclense/providers/profile_provider.dart';
import 'package:doclense/routing/routes.dart';
import 'package:doclense/ui/contact.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

var emailText = TextEditingController();
var numberText = TextEditingController();
var ageText = TextEditingController();
var addressText = TextEditingController();
XFile? image;
final ImagePicker picker = ImagePicker();

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Uint8List? _image;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Flexible(child: SingleChildScrollView(child: updateProfile(context)))
        ],
      )),
    );
  }

  Widget updateProfile(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context, listen: true);
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
                onChanged: (val) {
                  provider.checkAgeEligibility(int.parse(val));
                },
              ),
              Text(
                textAlign: TextAlign.start,
                provider.eligibilityMsg.toString(),
                style: TextStyle(
                    color: (provider.isEligible == true)
                        ? Colors.green
                        : Colors.red),
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
              const DropdownMenu(
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: Colors.blue, label: 'Male'),
                  DropdownMenuEntry(value: Colors.pink, label: 'Female')
                ],
                enableSearch: true,
                width: 370,
              ),
              const SizedBox(height: 11),
              Positioned(
                bottom: 11,
                right: 11,
                child: ElevatedButton(onPressed: () {}, child: Text("Update")),
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
                      child: const SizedBox(
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
                      child: const SizedBox(
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
