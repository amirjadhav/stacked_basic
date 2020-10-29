import 'package:auto_route/auto_route_annotations.dart';
import 'package:stacked_basic/ui/views/homePage/homepage_view.dart';
import 'package:stacked_basic/ui/views/homeview/home_view.dart';
import 'package:stacked_basic/ui/views/loginview/login_view.dart';
import 'package:stacked_basic/ui/views/register/register_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: HomePage, initial: true),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
  ],
)
class $Router {}
