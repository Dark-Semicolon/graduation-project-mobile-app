// login_request_model.dart
class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

// login_response_model.dart
class LoginResponse {
  final String token;
  final String userName; // You can include other user-related information in the response

  LoginResponse({required this.token, required this.userName});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'],
      userName: json['userName'],
    );
  }
}
