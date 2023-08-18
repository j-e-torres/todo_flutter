import '../../models/user/user.model.dart';
import '../api-response/api-response.interface.dart';

class AuthToken {
  final String accessToken;
  final String tokenType;

  AuthToken({required this.accessToken, required this.tokenType});
}

class AuthLoginPayload {
  final String username;
  final String password;

  AuthLoginPayload({
    required this.username,
    required this.password,
  });
}

class AuthResponseWithToken extends ApiResponse<User> {
  final AuthToken token;

  AuthResponseWithToken({
    required this.token,
    required super.status,
    required super.data,
    // You might need to pass other parameters to the constructor as well
  });

  factory AuthResponseWithToken.fromJson(Map<String, dynamic> json) {
    return AuthResponseWithToken(
      data: json['data'],
      status: json['status'],
      token: json['token'],
    );
  }
}

class AuthSignupPayload extends AuthLoginPayload {
  final String displayName;

  AuthSignupPayload({
    required String username,
    required String password,
    required this.displayName,
  }) : super(username: username, password: password);
}

typedef Token = String;
