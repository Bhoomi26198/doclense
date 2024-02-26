import 'package:doclense/blocs/user_list/userList_bloc.dart';
import 'package:doclense/blocs/user_list/userList_event.dart';
import 'package:doclense/blocs/user_list/userList_state.dart';
import 'package:doclense/constants/app_strings.dart';
import 'package:doclense/data/modals/userList_modal.dart';
import 'package:doclense/routing/routes.dart';
import 'package:doclense/ui/category.dart';
import 'package:doclense/ui/leftDrawer.dart';

import 'package:doclense/ui/notifications.dart';
import 'package:doclense/ui/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String page = 'Home';
  int _currentIndex = 0;

  List body = [
    ListItems(),
    const Category(),
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
        backgroundColor: Colors.blueGrey[100],
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: AppStrings.home,
            icon: const Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: AppStrings.category,
            icon: const Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            label: AppStrings.notification,
            icon: const Icon(Icons.notifications),
          ),
          BottomNavigationBarItem(
            label: AppStrings.myProfile,
            icon: const Icon(Icons.person),
          )
        ],
      ),
    );
  }
}

class ListItems extends StatefulWidget {
  const ListItems({super.key});

  @override
  State<ListItems> createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
  UserListbloc userListbloc = UserListbloc();
  UserListModal userListModal = UserListModal();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // PostRepository().fetchPosts();
    userListbloc.add(GetUserListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.home),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        drawer: const LeftDrawer(),
        body: SizedBox(
            child: Container(
          margin: const EdgeInsets.all(12),
          child: BlocConsumer<UserListbloc, UserListState>(
            bloc: userListbloc,
            listener: (context, state) {
              if (state is UserListSuccessState) {
                isLoading = false;
                state.userListModal!;
              } else if (state is UserListErrorState) {}
            },
            builder: (context, state) {
              if (isLoading) {
                const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              }
              if (state is UserListSuccessState) {
                return ListView.separated(
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
                        state.userListModal![index]!.name!,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'FontMain'),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, Routes.detailsPage);
                      },
                      subtitle: Text(state.userListModal![index]!.statusText!),
                      trailing: const Icon(Icons.add),
                    );
                  },
                  itemCount: state.userListModal!.length,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 20,
                      thickness: 2,
                    );
                  },
                );
              } else {
                return Container();
              }
            },
          ),
        )));
  }
}
