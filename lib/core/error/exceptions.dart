// This abstact class is the base implementation of exception
abstract class AppException implements Exception {}

// This class handles all server request exceptions that occur
class ServerException extends AppException {}

// This class handles all cache request exceptions that occur
class CacheException extends AppException {}
