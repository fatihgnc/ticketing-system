import 'package:flutter/material.dart';

import './drawer_item.dart';

class MainDrawer extends StatelessWidget {
  void _selectFn() {}

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
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
                        'Gigabyteltd',
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
                        'servis@gigabyteltd.com',
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
                    tileIcon: Icons.ac_unit,
                    tileText: 'Requests',
                    selectFn: _selectFn,
                  ),
                  DrawerItem(
                    tileIcon: Icons.bookmark_add,
                    tileText: 'Add Request',
                    selectFn: _selectFn,
                  ),
                  Divider(
                    height: 5,
                  ),
                  DrawerItem(
                    tileIcon: Icons.settings,
                    tileText: 'Settings',
                    selectFn: _selectFn,
                  ),
                  DrawerItem(
                    tileIcon: Icons.contacts,
                    tileText: 'Contacts',
                    selectFn: _selectFn,
                  ),
                  DrawerItem(
                    tileIcon: Icons.logout,
                    tileText: 'Log out',
                    selectFn: _selectFn,
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
