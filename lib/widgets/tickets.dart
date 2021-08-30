import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/models/ticket.dart';
import 'package:ticketing_system/providers/ticket_provider.dart';

class Tickets extends StatefulWidget {
  @override
  _TicketsState createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  bool _isSelected = false;

  String _ticketPriorityLevel(TicketPriority priority) {
    if (priority == TicketPriority.Dusuk) {
      return 'Düşük';
    } else if (priority == TicketPriority.Normal) {
      return 'Normal';
    } else {
      return 'Yüksek';
    }
  }

  String _ticketStatus(TicketStatus status) {
    if (status == TicketStatus.Beklemede) {
      return 'Tekniker Atandı';
    } else if (status == TicketStatus.Halledildi) {
      return 'Çözüldü';
    } else {
      return 'İptal edildi';
    }
  }

  @override
  Widget build(BuildContext context) {
    final tickets = Provider.of<TicketProvider>(context, listen: false).tickets;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.3),
      ),
      child: ListView.builder(
        itemBuilder: (ctx, i) => Container(
          margin: const EdgeInsets.only(bottom: 6),
          height: 120,
          width: double.infinity,
          child: Row(
            children: [
              Checkbox(
                value: _isSelected,
                onChanged: (_) {
                  setState(() {
                    _isSelected = !_isSelected;
                  });
                },
              ),
              Expanded(
                child: Container(
                  height: double.infinity,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 15,
                        child: Text(
                          tickets[i].ticketSenderPhone,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        child: Text(
                          tickets[i].ticketTitle,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 90,
                        child: Text(
                          tickets[i].ticketSender +
                              ' - ' +
                              _ticketPriorityLevel(
                                tickets[i].ticketPriority!,
                              ) +
                              ' - ' +
                              _ticketStatus(
                                tickets[i].ticketStatus!,
                              ),
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 10,
                        child: Text(
                          DateFormat.yMd()
                              .add_Hms()
                              .format(tickets[i].ticketDate),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        right: 10,
                        child: tickets[i].ticketPriority == TicketPriority.Dusuk
                            ? Icon(
                                Icons.access_time,
                                color: Colors.red,
                                size: 30,
                              )
                            : Icon(
                                Icons.task_alt,
                                color: Colors.green,
                                size: 30,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider()
            ],
          ),
        ),
        itemCount: tickets.length,
      ),
    );
  }
}
