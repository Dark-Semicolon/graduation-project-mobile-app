class PatchUseData {
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;

  PatchUseData({this.name, this.email, this.password, this.passwordConfirmation});

  PatchUseData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    passwordConfirmation = json['passwordConfirmation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['passwordConfirmation'] = passwordConfirmation;
    return data;
  }
}
