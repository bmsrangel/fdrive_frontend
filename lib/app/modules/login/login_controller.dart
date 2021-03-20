import 'package:flutter/widgets.dart';
import 'package:frontend/app/shared/models/user_model.dart';
import 'package:frontend/app/shared/repositories/api_repository.dart';

class LoginController {
  LoginController(this._api);

  final ApiRepository _api;
  final TextEditingController email$ = TextEditingController();
  final TextEditingController password$ = TextEditingController();

  Future<UserModel> login() async {
    final UserModel user = await _api.login(email$.text, password$.text);
    return user;
  }
}
