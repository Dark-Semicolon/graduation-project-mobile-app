class AuthDataModel {
  String? email;
  String? password;
  String? deviceName;

  AuthDataModel({this.email, this.password, this.deviceName});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'email': email,
      'password': password,
      'device_name': deviceName,
    };
    return data;
  }
}
