import 'dart:developer';
import 'package:contacts_service/contacts_service.dart';
import 'package:doclense/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

var arrayNames = [
  'Bhoomi',
  'Minhaz',
  'Jignesh',
  'Ritesh',
  'Deep',
  'Divyesh',
  'Ridham',
  'Muskan',
  'Yash',
  'Bhavin',
];

var images = [
  'assets/images/woman.png',
  'assets/images/man.png',
  'assets/images/man_2.png',
  'assets/images/man_3.png',
  'assets/images/man.png',
  'assets/images/man_2.png',
  'assets/images/man_3.png',
  'assets/images/woman_1.png',
  'assets/images/man_2.png',
  'assets/images/man.png',
];

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactState();
}

class _ContactState extends State<ContactPage> {
  List<Contact> phone = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getContactPermission();
  }

  void getContactPermission() async {
    if (await Permission.contacts.isGranted) {
      fetchContacts();
    } else {
      await Permission.contacts.request();
    }
  }

  void fetchContacts() async {
    List<Contact> num = await ContactsService.getContacts();
    num.map((e) => e.phones?.map((e) => print("Print----${e.value}")));

    setState(() {
      if (num.isNotEmpty) {
        num = phone;
      }
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.contact),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                child: Container(
                margin: const EdgeInsets.all(12),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const SizedBox(
                        height: 50,
                        width: 50,
                        child: CircleAvatar(
                            backgroundImage: AssetImage(
                          'assets/images/phone.png',
                        )),
                      ),
                      title: Text(
                        phone[index].givenName!,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'FontMain'),
                      ),
                      subtitle: Text(phone[index].phones![0].value!),
                    );
                  },
                  itemCount: arrayNames.length,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 20,
                      thickness: 2,
                    );
                  },
                ),
              )));
  }
}
