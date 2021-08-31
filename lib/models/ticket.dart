enum TicketStatus {
  Beklemede,
  Halledildi,
}

enum TicketPriority {
  Yuksek,
  Orta,
  Dusuk,
}

class Ticket {
  final String id = DateTime.now().toString();
  final String title;
  final String description;
  final String sender;
  final String senderPhone;
  final TicketPriority? priority;
  TicketStatus? status = TicketStatus.Beklemede;
  final DateTime date = DateTime.now();
  bool isSelected = false;

  Ticket({
    required this.title,
    required this.description,
    required this.sender,
    required this.senderPhone,
    required this.priority,
    required this.isSelected,
    this.status,
  });
}
