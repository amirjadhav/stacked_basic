import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'package:stacked_basic/ui/views/homePage/album.dart';

@lazySingleton
class HomePageViewModel extends BaseViewModel {
  String url = "https://jsonplaceholder.typicode.com/albums";
  var albums = List<Album>();

  Future<List<Album>> fetchAlbum() async {
    final response = await http.get(url);

    print('fetching data from url');
    if (response.statusCode == 200) {
      var albumjson = json.decode(response.body);

      for (var aljson in albumjson) {
        albums.add(Album.fromJson(aljson));
      }
      // print(albums[0].title);
      return albums;
    } else {
      throw Exception('Failed to load data');
    }
  }

  List<Album> getAlbums() {
    fetchAlbum();
    return albums;
  }
}
