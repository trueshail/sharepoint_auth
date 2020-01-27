import 'dart:async';
import "dart:convert" as Convert;
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:sharepoint_auth/model/token.dart';

class TokenStorage {
  static TokenStorage shared = new TokenStorage();
  final String _identifier = "Token";

  Future<void> saveTokenToCache(Token token) async {
    var data = Token.toJsonMap(token);
    var json = Convert.jsonEncode(data);
    await FlutterKeychain.put(key: _identifier, value: json);
  }

  Future<T> loadTokenToCache<T extends Token>() async {
    var json = await FlutterKeychain.get(key: _identifier);
    if (json == null) return null;
    try {
      var data = Convert.jsonDecode(json);
      return _getTokenFromMap<T>(data);
    } catch (exception) {
      print(exception);
      return null;
    }
  }

  Token _getTokenFromMap<T extends Token>(Map<String, dynamic> data) =>
      Token.fromJson(data);

  Future clear() async {
    FlutterKeychain.remove(key: _identifier);
  }
}
