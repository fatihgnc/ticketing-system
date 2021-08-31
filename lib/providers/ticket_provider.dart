import 'package:flutter/cupertino.dart';
import 'package:ticketing_system/models/ticket.dart';

class TicketProvider with ChangeNotifier {
  List<Ticket> _tickets = [
    Ticket(
      title: 'FİYAT İSTEK',
      sender: 'Mehmet İlkbahar',
      senderPhone: '#1',
      description: 'Fiyat isteniyor!',
      priority: TicketPriority.Yuksek,
      status: TicketStatus.Beklemede,
      isSelected: false,
    ),
    Ticket(
      title: 'FİYAT İSTEK2',
      description: 'Fiyat isteniyor!2',
      sender: 'Hasan İlkbahar',
      senderPhone: '#2',
      priority: TicketPriority.Orta,
      status: TicketStatus.Halledildi,
      isSelected: false,
    ),
    Ticket(
      title: 'FİYAT İSTEK3',
      description: 'Fiyat isteniyor!3',
      sender: 'MMM İlkbahar',
      senderPhone: '#3',
      priority: TicketPriority.Dusuk,
      status: TicketStatus.Halledildi,
      isSelected: false,
    ),
  ];

  List<Ticket> get tickets {
    return [..._tickets];
  }

  void addTicket(Ticket newTicket) {
    _tickets.add(newTicket);
    notifyListeners();
  }

  List<Ticket> findByStatus(String statusStr) {
    TicketStatus status;
    if (statusStr == 'resolved') {
      status = TicketStatus.Halledildi;
    } else {
      status = TicketStatus.Beklemede;
    }
    return _tickets
        .where(
          (ticket) => ticket.status == status,
        )
        .toList();
  }
}
