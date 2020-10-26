import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_basic/app/locator.dart';
import 'package:stacked_basic/app/loginstatus.dart';
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
          title: Text('Login'),
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
                'Login Page',
                style: TextStyle(color: Colors.blueGrey, fontSize: 24),
              ),
              SizedBox(height: 50),
              TextField(
                onSubmitted: (value) => _usernamecontroller.text = value,
                controller: _usernamecontroller,
                autofocus: true,
                cursorColor: Colors.amber,
                decoration: InputDecoration(
                  labelText: 'User Name',
                  hintText: 'Enter User name',
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
                autofocus: true,
                cursorColor: Colors.amber,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              RaisedButton(
                color: Colors.lightBlue,
                onPressed: () {
                  if (_usernamecontroller.text == 'admin' &&
                      _passwordcontroller.text == 'admin') {
                    loginstatus = true;
                    _showMyDialog(context);
                  }
                  //Navigator.pop(context);
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

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Login Success...'),
                Text('Redirecting to Home Page'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
