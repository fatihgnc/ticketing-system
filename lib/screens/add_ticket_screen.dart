import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/models/ticket.dart';
import 'package:ticketing_system/providers/ticket_provider.dart';
import 'package:ticketing_system/providers/user_provider.dart';

class AddRequestScreen extends StatefulWidget {
  static const routeName = '/add-request';

  @override
  _AddRequestScreenState createState() => _AddRequestScreenState();
}

class _AddRequestScreenState extends State<AddRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priorityController = TextEditingController();
  final _requestController = TextEditingController();
  final _companyAddressController = TextEditingController();

  TicketPriority _getPriorityAsEnum(String strPriority) {
    if (strPriority == 'high') {
      return TicketPriority.Yuksek;
    } else if (strPriority == 'normal') {
      return TicketPriority.Orta;
    } else {
      return TicketPriority.Dusuk;
    }
  }

  TicketRequest _getRequestAsEnum(String strRequest) {
    strRequest = strRequest.toLowerCase().trim();
    if (strRequest == 'price') {
      return TicketRequest.Price;
    } else if (strRequest == 'project') {
      return TicketRequest.Project;
    } else if (strRequest == 'demo') {
      return TicketRequest.Demo;
    } else {
      return TicketRequest.Job;
    }
  }

  void _addTicket(BuildContext ctx) {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final authedUser = Provider.of<UserProvider>(context, listen: false).user;

    Ticket _ticket = Ticket(
      title: _titleController.text,
      description: _descriptionController.text,
      senderCompanyAddress: _companyAddressController.text,
      senderFullName: authedUser.fullName,
      senderPhone: authedUser.phone,
      senderBranchName: authedUser.branchName,
      senderCity: authedUser.city,
      senderCompanyName: authedUser.companyName,
      senderEmail: authedUser.email,
      senderRegion: authedUser.region,
      priority: _getPriorityAsEnum(
        _priorityController.text.trim().toLowerCase(),
      ),
      request: _getRequestAsEnum(
        _priorityController.text.trim().toLowerCase(),
      ),
      isSelected: false,
    );

    Provider.of<TicketProvider>(
      context,
      listen: false,
    ).addTicket(_ticket);

    inspect(Provider.of<TicketProvider>(
      context,
      listen: false,
    ).tickets);

    Navigator.of(context).pop();
  }

  TextFormField _buildTextField({
    required String keyName,
    required String labelText,
    required String? Function(String? inputVal) validator,
    required TextEditingController controller,
    int? maxLines,
    TextInputType? keyboardType,
    bool? obscureText,
  }) {
    return TextFormField(
      key: ValueKey(keyName),
      keyboardType: keyboardType,
      controller: controller,
      maxLines: maxLines,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      validator: validator,
    );
  }

  String? _validateInput({
    required String inputVal,
    required bool shouldCheckContains,
    required int lowLimit,
    List<String?>? stringToCheckContains,
    int? highLimit,
    bool? shouldContain,
    bool? willConfirmPassword,
    String? passTxt,
    String? confirmPassTxt,
  }) {
    if (inputVal.trim().isEmpty) {
      return 'This field is required!';
    }

    inputVal = inputVal.trim().toLowerCase();

    if (highLimit != null) {
      if (inputVal.length < lowLimit || inputVal.length > highLimit) {
        return 'Short or long input!';
      }
    } else {
      if (inputVal.length < lowLimit) {
        return 'Short input!';
      }
    }

    if (stringToCheckContains != null) {
      if (shouldContain != null) {
        if (shouldContain
            ? stringToCheckContains.any((str) => str == inputVal)
            : !stringToCheckContains.any(
                (str) => str == inputVal,
              )) {
          return null;
        }
        return shouldContain
            ? stringToCheckContains.length > 1
                ? 'Must contain one of: $stringToCheckContains!'
                : 'Must contain $stringToCheckContains'
            : stringToCheckContains.length > 1
                ? 'Mustn\'t contain one of: $stringToCheckContains!'
                : 'Mustn\'t contain $stringToCheckContains';
      }
    }

    if (willConfirmPassword != null) {
      if (passTxt != null && confirmPassTxt != null) {
        return passTxt == confirmPassTxt ? null : 'Passwords do not match!';
      }
    }

    return null;
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
        title: const Text('Add Ticket'),
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
                  _buildTextField(
                    keyName: 'level',
                    labelText: 'Urgency level(High/Normal/Low)',
                    validator: (inputVal) => _validateInput(
                      inputVal: inputVal!,
                      shouldCheckContains: true,
                      shouldContain: true,
                      stringToCheckContains: [
                        'high',
                        'normal',
                        'low',
                      ],
                      lowLimit: 3,
                    ),
                    controller: _priorityController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _buildTextField(
                    keyName: 'request',
                    labelText: 'Request(Price/Project/Job/Demo)',
                    validator: (inputVal) => _validateInput(
                      inputVal: inputVal!,
                      lowLimit: 3,
                      shouldCheckContains: true,
                      shouldContain: true,
                      stringToCheckContains: [
                        'price',
                        'job',
                        'demo',
                        'project'
                      ],
                    ),
                    controller: _requestController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _buildTextField(
                    keyName: 'compAddress',
                    labelText: 'Company Address',
                    validator: (inputVal) => _validateInput(
                      inputVal: inputVal!,
                      shouldCheckContains: false,
                      lowLimit: 10,
                    ),
                    controller: _companyAddressController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _buildTextField(
                    keyName: 'title',
                    labelText: 'Ticket Title',
                    validator: (inputVal) => _validateInput(
                      inputVal: inputVal!,
                      shouldCheckContains: false,
                      lowLimit: 10,
                    ),
                    controller: _titleController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _buildTextField(
                    keyName: 'description',
                    labelText: 'Ticket Description',
                    maxLines: 3,
                    validator: (inputVal) => _validateInput(
                      inputVal: inputVal!,
                      shouldCheckContains: false,
                      lowLimit: 40,
                    ),
                    controller: _descriptionController,
                  ),
                  TextButton(
                    onPressed: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();

                      if (result != null) {
                        File file = File(result.files.single.path);
                        if (file.lengthSync() > 1000 * 1000 * 15) {
                          return;
                        }
                      }
                    },
                    child: const Text('Upload File'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
