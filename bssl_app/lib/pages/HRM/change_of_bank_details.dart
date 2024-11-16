// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class ChangeOfBankDetails extends StatelessWidget {
  const ChangeOfBankDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class ChangeBankDetails extends StatefulWidget {
  @override
  _ChangeBankDetailsState createState() => _ChangeBankDetailsState();
}

class _ChangeBankDetailsState extends State<ChangeBankDetails> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController referenceNoController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController oldAccountNumberController = TextEditingController();
  final TextEditingController oldAccountNameController = TextEditingController();
  final TextEditingController oldBankNameController = TextEditingController();
  final TextEditingController newAccountNumberController = TextEditingController();
  final TextEditingController newAccountNameController = TextEditingController();
  final TextEditingController newBankNameController = TextEditingController();
  final TextEditingController memoController = TextEditingController();

  String? oldAccountType;
  String? newAccountType;
  String? memoOptionType;

  List<String> accountTypeOptions = ["Savings", "Current", "Fixed Deposit"];
  List<String> memoOptionTypes = ["Program Memo Item", "Financial Memo Item", "Other"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Reference No
              TextFormField(
                controller: referenceNoController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Reference No',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              // Date
              TextFormField(
                controller: dateController,
                decoration: InputDecoration(
                  labelText: 'Date',
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
                onTap: () {
                  // Optionally, add a date picker here
                },
              ),
              SizedBox(height: 30),
              // Old Bank Details Section
              Text(
                "Old Bank Details",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: oldAccountNumberController,
                decoration: InputDecoration(
                  labelText: 'Account Number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: oldAccountNameController,
                decoration: InputDecoration(
                  labelText: 'Account Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: oldBankNameController,
                decoration: InputDecoration(
                  labelText: 'Bank Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              DropdownButtonFormField<String>(
                value: oldAccountType,
                decoration: InputDecoration(
                  labelText: 'Account Type',
                  border: OutlineInputBorder(),
                ),
                items: accountTypeOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    oldAccountType = value;
                  });
                },
              ),
              SizedBox(height: 30), // Space between Old and New Bank Details
              // New Bank Details Section
              Text(
                "New Bank Details",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: newAccountNumberController,
                decoration: InputDecoration(
                  labelText: 'Account Number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: newAccountNameController,
                decoration: InputDecoration(
                  labelText: 'Account Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: newBankNameController,
                decoration: InputDecoration(
                  labelText: 'Bank Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              DropdownButtonFormField<String>(
                value: newAccountType,
                decoration: InputDecoration(
                  labelText: 'Account Type',
                  border: OutlineInputBorder(),
                ),
                items: accountTypeOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    newAccountType = value;
                  });
                },
              ),
              SizedBox(height: 15),
              // Memo Option Type
              DropdownButtonFormField<String>(
                value: memoOptionType,
                decoration: InputDecoration(
                  labelText: 'Select Memo Option Type',
                  border: OutlineInputBorder(),
                ),
                items: memoOptionTypes.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    memoOptionType = value;
                  });
                },
              ),
              SizedBox(height: 30),
              // Memo Body
              Text(
                "Enter Body Of The Memo",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: memoController,
                decoration: InputDecoration(
                  hintText: 'Enter memo content here...',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
              SizedBox(height: 16),
              // File Uploads
              Text("Upload Approved Memo"),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Choose File',
                  suffixIcon: Icon(Icons.file_upload),
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
                onTap: () {
                  // Handle file picker
                },
              ),
              SizedBox(height: 16),
              Text("Upload Edited File"),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Choose File',
                  suffixIcon: Icon(Icons.file_upload),
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
                onTap: () {
                  // Handle file picker
                },
              ),
              SizedBox(height: 16),
              // Action Buttons
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Save for later logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Saved for Later')),
                      );
                    },
                    child: Text("Save For Later"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Send for next processing logic
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Sent for Next Processing')),
                        );
                      }
                    },
                    child: Text("Send To Next Processing"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Delete logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Deleted')),
                      );
                    },
                    child: Text("Delete"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                ],
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
    dateController.dispose();
    oldAccountNumberController.dispose();
    oldAccountNameController.dispose();
    oldBankNameController.dispose();
    newAccountNumberController.dispose();
    newAccountNameController.dispose();
    newBankNameController.dispose();
    memoController.dispose();
    super.dispose();
  }
}
