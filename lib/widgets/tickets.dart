import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/models/ticket.dart';
import 'package:ticketing_system/providers/ticket_provider.dart';
import 'package:ticketing_system/screens/ticket_detail_screen.dart';
import 'package:ticketing_system/widgets/ticket_item.dart';

class Tickets extends StatefulWidget {
  final dropdownValue;

  Tickets(this.dropdownValue);

  @override
  _TicketsState createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  @override
  Widget build(BuildContext context) {
    final tickets = Provider.of<TicketProvider>(context, listen: false)
        .findByStatus(widget.dropdownValue);
    // inspect(tickets);
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.3),
      ),
      child: ListView.builder(
        itemBuilder: (ctx, i) => Container(
          margin: const EdgeInsets.only(bottom: 6),
          height: 150,
          width: double.infinity,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                TicketDetailScreen.routeName,
                arguments: tickets[i],
              );
            },
            child: TicketItem(
              widget.dropdownValue,
              tickets[i],
            ),
          ),
        ),
        itemCount: tickets.length,
      ),
    );
  }
}
