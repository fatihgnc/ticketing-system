import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:ticketing_system/models/ticket.dart';

class TicketProvider with ChangeNotifier {
  List<Ticket> _tickets = [
    Ticket(
      title: 'Test Ticket - 1',
      senderFullName: 'Mehmet İlkbahar',
      senderPhone: '+905338765432',
      description: 'Ticket description for testing purposes!',
      priority: TicketPriority.Yuksek,
      status: TicketStatus.Beklemede,
      request: TicketRequest.Job,
      isSelected: false,
    ),
    Ticket(
      title: 'Test Ticket - 2',
      description: 'RTX 3090 ekran kartlı bir bilgisayar istiyorum!',
      senderFullName: 'Hasan İlkbahar',
      senderPhone: '+905488765432',
      priority: TicketPriority.Orta,
      status: TicketStatus.Halledildi,
      request: TicketRequest.Job,
      isSelected: false,
    ),
    Ticket(
      title: 'Test Ticket - 3',
      description: 'Kafem için bir yazılım istiyorum!',
      senderFullName: 'Fatih Genç',
      senderPhone: '+905338329901',
      priority: TicketPriority.Dusuk,
      status: TicketStatus.Halledildi,
      request: TicketRequest.Demo,
      isSelected: false,
    ),
  ];

  List<Ticket> get tickets {
    return [..._tickets];
  }

  void addTicket(Ticket newTicket) {
    _tickets.add(newTicket);
    inspect(_tickets);
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

  void deleteTicketById(String id) {
    _tickets.removeWhere((ticket) => ticket.id == id);
    notifyListeners();
  }
}
