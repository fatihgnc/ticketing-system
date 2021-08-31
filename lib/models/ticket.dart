enum TicketStatus {
  Beklemede,
  Halledildi,
}

enum TicketPriority {
  Yuksek,
  Orta,
  Dusuk,
}

enum TicketRequest {
  Price,
  Job,
  Project,
  Demo,
}

class Ticket {
  final String id = DateTime.now().millisecondsSinceEpoch.toString();
  final String title;
  final String description;
  final String senderFullName;
  final String senderPhone;
  final String? senderEmail;
  final String? senderCompanyName;
  final String? senderCompanyAddress;
  final String? senderBranchName;
  final String? senderCity;
  final String? senderRegion;
  final TicketRequest request;
  final TicketPriority? priority;
  final DateTime date = DateTime.now();
  TicketStatus? status;
  bool isSelected = false;

  Ticket({
    required this.title,
    required this.description,
    required this.senderFullName,
    required this.senderPhone,
    required this.priority,
    required this.isSelected,
    required this.request,
    this.senderEmail,
    this.senderCompanyName,
    this.senderCompanyAddress,
    this.senderCity,
    this.senderRegion,
    this.senderBranchName,
    this.status = TicketStatus.Beklemede,
  });
}
