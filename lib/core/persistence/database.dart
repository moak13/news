import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

// This is a contract database class
abstract class Database {
  Future<void> save({@required String key, @required String value});
  Future<String> pull({@required String key});
}

class DatabaseImpl implements Database {
  final SharedPreferences sharedPreferences;
  DatabaseImpl({@required this.sharedPreferences});

  // This set the data to be stored
  @override
  Future<void> save({String key, String value}) {
    return sharedPreferences.setString(key, value);
  }

  // This get the stored data
  @override
  Future<String> pull({String key}) {
    return sharedPreferences.get(key);
  }
}
