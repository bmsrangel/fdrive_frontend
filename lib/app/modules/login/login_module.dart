import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:frontend/app/modules/login/login_controller.dart';
import 'package:frontend/app/shared/repositories/api_repository.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';

class LoginModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => LoginController(context.read<ApiRepository>()),
        )
      ],
      child: LoginPage(),
    );
  }
}
