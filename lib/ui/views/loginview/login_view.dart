import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_basic/app/locator.dart';
import 'package:stacked_basic/ui/views/loginview/login_viewmodel.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _usernamecontroller = new TextEditingController();
    TextEditingController _passwordcontroller = new TextEditingController();
    return ViewModelBuilder<LoginViewModel>.nonReactive(
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
                SignInButton(
                  Buttons.Email,
                  onPressed: () {
                    model.signinWithEmail(context, _usernamecontroller.text,
                        _passwordcontroller.text);
                  },
                ),
                SizedBox(height: 30),
                SignInButtonBuilder(
                    icon: Icons.add,
                    backgroundColor: Colors.black38,
                    onPressed: () {
                      Navigator.pushNamed(context, '/register-view');
                    },
                    text: 'Sign Up'),
                Text('Dont have Account ? Sign Up here'),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => locator<LoginViewModel>(),
    );
  }
}
