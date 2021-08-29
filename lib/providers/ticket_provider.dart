import 'package:flutter/cupertino.dart';
import 'package:ticketing_system/models/ticket.dart';

class TicketProvider with ChangeNotifier {
  List<Ticket> _tickets = [
    Ticket(
      ticketID: '1',
      ticketTitle: 'FİYAT İSTEK',
      ticketSender: 'Mehmet İlkbahar',
      ticketPriority: TicketPriority.Yuksek,
      ticketStatus: TicketStatus.Beklemede,
    ),
    Ticket(
      ticketID: '2',
      ticketTitle: 'FİYAT İSTEK2',
      ticketSender: 'Hasan İlkbahar',
      ticketPriority: TicketPriority.Normal,
      ticketStatus: TicketStatus.Beklemede,
    ),
    Ticket(
      ticketID: '3',
      ticketTitle: 'FİYAT İSTEK3',
      ticketSender: 'MMM İlkbahar',
      ticketPriority: TicketPriority.Dusuk,
      ticketStatus: TicketStatus.Beklemede,
    ),
  ];

  List<Ticket> get tickets {
    return [..._tickets];
  }
}
