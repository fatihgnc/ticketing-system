import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/models/ticket.dart';
import 'package:ticketing_system/providers/ticket_provider.dart';

class AddRequestScreen extends StatefulWidget {
  static const routeName = '/add-request';

  @override
  _AddRequestScreenState createState() => _AddRequestScreenState();
}

class _AddRequestScreenState extends State<AddRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _senderController = TextEditingController();
  final _senderPhoneController = TextEditingController();
  final _priorityController = TextEditingController();

  TicketPriority _getPriorityAsEnum(String strPriority) {
    if (strPriority == 'high') {
      return TicketPriority.Yuksek;
    } else if (strPriority == 'normal') {
      return TicketPriority.Normal;
    } else {
      return TicketPriority.Dusuk;
    }
  }

  void _addTicket(BuildContext ctx) {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    Ticket _ticket = Ticket(
      ticketTitle: _titleController.text,
      ticketDescription: _descriptionController.text,
      ticketSender: _senderController.text,
      ticketSenderPhone: _senderPhoneController.text,
      ticketPriority:
          _getPriorityAsEnum(_priorityController.text.trim().toLowerCase()),
      ticketStatus: TicketStatus.Beklemede,
    );

    Provider.of<TicketProvider>(
      context,
      listen: false,
    ).addTicket(_ticket);
  }

  void _saveRequest() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Request'),
        actions: [
          IconButton(
            onPressed: _saveRequest,
            icon: const Icon(Icons.attach_file_rounded),
          ),
          IconButton(
            onPressed: () => _addTicket(context),
            icon: const Icon(
              Icons.done,
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(.1),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextFormField(
                    key: ValueKey('level'),
                    controller: _priorityController,
                    decoration: InputDecoration(
                      labelText: 'Level',
                    ),
                    validator: (inputVal) {
                      if (inputVal!.trim().isEmpty) {
                        return 'This input is required';
                      }

                      if (inputVal.toLowerCase() != 'high' &&
                          inputVal.toLowerCase() != 'normal' &&
                          inputVal.toLowerCase() != 'low') {
                        return 'You can use one of those values: "high, normal, low"!';
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    key: ValueKey('fname'),
                    controller: _senderController,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                    ),
                    validator: (inputVal) {
                      if (inputVal!.trim().isEmpty) {
                        return 'This field is required!';
                      }

                      if (inputVal.length < 2) {
                        return 'Input should be longer than 1 character';
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    key: ValueKey('phone'),
                    keyboardType: TextInputType.phone,
                    controller: _senderPhoneController,
                    decoration: InputDecoration(
                      hintText: 'Phone (Ex: (+90)5338880011)',
                    ),
                    validator: (inputVal) {
                      if (inputVal!.trim().isEmpty) {
                        return 'This field is required!';
                      }

                      if (inputVal.trim().length < 11) {
                        return 'Short input! Phone number must be at least 10 characters!';
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    key: ValueKey('title'),
                    controller: _titleController,
                    decoration: InputDecoration(
                      hintText: 'Title',
                    ),
                    validator: (inputVal) {
                      if (inputVal!.trim().isEmpty) {
                        return 'This field is required!';
                      }

                      if (inputVal.length < 5) {
                        return 'Short input! Provide at least 5 characters.';
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    key: ValueKey('description'),
                    maxLines: 3,
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      hintText: 'Description',
                    ),
                    validator: (inputVal) {
                      if (inputVal!.trim().isEmpty) {
                        return 'This field is required!';
                      }

                      if (inputVal.trim().length < 20) {
                        return 'Short input! You should provide at least 20 characters!';
                      }

                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
