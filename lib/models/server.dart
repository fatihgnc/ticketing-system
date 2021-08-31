import 'package:flutter/cupertino.dart';

class Server with ChangeNotifier {
  String _serverLink = '';

  String get serverLink {
    return _serverLink;
  }

  void setServerLink(String newLink) {
    _serverLink = newLink;
    notifyListeners();
  }
}
