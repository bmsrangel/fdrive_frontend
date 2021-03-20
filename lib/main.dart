import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:frontend/app/modules/login/login_module.dart';
import 'package:provider/provider.dart';

import 'app/shared/repositories/api_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Dio>(
          create: (context) => Dio(BaseOptions(
            baseUrl: 'http://192.168.1.150:3000',
          )),
        ),
        Provider<ApiRepository>(
          create: (context) => ApiRepository(context.read<Dio>()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginModule(),
      ),
    );
  }
}
