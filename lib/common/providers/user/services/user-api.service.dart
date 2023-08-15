import 'package:todo_flutter/common/interfaces/api-response/api-response.interface.dart';
import 'package:todo_flutter/common/interfaces/auth/auth.interface.dart';

import '../../../models/user/user.model.dart';

class UserApiService {
  Future<AuthResponseWithToken> login(AuthLoginPayload credentials) async {
    // Here you would perform the actual login logic using the provided username and password
    // You can make API requests, handle responses, etc.
    // For demonstration purposes, let's just print a message
    print('Logged in user: $credentials');
    return Future.delayed(const Duration(seconds: 3), () {
      final AuthResponseWithToken res = AuthResponseWithToken(
        token: AuthToken(accessToken: 'eee', tokenType: 'token'),
        status: 200,
        data: {
          MODELS.user: User(
            id: 'eee',
            role: Role.user,
            username: 'he',
            displayName: 'he-man',
          ),
        },
      );
      print('REALLLLLLY REAL $res');
      return res;
    });
  }
}
