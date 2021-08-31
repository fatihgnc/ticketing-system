import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/models/ticket.dart';
import 'package:ticketing_system/providers/ticket_provider.dart';

class TicketItem extends StatefulWidget {
  final Ticket ticket;

  TicketItem(this.ticket);

  @override
  _TicketItemState createState() => _TicketItemState();
}

class _TicketItemState extends State<TicketItem> {
  String _ticketPriorityLevel(TicketPriority priority) {
    if (priority == TicketPriority.Dusuk) {
      return 'Düşük';
    } else if (priority == TicketPriority.Orta) {
      return 'Orta';
    } else {
      return 'Yüksek';
    }
  }

  String _ticketStatus(TicketStatus? status) {
    if (status == TicketStatus.Beklemede) {
      return 'Tekniker Atandı';
    }
    return 'Çözüldü';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.ticket.status != TicketStatus.Halledildi)
          Checkbox(
            checkColor: Colors.blue,
            value: widget.ticket.isSelected,
            onChanged: (_) {
              setState(() {
                widget.ticket.isSelected = !widget.ticket.isSelected;
              });
            },
          ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            height: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  top: 15,
                  child: Text(
                    widget.ticket.id,
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
                    widget.ticket.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 90,
                  child: Text(
                    widget.ticket.senderFullName +
                        ' - ' +
                        _ticketPriorityLevel(
                          widget.ticket.priority!,
                        ) +
                        ' - ' +
                        _ticketStatus(
                          widget.ticket.status!,
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
                    DateFormat.yMd().add_Hms().format(widget.ticket.date),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 10,
                  child: widget.ticket.priority == TicketPriority.Dusuk
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
      ],
    );
  }
}
