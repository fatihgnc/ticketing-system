import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:ticketing_system/models/user.dart';

class UserProvider with ChangeNotifier {
  bool isAuth = false;
  User? _authenticatedUser;

  List<User> _users = [
    User(
      fullName: 'Fatih Genç',
      phone: '05338329901',
      email: 'email@test.com',
      companyName: 'companyname',
      address: 'myaddress',
      city: 'mycity',
      region: 'myregion',
      branchName: 'mybranch',
      username: 'myusername',
      password: 'password',
    ),
  ];

  List<User> get users {
    return [..._users];
  }

  User get user {
    return _authenticatedUser as User;
  }

  void loginUser(
    String username,
    String password,
  ) async {
    if (!_users.any(
      (user) => user.username == username && user.password == password,
    )) {
      return;
    }
    final user = _users.firstWhere(
      (user) => user.username == username && user.password == password,
    );
    isAuth = true;
    _authenticatedUser = user;
    inspect(_authenticatedUser);
    notifyListeners();
  }

  void logoutUser() async {
    isAuth = false;
    _authenticatedUser = null;
    notifyListeners();
  }

  void registerUser(User user) async {
    _users.add(user);
    notifyListeners();
  }
}
