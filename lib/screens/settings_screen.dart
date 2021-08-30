import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _serverLink = '';

  void _saveLink() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();
    print('valid!');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_serverLink),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                initialValue: _serverLink,
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: 'Server Link',
                ),
                validator: (inputVal) {
                  if (inputVal!.trim().isEmpty) {
                    return 'This field is required!';
                  }

                  if (!inputVal.trim().contains('/') ||
                      inputVal.trim().length < 10) {
                    return 'Invalid input!';
                  }

                  return null;
                },
                onSaved: (inputVal) {
                  setState(() {
                    _serverLink = inputVal!.trim().toLowerCase();
                  });
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: _saveLink,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
