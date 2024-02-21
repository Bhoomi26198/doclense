import 'dart:developer';
import 'dart:io';

import 'package:doclense/blocs/updateProfile/updateProfile_block.dart';
import 'package:doclense/blocs/updateProfile/updateProfile_event.dart';
import 'package:doclense/blocs/updateProfile/updateProfile_state.dart';
import 'package:doclense/constants/app_strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

var fnameText = TextEditingController();
var lnameText = TextEditingController();
var emailText = TextEditingController();
var numberText = TextEditingController();
var ageText = TextEditingController();
var addressText = TextEditingController();
XFile? image;
final ImagePicker picker = ImagePicker();
UpdateProfileBloc updateProfileBloc = UpdateProfileBloc();
final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Uint8List? _image;
  File? selectedImage;

  void submitForm() {
    if (formKey.currentState!.validate()) {
      updateProfileBloc.add(UpdateProfileEvent(
          image: image != null ? image!.path : "",
          firstname: fnameText.text,
          lastname: lnameText.text,
          email: emailText.text));
    }
  }

  String? validateEmail(value) {
    if (value!.isEmpty) {
      return "Please Enter an Email";
    }
    RegExp emailRegExp =
        RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return "Please Enter Valid Email";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.userProfile),
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
    // final provider = Provider.of<ProfileProvider>(context, listen: true);
    return BlocConsumer<UpdateProfileBloc, UpdateProfileState>(
      bloc: updateProfileBloc,
      listener: (context, state) {
        if (state is UpdateProfileSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(AppStrings.profileUpdateSuccess),
                backgroundColor: Colors.green),
          );
          // Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              margin: EdgeInsets.all(12),
              color: Colors.transparent,
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: profileImage()),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: fnameText,
                      decoration: InputDecoration(
                          labelText: AppStrings.enterFName,
                          hintText: AppStrings.enterFName,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter First Name";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: lnameText,
                      decoration: InputDecoration(
                          labelText: AppStrings.enterLName,
                          hintText: AppStrings.enterLName,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Last Name";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                        controller: emailText,
                        decoration: InputDecoration(
                            labelText: AppStrings.enterEmail,
                            hintText: AppStrings.enterEmail,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        validator: validateEmail),
                    const SizedBox(height: 16),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: numberText,
                      decoration: InputDecoration(
                          labelText: AppStrings.enterNum,
                          hintText: AppStrings.enterNum,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Phone Number";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // TextFormField(
                    //   keyboardType: TextInputType.number,
                    //   controller: ageText,
                    //   decoration: InputDecoration(
                    //       hintText: "Enter Age",
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(20),
                    //       )),
                    //   onChanged: (val) {
                    //     provider.checkAgeEligibility(int.parse(val));
                    //   },
                    // ),
                    // Text(
                    //   textAlign: TextAlign.start,
                    //   provider.eligibilityMsg.toString(),
                    //   style: TextStyle(
                    //       color: (provider.isEligible == true)
                    //           ? Colors.green
                    //           : Colors.red),
                    // ),
                    // const SizedBox(height: 16),
                    // TextFormField(
                    //   controller: addressText,
                    //   decoration: InputDecoration(
                    //       hintText: "Enter Address",
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(20),
                    //       )),
                    // ),
                    // const SizedBox(height: 16),
                    // const DropdownMenu(
                    //   dropdownMenuEntries: [
                    //     DropdownMenuEntry(value: Colors.blue, label: 'Male'),
                    //     DropdownMenuEntry(value: Colors.pink, label: 'Female')
                    //   ],
                    //   enableSearch: true,
                    //   width: 370,
                    // ),
                    const SizedBox(height: 16),
                    Positioned(
                      bottom: 11,
                      right: 11,
                      child: ElevatedButton(
                          onPressed: submitForm,
                          child: Text(AppStrings.update)),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget profileImage() {
    return Stack(
      children: [
        image != null
            ? CircleAvatar(
                radius: 100,
                // backgroundImage: MemoryImage(_image!),
                backgroundImage: FileImage(File(image!.path)),
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
                            const Icon(Icons.image, size: 50),
                            Text(AppStrings.gallery)
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
                            const Icon(
                              Icons.camera_alt,
                              size: 50,
                            ),
                            Text(AppStrings.camera)
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
    image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {});
    }
    // final returnImange = await picker.pickImage(source: ImageSource.gallery);
    // setState(() {
    //   if (returnImange == null) return;
    //   selectedImage = File(returnImange.path);
    //   _image = File(returnImange.path).readAsBytesSync();
    // });
    Navigator.of(context).pop();
  }

  Future pickImageFromCamera() async {
    image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {});
    }

    // final returnImange = await ImagePicker().pickImage(source: ImageSource.camera);

    // setState(() {
    //   if (returnImange == null) return;
    //   selectedImage = File(returnImange.path);
    //   _image = File(returnImange.path).readAsBytesSync();
    // });
    Navigator.of(context).pop();
  }
}
