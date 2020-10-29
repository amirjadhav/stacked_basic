import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_basic/app/locator.dart';
import 'package:stacked_basic/app/loginstatus.dart';
import 'package:stacked_basic/app/router.gr.dart';
import 'package:stacked_basic/services/usermanagement.dart';
import 'package:stacked_basic/ui/views/loginview/login_viewmodel.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:stacked_basic/ui/views/register/register_viewmodel.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _usernamecontroller = new TextEditingController();
    TextEditingController _passwordcontroller = new TextEditingController();
    return ViewModelBuilder<RegisterViewModel>.nonReactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.appbartitle),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  model.loginviewtitle,
                  style: TextStyle(color: Colors.blueGrey, fontSize: 24),
                ),
                SizedBox(height: 50),
                TextField(
                  onSubmitted: (value) => _usernamecontroller.text = value,
                  controller: _usernamecontroller,
                  autofocus: true,
                  cursorColor: Colors.amber,
                  decoration: InputDecoration(
                    labelText: model.usernamelabel,
                    hintText: model.usernamehint,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  onSubmitted: (value) => _passwordcontroller.text = value,
                  controller: _passwordcontroller,
                  obscureText: true,
                  cursorColor: Colors.amber,
                  decoration: InputDecoration(
                    labelText: model.passlabel,
                    hintText: model.passhint,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 30,
                ),
                SignInButtonBuilder(
                  backgroundColor: Colors.grey,
                  text: 'Sign Up with Email',
                  icon: Icons.mail,
                  onPressed: () {
                    if (!(_usernamecontroller.text.isEmpty &&
                        _passwordcontroller.text.isEmpty)) {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _usernamecontroller.text,
                              password: _passwordcontroller.text)
                          .then((UserCredential SignInUser) {
                        print('user strored');
                        SignInUser.credential;
                        UserManagement().storeNewUser(SignInUser, context);
                      }).catchError((e) {
                        print(e);
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => locator<RegisterViewModel>(),
    );
  }
}
