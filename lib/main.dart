// import 'package:doclense/blocs/internet_bloc/internet_bloc.dart';
// import 'package:doclense/blocs/login/login_bloc.dart';
import 'package:doclense/providers/profile_provider.dart';
import 'package:doclense/routing/router.dart';
import 'package:doclense/ui/listItem.dart';
import 'package:doclense/ui/login.dart';
import 'package:doclense/ui/splash_screen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => InternetBloc(),
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(scaffoldBackgroundColor: Colors.blueGrey[100]),
//         home: AnimatedSplashScreen(
//           splash: SplashScreen(),
//           nextScreen: BlocProvider(
//             create: (context) => LoginBloc(),
//             child: Login(),
//           ),
//           splashTransition: SplashTransition.fadeTransition,
//         ),
//         onGenerateRoute: PageRoutes.onGenerateroute,
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(scaffoldBackgroundColor: Colors.blueGrey[100]),
//       home: AnimatedSplashScreen(
//         splash: SplashScreen(),
//         nextScreen: HomePage(),
//       ),
//       onGenerateRoute: PageRoutes.onGenerateroute,
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProfileProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.blueGrey[100]),
        home: AnimatedSplashScreen(
          splash: const SplashScreen(),
          nextScreen: Login(),
        ),
        onGenerateRoute: PageRoutes.onGenerateroute,
      ),
    );
  }
}

class NavigationService {
  GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  static NavigationService instance = NavigationService();

  NavigationService() {
    navigationKey = GlobalKey<NavigatorState>();
  }

  Future<dynamic> navigateToReplacement(String rn) {
    return navigationKey.currentState!.pushReplacementNamed(rn);
  }

  Future<dynamic> navigateTo(String rn) {
    return navigationKey.currentState!.pushNamed(rn);
  }

  Future<dynamic> navigateToRoute(MaterialPageRoute rn) {
    return navigationKey.currentState!.push(rn);
  }

  goback() {
    return navigationKey.currentState!.pop();
  }
}
