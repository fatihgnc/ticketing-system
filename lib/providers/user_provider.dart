import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:ticketing_system/models/user.dart';

class UserProvider with ChangeNotifier {
  bool isAuth = false;
  User? _authenticatedUser;

  List<User> _users = [
    User(
      fullName: 'Hasan İlkbahar',
      phone: '+905338801122',
      email: 'email@test.com',
      companyName: 'Gigabyte Ltd.',
      address: 'Küçük Kaymaklı',
      city: 'Lefkoşa',
      region: 'Kaymaklı',
      branchName: 'Software',
      username: 'hasanilkbahar',
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
    notifyListeners();
    inspect(_authenticatedUser);
    inspect(_users);
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
