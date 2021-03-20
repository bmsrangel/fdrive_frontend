import 'package:flutter/material.dart';
import 'package:frontend/app/modules/home/home_module.dart';
import 'package:frontend/app/modules/login/login_controller.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController controller;

  @override
  void initState() {
    controller = context.read<LoginController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: controller.email$,
              decoration: InputDecoration(
                labelText: 'E-mail',
              ),
            ),
            TextField(
              controller: controller.password$,
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
            ),
            const SizedBox(height: 20.0),
            TextButton(
              child: Text('Entrar'),
              onPressed: () async {
                final user = await controller.login();
                if (user != null) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeModule(
                          user: user,
                        ),
                      ));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
