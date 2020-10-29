import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app/locator.dart';
import 'app/router.gr.dart' as approuter;

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: ExtendedNavigator.builder<approuter.Router>(
        router: approuter.Router(),
        //initialRoute:
        //    loginstatus ? approuter.Routes.homePage : approuter.Routes.homeView,
        initialRoute: approuter.Routes.loginView,
        navigatorKey: locator<NavigationService>().navigatorKey,
      ),
      title: 'Stacked Demo',
      //home: HomeView(),
      // navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
