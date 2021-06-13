import 'package:my_day/common/app_exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  static final LocalService instance = LocalService._();

  LocalService._();

  Future<SharedPreferences> _getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  Future<bool> setString(String key, String value) async {
    SharedPreferences sharedPreferences = await _getSharedPreferences();

    return await sharedPreferences.setString(key, value);
  }

  Future<String?> getString(String key) async {
    SharedPreferences sharedPreferences = await _getSharedPreferences();
    
    if (sharedPreferences.containsKey(key)) {
      return await sharedPreferences.getString(key);
    } else {
      throw NoDataException();
    }
  }
}