import 'package:flutter/cupertino.dart';
import 'package:ticketing_system/models/ticket.dart';

class TicketProvider with ChangeNotifier {
  List<Ticket> _tickets = [
    Ticket(
      ticketTitle: 'FİYAT İSTEK',
      ticketSender: 'Mehmet İlkbahar',
      ticketSenderPhone: '#1',
      ticketDescription: 'Fiyat isteniyor!',
      ticketPriority: TicketPriority.Yuksek,
      ticketStatus: TicketStatus.Beklemede,
    ),
    Ticket(
      ticketTitle: 'FİYAT İSTEK2',
      ticketDescription: 'Fiyat isteniyor!2',
      ticketSender: 'Hasan İlkbahar',
      ticketSenderPhone: '#2',
      ticketPriority: TicketPriority.Normal,
      ticketStatus: TicketStatus.Beklemede,
    ),
    Ticket(
      ticketTitle: 'FİYAT İSTEK3',
      ticketDescription: 'Fiyat isteniyor!3',
      ticketSender: 'MMM İlkbahar',
      ticketSenderPhone: '#3',
      ticketPriority: TicketPriority.Dusuk,
      ticketStatus: TicketStatus.Beklemede,
    ),
  ];

  List<Ticket> get tickets {
    return [..._tickets];
  }

  void addTicket(Ticket newTicket) {
    _tickets.add(newTicket);
    notifyListeners();
  }
}
