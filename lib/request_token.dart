import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:sharepoint_auth/model/config.dart';
import 'package:sharepoint_auth/model/token.dart';
import 'package:sharepoint_auth/request/accesstoken_request.dart';

class RequestToken {
  final SharepointConfig config;
  TokenRequestDetails _tokenRequest;

  RequestToken(this.config);

  Future<Token> requestToken() async {
    _generateTokenRequest();
    return await _sendTokenRequest(_tokenRequest.params, _tokenRequest.headers);
  }

  Future<Token> _sendTokenRequest(
      Map<String, String> params, Map<String, String> headers) async {
    Response response =
        await post("${_tokenRequest.url}", body: params, headers: headers);
    Map<String, dynamic> tokenJson = json.decode(response.body);
    // print('Token Type : ' + tokenJson["token_type"]);
    // print('Expires In : ' + tokenJson["expires_in"]);
    // print('Not Before : ' + tokenJson["not_before"]);
    // print('Expires On : ' + tokenJson["expires_on"]);
    // print('Resource : ' + tokenJson["resource"]);
    // print('Access Token : ' + tokenJson["access_token"]);

    Token token = new Token.fromJson(tokenJson);

    return token;
  }

  void _generateTokenRequest() {
    _tokenRequest = new TokenRequestDetails(config);
  }
}
