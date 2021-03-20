import 'package:flutter/material.dart';
import 'package:frontend/app/shared/models/user_model.dart';
import 'package:frontend/app/shared/repositories/api_repository.dart';
import 'package:provider/provider.dart';

import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends StatelessWidget {
  const HomeModule({Key key, this.user}) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => HomeController(
            user,
            context.read<ApiRepository>(),
          ),
        )
      ],
      child: HomePage(),
    );
  }
}
