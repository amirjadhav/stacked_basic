import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_basic/services/usermanagement.dart';

@lazySingleton
class RegisterViewModel extends BaseViewModel {
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

  registerUser(BuildContext context, String username, String password) {
    if (!(username.isEmpty && password.isEmpty)) {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: username, password: password)
          .then((UserCredential SignInUser) {
        print('user strored');
        SignInUser.credential;
        UserManagement().storeNewUser(SignInUser, context);
      }).catchError((e) {
        print(e);
      });
    }
  }
}
