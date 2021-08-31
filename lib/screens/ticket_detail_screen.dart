import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/models/ticket.dart';
import 'package:ticketing_system/providers/ticket_provider.dart';
import 'package:ticketing_system/screens/main_screen.dart';
import 'package:ticketing_system/widgets/tickets.dart';

class TicketDetailScreen extends StatelessWidget {
  static const routeName = '/ticket-detail';

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    // ignore: unnecessary_statements
    final ticket = ModalRoute.of(context)!.settings.arguments as Ticket;
    return Scaffold(
      appBar: AppBar(
        title: Text(ticket.senderPhone),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Delete ticket'),
                  content: const Text('Are you sure?'),
                  actions: [
                    TextButton(
                      child: const Text('NO'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('YES'),
                      onPressed: () {
                        Provider.of<TicketProvider>(
                          context,
                          listen: false,
                        ).deleteTicketById(ticket.id);
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: deviceHeight * 0.325,
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    ticket.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    ticket.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.1),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8),
                      child: const Text(
                        'Technician',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.4),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Technician Appointed',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Text(
                      'Technician ID: 1',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
