// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class LeaveRoster extends StatefulWidget {
  @override
  _LeaveRosterState createState() => _LeaveRosterState();
}

class _LeaveRosterState extends State<LeaveRoster> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController referenceNoController = TextEditingController();
  final TextEditingController leaveYearController = TextEditingController();
  final TextEditingController approvalStatusController =
      TextEditingController();
  final TextEditingController rosterStartDateController =
      TextEditingController();
  final TextEditingController rosterEndDateController = TextEditingController();
  final TextEditingController rosterLeaveDateStatusController =
      TextEditingController();
  final TextEditingController leaveBalController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: referenceNoController,
                decoration: InputDecoration(
                  labelText: 'Reference No',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: leaveYearController,
                decoration: InputDecoration(
                  labelText: 'Leave Year',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: approvalStatusController,
                decoration: InputDecoration(
                  labelText: 'Approval Status',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: rosterStartDateController,
                decoration: InputDecoration(
                  labelText: 'Roster Start Date *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the roster start date';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: rosterEndDateController,
                decoration: InputDecoration(
                  labelText: 'Roster End Date *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the roster end date';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: rosterLeaveDateStatusController,
                decoration: InputDecoration(
                  labelText: 'Roster Leave Date Status',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: leaveBalController,
                decoration: InputDecoration(
                  labelText: 'Leave Bal *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the leave balance';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: startDateController,
                decoration: InputDecoration(
                  labelText: 'Start Date *',
                  border: OutlineInputBorder(),
                  hintText: 'dd/mm/yyyy',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the start date';
                  }
                  return null;
                },
                onTap: () async {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (date != null) {
                    startDateController.text =
                        "${date.day}/${date.month}/${date.year}";
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: endDateController,
                decoration: InputDecoration(
                  labelText: 'End Date *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the end date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform save or submit action here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    referenceNoController.dispose();
    leaveYearController.dispose();
    approvalStatusController.dispose();
    rosterStartDateController.dispose();
    rosterEndDateController.dispose();
    rosterLeaveDateStatusController.dispose();
    leaveBalController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }
}
