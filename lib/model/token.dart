class Token {

  //offset is subtracted from expire time
  final expireOffSet = 1800;

  String accessToken;
  String tokenType;
  String expiresOn;
  DateTime issueTimeStamp;
  DateTime expireTimeStamp;
  String expiresIn;

  Token();

  factory Token.fromJson(Map<String, dynamic> json) =>
      Token.fromMap(json);

  Map toMap() => Token.toJsonMap(this);

  @override
  String toString() => Token.toJsonMap(this).toString();

  static Map toJsonMap(Token model) {
    Map ret = new Map();
    if (model != null) {
      if (model.accessToken != null) {
        ret["access_token"] = model.accessToken;
      }
      if (model.tokenType != null) {
        ret["token_type"] = model.tokenType;
      }
      if (model.expiresOn != null ) {
        ret["expires_on"] = model.expiresOn;
      }
      if (model.expiresIn != null ) {
        ret["expires_in"] = model.expiresIn;
      }      
    }
    return ret;
  }

  static Token fromMap(Map map) {
    if (map == null)
      throw new Exception("No token from received");
    if ( map["error"] != null )
      throw new Exception("Error during token request: " + map["error"] + ": " + map["error_description"]);

    Token model = new Token();
    model.accessToken = map["access_token"];
    model.tokenType = map["token_type"];
    model.expiresIn = map["expires_in"];
    model.expiresOn = map["expires_on"];
    model.issueTimeStamp = new DateTime.now();
    model.expireTimeStamp = model.issueTimeStamp.add(new Duration(seconds:  int.parse(model.expiresIn)-model.expireOffSet));
    return model;
  }

  static bool isExpired(Token token) {
    //print(token.expireTimeStamp);
    return token.expireTimeStamp.isBefore(new DateTime.now());
  }

  static bool tokenIsValid(Token token) {
    return token != null && !Token.isExpired(token) && token.accessToken != null;
  }
}