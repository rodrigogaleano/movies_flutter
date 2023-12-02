class ApiHost {
  ApiHost._();

  static String get version => '3';

  static String get baseURL {
    return 'https://api.themoviedb.org/$version';
  }

  static Map<String, String> get defaultQueryParams {
    return {
      'api_key': '88ee9533acb6d4f3193bab7b9d06e012',
      'language': 'pt-BR',
    };
  }
}
