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
  final String ticketID = DateTime.now().toString();
  final String ticketTitle;
  final String? ticketDescription;
  final String ticketSender;
  final String ticketSenderPhone;
  final TicketPriority? ticketPriority;
  final TicketStatus? ticketStatus;
  final DateTime ticketDate = DateTime.now();

  Ticket({
    required this.ticketTitle,
    required this.ticketDescription,
    required this.ticketSender,
    required this.ticketSenderPhone,
    required this.ticketPriority,
    required this.ticketStatus,
  });
}
