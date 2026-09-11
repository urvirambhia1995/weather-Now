class ServerException implements Exception {
  final String message;
  ServerException([this.message = 'A server error occurred']);

  @override
  String toString() => message;
}

class CacheException implements Exception {
  final String message;
  CacheException([this.message = 'A cache error occurred']);

  @override
  String toString() => message;
}

class NetworkException implements Exception {
  final String message;
  NetworkException([this.message = 'No internet connection']);

  @override
  String toString() => message;
}
