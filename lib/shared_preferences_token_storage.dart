import 'package:igdb_api/remote_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesTokenStorage extends TokenStorage<String?> {
  SharedPreferencesTokenStorage(this.prefs);

  final SharedPreferences prefs;

  @override
  Future<void> delete() async {
    await prefs.remove('auth_token');
    return;
  }

  @override
  Future<String?> read() async {
    return prefs.getString('auth_token');
  }

  @override
  Future<void> write(String? token) async {
    if (token == null) {
      return delete();
    }

    await prefs.setString('auth_token', token);
    return;
  }
}
