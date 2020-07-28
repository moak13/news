import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

// This class handles failures that tends to occur during application process
abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// Handles all server error messages
class ServerError extends Failure {
  final String message;
  ServerError({@required this.message});
  @override
  List<Object> get props => [message];
}

// Handles all cache error messages
class CacheError extends Failure {
  final String message;
  CacheError({@required this.message});
  @override
  List<Object> get props => [message];
}
