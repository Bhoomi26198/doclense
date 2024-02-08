import 'package:doclense/routing/routes.dart';
import 'package:doclense/ui/contact.dart';
import 'package:flutter/material.dart';

class PageRoutes {
  Route? onGenerateroute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.contact:
        return _getMaterialPageRoute(ContactPage());
    }
  }
}

PageRoute _getMaterialPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (BuildContext context) => child,
  );
}
