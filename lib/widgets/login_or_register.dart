import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({Key? key}) : super(key: key);

  @override
  _LoginOrRegisterState createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool _isLogin = false;
  final _formKey = GlobalKey<FormState>();

  void _loginUser() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();
    FocusManager.instance.primaryFocus!.unfocus();
  }

  void _saveUser() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();
    FocusManager.instance.primaryFocus!.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: _isLogin ? const Text('Register') : const Text('Log in'),
        actions: [
          TextButton(
            child: _isLogin ? const Text('Log in') : const Text('Register'),
            onPressed: () {
              setState(() {
                _isLogin = !_isLogin;
              });
            },
          ),
        ],
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
        height: deviceHeight * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _isLogin ? 'REGISTER' : 'LOGIN',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 2.5,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // USERNAME
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Username',
                    ),
                    validator: (inputVal) {
                      if (inputVal == null || inputVal.isEmpty) {
                        return 'This field is required';
                      }

                      if (inputVal.length < 4 || inputVal.length > 18) {
                        return 'Invalid input!';
                      }
                    },
                  ),
                  if (_isLogin)
                    // NAME
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.text_format),
                        hintText: 'Name',
                      ),
                      validator: (inputVal) {
                        if (inputVal == null || inputVal.isEmpty) {
                          return 'This field is required';
                        }

                        if (inputVal.length < 2) {
                          return 'Invalid input!';
                        }
                      },
                    ),
                  if (_isLogin)
                    // EMAIL
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.email),
                        hintText: 'Email ID',
                      ),
                      validator: (inputVal) {
                        if (inputVal == null || inputVal.isEmpty) {
                          return 'This field is required';
                        }

                        if (inputVal.length < 7 || !inputVal.contains('@')) {
                          return 'Invalid input!';
                        }
                      },
                    ),
                  // PASSWORD
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.password),
                      hintText: 'Password',
                    ),
                    obscureText: true,
                    validator: (inputVal) {
                      if (inputVal == null || inputVal.isEmpty) {
                        return 'This field is required';
                      }

                      if (inputVal.length < 4 || inputVal.length > 21) {
                        return 'Invalid input!';
                      }
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
                    onPressed: _isLogin ? _loginUser : _saveUser,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
    ;
  }
}
