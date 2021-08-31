import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/models/server.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void _saveLink() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final serverProv = Provider.of<Server>(context, listen: false);

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
                initialValue: serverProv.serverLink,
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
                    serverProv.setServerLink(inputVal as String);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Settings saved!'),
                      backgroundColor: Colors.green,
                      duration: Duration(
                        seconds: 1,
                      ),
                    ),
                  );
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
