import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_flutter/common/interfaces/api-response/api-response.interface.dart';
import 'package:todo_flutter/common/models/user/user.model.dart';
import 'package:todo_flutter/common/providers/user/services/user-api.service.dart';

import '../../../interfaces/auth/auth.interface.dart';

enum LoadingState {
  initial,
  loading,
  success,
  error,
}

class UserFacade extends ChangeNotifier {
  final UserApiService _userApiService;

  LoadingState _loadingState = LoadingState.initial;
  LoadingState get loadingState => _loadingState;

  User? _user;
  User? get user => _user;

  UserFacade(this._userApiService);

  Future<void> login(AuthLoginPayload payload) async {
    _loadingState = LoadingState.initial;
    notifyListeners();

    try {
      AuthResponseWithToken response = await _userApiService.login(payload);
      User? user = response.data[MODELS.user];
      _loadingState = LoadingState.success;
      _user = user;
    } catch (e) {
      _loadingState = LoadingState.error;
      _user = null;
    }
    notifyListeners();
  }
}
