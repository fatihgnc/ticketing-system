import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticketing_system/providers/user_provider.dart';
import 'package:ticketing_system/screens/forgot_password_screen.dart';
import 'package:ticketing_system/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  void _loginUser(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();
    FocusManager.instance.primaryFocus!.unfocus();

    Provider.of<UserProvider>(
      context,
      listen: false,
    ).loginUser(
      _usernameController.text,
      _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 20,
            ),
          ],
        ),
        margin: const EdgeInsets.only(
          top: 30,
          left: 20,
          right: 20,
        ),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: deviceHeight * 0.75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'LOGIN',
              style: Theme.of(context).textTheme.headline4,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // USERNAME
                  TextFormField(
                    key: ValueKey('username'),
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      labelText: 'Username',
                    ),
                    validator: (inputVal) {
                      if (inputVal == null || inputVal.isEmpty) {
                        return 'This field is required!';
                      }

                      if (inputVal.length < 4 || inputVal.length > 25) {
                        return 'Invalid input!';
                      }
                    },
                  ),
                  // PASSWORD
                  TextFormField(
                    key: ValueKey('password'),
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.password),
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    validator: (inputVal) {
                      if (inputVal == null || inputVal.isEmpty) {
                        return 'This field is required!';
                      }

                      if (inputVal.length < 8 || inputVal.length > 40) {
                        return 'Invalid input!';
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(RegisterScreen.routeName);
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(ForgotPasswordScreen.routeName);
                    },
                    child: const Text(
                      'Forgot password?',
                    ),
                  ),
                  CheckboxListTile(
                    value: _rememberMe,
                    title: const Text('Remember me'),
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Colors.blue,
                    onChanged: (val) {
                      setState(() {
                        _rememberMe = val!;
                      });
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  child: IconButton(
                    icon: const Icon(Icons.login),
                    onPressed: () => _loginUser(context),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
