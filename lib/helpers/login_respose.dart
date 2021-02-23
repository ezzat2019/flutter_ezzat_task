class LoginRespose {
  String _status;
  String _message;
  dynamic _errors;
  Data _data;

  String get status => _status;
  String get message => _message;
  dynamic get errors => _errors;
  Data get data => _data;

  LoginRespose({
      String status, 
      String message, 
      dynamic errors, 
      Data data}){
    _status = status;
    _message = message;
    _errors = errors;
    _data = data;
}

  LoginRespose.fromJson(dynamic json) {
    _status = json["status"];
    _message = json["message"];
    _errors = json["errors"];
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["message"] = _message;
    map["errors"] = _errors;
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    return map;
  }

}

class Data {
  String _token;
  String _expiration;

  String get token => _token;
  String get expiration => _expiration;

  Data({
      String token, 
      String expiration}){
    _token = token;
    _expiration = expiration;
}

  Data.fromJson(dynamic json) {
    _token = json["token"];
    _expiration = json["expiration"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["token"] = _token;
    map["expiration"] = _expiration;
    return map;
  }

}