import 'package:flutter/material.dart';
import 'package:ticketing_system/widgets/login_or_register.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginOrRegister();
  }
}
