import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserManagement {
  storeNewUser(UserCredential user, context) {
    FirebaseFirestore.instance.collection('/users').add({
      'credeintails': user.credential
          .toString(), //adding user to firestore ... not working code
      'uid': user.credential,
    }).then((value) {
      print('user added firestore');
      Navigator.of(context).pop();
      Navigator.pushReplacementNamed(context, '/login-view');
    }).catchError((e) {
      print(e);
    });
  }
}
