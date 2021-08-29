import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData tileIcon;
  final String tileText;
  final VoidCallback selectFn;

  DrawerItem({
    required this.tileIcon,
    required this.tileText,
    required this.selectFn,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Icon(
            tileIcon,
            color: Colors.grey,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: TextButton(
              onPressed: selectFn,
              child: Text(
                tileText,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
              style: TextButton.styleFrom(
                alignment: Alignment.centerLeft,
              ),
            ),
          ),
        ],
      ),
      // tileColor: Colors.purple,
    );
  }
}
