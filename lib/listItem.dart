import 'package:doclense/category.dart';
import 'package:doclense/details_page.dart';
import 'package:doclense/leftDrawer.dart';

import 'package:doclense/notifications.dart';
import 'package:doclense/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String page = 'Home';

  int _currentIndex = 0;
  List body = [
    ListItems(),
    Category(),
    Notifications(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: body[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Category",
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            label: "Notifications",
            icon: Icon(Icons.notifications),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
          )
        ],
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        drawer: LeftDrawer(),
        body: SizedBox(
            child: Container(
          margin: const EdgeInsets.all(12),
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircleAvatar(
                      backgroundImage: AssetImage(
                    images[index].toString(),
                  )),
                ),
                title: Text(
                  arrayNames[index],
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'FontMain'),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailsPage()));
                },
                subtitle: Text('Number'),
                trailing: Icon(Icons.add),
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
