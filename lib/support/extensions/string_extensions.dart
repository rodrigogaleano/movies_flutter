extension StringExtensions on String {
  String toPosterPathUrl() {
    return 'https://image.tmdb.org/t/p/original$this';
  }
}
