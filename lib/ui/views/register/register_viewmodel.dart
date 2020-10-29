import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_basic/app/locator.dart';
import 'package:stacked_basic/app/loginstatus.dart';
import 'package:stacked_basic/app/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class RegisterViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();

  String appbartitle = 'Register';
  String loginviewtitle = "Register Page";
  String usernamelabel = "User Name";
  String usernamehint = "Enter user name";
  String passlabel = "Password";
  String passhint = "Enter Password";

  String dialogheading = "Message";
  String dialogtitle = "Login Success...";
  String dialgosubtitle = "Redirecting to Home Page";
  String dialogbuttontext = "OK";

  bool verifyUser(String username, String password) {
    if (username == 'admin' && password == 'admin') {
      loginstatus = true;
      return true;
    } else
      return false;
  }

  Future navToHomePage() async {
    await _navigationService.navigateTo(Routes.homePage);
  }
}
