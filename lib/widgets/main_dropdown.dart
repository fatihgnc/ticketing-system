import 'package:flutter/material.dart';

class MainDropdown extends StatefulWidget {
  final Function setDropdownValue;
  final String dropdownValue;

  MainDropdown(this.setDropdownValue, this.dropdownValue);

  @override
  _MainDropdownState createState() => _MainDropdownState();
}

class _MainDropdownState extends State<MainDropdown> {
  final List<DropdownMenuItem<String>> _dropdownItems = [
    DropdownMenuItem(
      child: Text('Pending Requests'),
      value: 'pending',
    ),
    DropdownMenuItem(
      child: Text('Resolved Requests'),
      value: 'resolved',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton(
          value: widget.dropdownValue,
          items: _dropdownItems,
          dropdownColor: Colors.black,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          underline: Container(
            height: 0,
          ),
          onChanged: (newVal) => widget.setDropdownValue(newVal),
        ),
      ],
    );
  }
}
