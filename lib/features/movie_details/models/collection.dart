class Collection {
  int id;
  String name;
  String backdropPath;

  Collection.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        backdropPath = map['backdrop_path'];
}
