import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_basic/app/locator.dart';
import 'package:stacked_basic/app/loginstatus.dart';
import 'package:stacked_basic/app/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class HomeViewModel extends BaseViewModel {
  String viewTitle = "Home View";
  final NavigationService _navigationService = locator<NavigationService>();

  bool isLoggedIn() {
    if (loginstatus) {
      return true;
    } else {
      return false;
    }
  }

  Future navigatetoLogin() async {
    await _navigationService.navigateTo(Routes.loginView);
  }
}
