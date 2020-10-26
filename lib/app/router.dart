import 'package:auto_route/auto_route_annotations.dart';
import 'package:stacked_basic/ui/views/homeview/home_view.dart';
import 'package:stacked_basic/ui/views/loginview/login_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: LoginView),
  ],
)
class $Router {}
