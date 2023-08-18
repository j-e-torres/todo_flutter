import 'dart:convert';

import 'package:todo_flutter/common/interfaces/api-response/api-response.interface.dart';
import 'package:todo_flutter/common/interfaces/auth/auth.interface.dart';
import 'package:http/http.dart' as http;

import '../../../models/user/user.model.dart';
import '../../../../environments/dev.config.dart';

class UserApiService {
  late String _apiBaseUrl;
  late String _apiUrl;
  UserApiService()
      : _apiBaseUrl = DevConfig.getApiUrl(),
        _apiUrl = '${DevConfig.getApiUrl()}/auth';

  Future<AuthResponseWithToken> login(AuthLoginPayload credentials) async {
    print('LOGINAUTHRESURL $_apiUrl');

    try {
      final response = await http.post(
        Uri.parse('$_apiUrl/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            'username': credentials.username,
            'password': credentials.password,
          },
        ),
      );

      final weee = response.statusCode;
      print('WEEEEEE $weee');
      if (response.statusCode == 200) {
        final eee = AuthResponseWithToken.fromJson(jsonDecode(response.body));
        return eee;
      } else {
        throw Exception('Failed to login user/');
      }
    } catch (e) {
      print('ERRRROR, $e');
      throw Exception('Failed to login user/');
    }
    // throw Exception('Failed to login user/');

    //  else {
    // }
  }

//   Future<Album> fetchAlbum() async {
//   final response = await http
//       .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Album.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }
}


// Here you would perform the actual login logic using the provided username and password
    // You can make API requests, handle responses, etc.
    // For demonstration purposes, let's just print a message
    // print('Logged in user: $credentials');
    // return Future.delayed(const Duration(seconds: 3), () {
    //   final AuthResponseWithToken res = AuthResponseWithToken(
    //     token: AuthToken(accessToken: 'eee', tokenType: 'token'),
    //     status: 200,
    //     data: {
    //       MODELS.user: User(
    //         id: 'eee',
    //         role: Role.user,
    //         username: 'he',
    //         displayName: 'he-man',
    //       ),
    //     },
    //   );
    //   print('REALLLLLLY REAL $res');
    //   return res;
    // });