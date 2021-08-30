import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ticketing_system/screens/add_request_screen.dart';
import 'package:ticketing_system/widgets/drawer_item.dart';
import 'package:ticketing_system/widgets/main_drawer.dart';
import 'package:ticketing_system/widgets/main_dropdown.dart';
import 'package:ticketing_system/widgets/tickets.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MainDropdown(),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Tickets(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddRequestScreen.routeName);
        },
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).accentColor,
      ),
    );
  }
}
