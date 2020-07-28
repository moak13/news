import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

// This class holds the return value of internet connection in boolean

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

// This implementation tends to check of the user device is online or not
@Injectable(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;
  NetworkInfoImpl({@required this.connectionChecker});
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
