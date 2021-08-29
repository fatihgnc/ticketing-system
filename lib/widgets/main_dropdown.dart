import 'package:flutter/material.dart';

class MainDropdown extends StatefulWidget {
  const MainDropdown({Key? key}) : super(key: key);

  @override
  _MainDropdownState createState() => _MainDropdownState();
}

class _MainDropdownState extends State<MainDropdown> {
  String _dropdownValue = 'pending';
  final List<DropdownMenuItem<String>> _dropdownItems = [
    DropdownMenuItem(
      child: Text('Pending Requests'),
      value: 'pending',
    ),
    DropdownMenuItem(
      child: Text('Resolved Requests'),
      value: 'resolved',
    ),
    DropdownMenuItem(
      child: Text('Canceled Requests'),
      value: 'canceled',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton(
          value: _dropdownValue,
          items: _dropdownItems,
          dropdownColor: Colors.black,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          underline: Container(
            height: 0,
          ),
          onChanged: (changeVal) {
            setState(() {
              _dropdownValue = changeVal as String;
            });
          },
        ),
      ],
    );
  }
}
