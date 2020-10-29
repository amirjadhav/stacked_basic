import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_basic/app/locator.dart';
import 'package:stacked_basic/ui/views/loginview/login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _usernamecontroller = new TextEditingController();
    TextEditingController _passwordcontroller = new TextEditingController();
    return ViewModelBuilder<LoginViewModel>.nonReactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.appbartitle),
        ),
        body: Padding(
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
              RaisedButton(
                color: Colors.lightBlue,
                onPressed: () {
                  bool result = model.verifyUser(
                      _usernamecontroller.text, _passwordcontroller.text);
                  if (result) _showMyDialog(context, locator<LoginViewModel>());
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => locator<LoginViewModel>(),
    );
  }

  Future<void> _showMyDialog(BuildContext context, LoginViewModel model) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(model.dialogheading),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(model.dialogtitle),
                Text(model.dialgosubtitle),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(model.dialogbuttontext),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                model.navToHomePage();
              },
            ),
          ],
        );
      },
    );
  }
}
