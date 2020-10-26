import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_basic/app/locator.dart';
import 'package:stacked_basic/app/loginstatus.dart';
import 'package:stacked_basic/ui/views/homeview/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      disposeViewModel: true,
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Homepage'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Home Page',
                style: TextStyle(fontSize: 30),
              ),
              Text('You are not logged in....click on button to login page'),
              RaisedButton(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Login Page    ',
                      style: TextStyle(color: Colors.blue),
                    ),
                    Icon(
                      Icons.forward,
                      color: Colors.blue,
                    ),
                  ],
                ),
                onPressed: () {
                  if (!loginstatus)
                    model.navigatetoLogin();
                  else
                    _showMyDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => locator<HomeViewModel>(),
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
                Text('Already Logged in...'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
