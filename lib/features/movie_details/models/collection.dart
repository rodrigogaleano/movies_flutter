class Collection {
  int id;
  String name;
  String backdropPath;

  Collection({
    required this.id,
    required this.name,
    required this.backdropPath,
  });

  static Collection? fromMap(Map<String, dynamic>? map) {
    final collectionMap = map;

    if (collectionMap != null) {
      return Collection(
        id: collectionMap['id'],
        name: collectionMap['name'],
        backdropPath: collectionMap['backdrop_path'],
      );
    }

    return null;
  }
}
