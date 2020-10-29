class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userID'],
      id: json['id'],
      title: json['title'],
    );
  }

  List<Album> toDataList() {}
}
