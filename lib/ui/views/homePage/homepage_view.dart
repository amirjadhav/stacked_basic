import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_basic/app/locator.dart';
import 'package:stacked_basic/entities/album.dart';
import 'package:stacked_basic/ui/views/homePage/homepage_viewmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.nonReactive(
      builder: (context, model, child) {
        List<Album> albumList;
        albumList = model.getAlbums();
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/login-view');
            },
            child: Text('Log out'),
          ),
          appBar: AppBar(
            title: Text('Homepage'),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              return _myContainer(albumList[index].id, albumList[index].title);
            },
            itemCount: albumList.length,
          ),
        );
      },
      viewModelBuilder: () => locator<HomePageViewModel>(),
    );
  }

  Widget _myContainer(int id, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.05),
                borderRadius: BorderRadius.circular(16.0),
              ),
              width: double.infinity,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User ID : ' + id.toString(),
                      style: TextStyle(fontSize: 20, color: Colors.amber),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Title : ' + title,
                      style: TextStyle(fontSize: 25, color: Colors.cyan),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
