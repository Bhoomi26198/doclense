import 'package:doclense/routing/routes.dart';
import 'package:doclense/ui/contact.dart';
import 'package:doclense/ui/details_page.dart';
import 'package:doclense/ui/listItem.dart';
import 'package:flutter/material.dart';

class PageRoutes {
  static Route<dynamic> onGenerateroute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.contact:
        return _getMaterialPageRoute(ContactPage());
      case Routes.userList:
        return _getMaterialPageRoute(ListItems());
      case Routes.detailsPage:
        return _getMaterialPageRoute(DetailsPage());
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
