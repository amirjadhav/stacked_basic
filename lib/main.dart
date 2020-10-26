import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/locator.dart';
import 'app/router.gr.dart' as approuter;
import 'ui/views/homeview/home_view.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: ExtendedNavigator.builder<approuter.Router>(
        router: approuter.Router(),
        initialRoute: approuter.Routes.homeView,
        navigatorKey: locator<NavigationService>().navigatorKey,
      ),
      title: 'Stacked Demo',
      //home: HomeView(),
      // navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
