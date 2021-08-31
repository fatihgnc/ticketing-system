import 'package:flutter/material.dart';
import 'package:ticketing_system/models/ticket.dart';

class TicketDetailScreen extends StatelessWidget {
  static const routeName = '/ticket-detail';

  // final ticket;

  // const TicketDetailScreen(this.ticket);

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_statements
    final ticket = ModalRoute.of(context)!.settings.arguments as Ticket;
    return Scaffold(
      appBar: AppBar(
        title: Text(ticket.id),
      ),
      body: Text(ticket.description),
    );
  }
}
