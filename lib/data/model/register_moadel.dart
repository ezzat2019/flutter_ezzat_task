

class RegisterMoadel {
  String _username;
  String _email;
  String _password;

  String get username => _username;
  String get email => _email;
  String get password => _password;

  RegisterMoadel({
      String username, 
      String email, 
      String password}){
    _username = username;
    _email = email;
    _password = password;
}

  RegisterMoadel.fromJson(dynamic json) {
    _username = json["username"];
    _email = json["email"];
    _password = json["password"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["username"] = _username;
    map["email"] = _email;
    map["password"] = _password;
    return map;
  }

}