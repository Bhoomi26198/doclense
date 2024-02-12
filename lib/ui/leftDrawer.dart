import 'package:doclense/constants/app_strings.dart';
import 'package:doclense/ui/contact.dart';
import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey[50],
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blueGrey),
            child: Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage(
                        "https://beforeigosolutions.com/pascale-atkinson/attachment/dummy-profile-pic-300x300-1/"),
                  ),
                  Text(
                    AppStrings.myProfile,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: Text(
              AppStrings.home,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactPage()));

              // Navigator.pushNamed(context, Routes.contact);
            },
            leading: const Icon(
              Icons.contact_page,
              color: Colors.black,
            ),
            title: Text(
              AppStrings.contact,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.favorite,
              color: Colors.black,
            ),
            title: Text(
              AppStrings.favorite,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.mail,
              color: Colors.black,
            ),
            title: Text(
              AppStrings.inbox,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            title: Text(
              AppStrings.setting,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
