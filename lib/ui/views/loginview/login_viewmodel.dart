import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_basic/app/locator.dart';
import 'package:stacked_basic/app/loginstatus.dart';
import 'package:stacked_basic/app/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class LoginViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();

  String appbartitle = 'Login';
  String loginviewtitle = "Login Page";
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

  signinWithEmail(BuildContext context, String username, String password) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: username, password: password)
        .then((UserCredential signInUser) {
      Navigator.of(context).pop();
    }).catchError((e) {
      print(e);
    });
  }
}
