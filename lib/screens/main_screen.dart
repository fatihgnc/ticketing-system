import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/models/ticket.dart';
import 'package:ticketing_system/providers/ticket_provider.dart';
import 'package:ticketing_system/screens/add_ticket_screen.dart';
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
  String _dropdownValue = 'pending';

  void _setDropdown(String newVal) {
    setState(() {
      _dropdownValue = newVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MainDropdown(_setDropdown, _dropdownValue),
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
      body: Tickets(_dropdownValue),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).accentColor,
        onPressed: () {
          Navigator.of(context).pushNamed(AddRequestScreen.routeName);
        },
      ),
    );
  }
}
