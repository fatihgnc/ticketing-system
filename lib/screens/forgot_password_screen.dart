import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = '/forgot-password';

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Send request'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
