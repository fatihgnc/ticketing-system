enum TicketStatus {
  IptalEdildi,
  Beklemede,
  Halledildi,
}

enum TicketPriority {
  Yuksek,
  Normal,
  Dusuk,
}

class Ticket {
  final String ticketID;
  final String ticketTitle;
  final String ticketSender;
  final TicketPriority ticketPriority;
  final TicketStatus ticketStatus;
  final DateTime ticketDate = DateTime.now();

  Ticket({
    required this.ticketID,
    required this.ticketTitle,
    required this.ticketSender,
    required this.ticketPriority,
    required this.ticketStatus,
  });
}
