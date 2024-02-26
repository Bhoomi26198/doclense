import 'package:doclense/routing/routes.dart';
import 'package:doclense/ui/categoryDetail.dart';
import 'package:doclense/ui/contact.dart';
import 'package:doclense/ui/details_page.dart';
import 'package:doclense/ui/listItem.dart';
import 'package:doclense/ui/login.dart';
import 'package:doclense/ui/splash_screen.dart';
import 'package:flutter/material.dart';

class PageRoutes {
  static Route<dynamic> onGenerateroute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return _getMaterialPageRoute(const SplashScreen());
      case Routes.login:
        return _getMaterialPageRoute(const Login());
      case Routes.contact:
        return _getMaterialPageRoute(const ContactPage());
      case Routes.userList:
        return _getMaterialPageRoute(ListItems());
      case Routes.detailsPage:
        return _getMaterialPageRoute(DetailsPage());
      case Routes.categoryDetails:
        return _getMaterialPageRoute(
            CategoryDetails(item: settings.arguments as Object));
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Container(),
        );
    }
  }
}

PageRoute _getMaterialPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (BuildContext context) => child,
  );
}
