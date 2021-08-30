import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  static const routeName = '/contact';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: Center(
        child: const Text('Contact Page'),
      ),
    );
  }
}
