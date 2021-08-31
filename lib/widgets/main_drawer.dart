import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/models/user.dart';
import 'package:ticketing_system/providers/user_provider.dart';
import 'package:ticketing_system/screens/add_ticket_screen.dart';
import 'package:ticketing_system/screens/contact_screen.dart';
import 'package:ticketing_system/screens/main_screen.dart';
import 'package:ticketing_system/screens/settings_screen.dart';
import 'package:ticketing_system/widgets/tickets.dart';

import './drawer_item.dart';

class MainDrawer extends StatelessWidget {
  void _selectFn(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final userInfo = Provider.of<UserProvider>(context, listen: false).user;

    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 10,
            ),
            width: double.infinity,
            height: deviceHeight * 0.27,
            decoration: BoxDecoration(
              color: Colors.black87.withOpacity(.8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.black38,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        userInfo.username,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        userInfo.email,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.2),
              ),
              child: ListView(
                children: [
                  DrawerItem(
                    tileIcon: Icons.text_snippet,
                    tileText: 'Requests',
                    selectFn: () => _selectFn(
                      context,
                      MainScreen.routeName,
                    ),
                  ),
                  DrawerItem(
                    tileIcon: Icons.add_task,
                    tileText: 'Add Request',
                    selectFn: () => _selectFn(
                      context,
                      AddRequestScreen.routeName,
                    ),
                  ),
                  Divider(
                    height: 5,
                  ),
                  DrawerItem(
                    tileIcon: Icons.settings,
                    tileText: 'Settings',
                    selectFn: () => _selectFn(
                      context,
                      SettingsScreen.routeName,
                    ),
                  ),
                  DrawerItem(
                    tileIcon: Icons.contacts,
                    tileText: 'Contact',
                    selectFn: () => _selectFn(
                      context,
                      ContactScreen.routeName,
                    ),
                  ),
                  DrawerItem(
                    tileIcon: Icons.logout,
                    tileText: 'Log out',
                    selectFn: () {
                      Provider.of<UserProvider>(
                        context,
                        listen: false,
                      ).logoutUser();
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
