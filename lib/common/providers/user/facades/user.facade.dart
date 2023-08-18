import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_flutter/common/interfaces/api-response/api-response.interface.dart';
import 'package:todo_flutter/common/models/user/user.model.dart';
import 'package:todo_flutter/common/providers/user/services/user-api.service.dart';

import '../../../interfaces/auth/auth.interface.dart';

enum LoginState {
  initial,
  loading,
  success,
  error,
}

class UserFacade extends ChangeNotifier {
  final UserApiService _userApiService;

  LoginState _loginState = LoginState.initial;
  LoginState get loginState => _loginState;

  User? _user;
  User? get user => _user;

  UserFacade(this._userApiService);

  Future<void> login(AuthLoginPayload payload) async {
    _loginState = LoginState.loading;
    notifyListeners();

    try {
      AuthResponseWithToken response = await _userApiService.login(payload);
      User? user = response.data[MODELS.user];
      _loginState = LoginState.success;
      _user = user;
      print('USSERERRFACEFAE $user');
    } catch (e) {
      _loginState = LoginState.error;
      _user = null;
    }
    notifyListeners();
  }
}
