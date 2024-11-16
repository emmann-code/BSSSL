// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class NextOfKinDetails extends StatefulWidget {
  @override
  _NextOfKinDetailsState createState() => _NextOfKinDetailsState();
}

class _NextOfKinDetailsState extends State<NextOfKinDetails> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController referenceNoController = TextEditingController();
  final TextEditingController kinNameController = TextEditingController();
  final TextEditingController kinAddressController = TextEditingController();
  final TextEditingController kinPhoneController = TextEditingController();
  final TextEditingController allocationPercentageController =
      TextEditingController();

  String? selectedRelationship;
  String? isBenefactor;
  List<String> relationshipOptions = [
    "Parent",
    "Sibling",
    "Spouse",
    "Child",
    "Other"
  ];
  List<String> benefactorOptions = ["Yes", "No"];
  List<Map<String, dynamic>> rows = [];

  @override
  void initState() {
    super.initState();
    referenceNoController.text =
        "REF123"; // Example pre-filled reference number
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: referenceNoController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Reference No',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      rows.add({
                        'referenceNo': referenceNoController.text,
                        'kinName': kinNameController.text,
                        'kinAddress': kinAddressController.text,
                        'kinPhone': kinPhoneController.text,
                        'allocationPercentage':
                            allocationPercentageController.text,
                        'relationship': selectedRelationship,
                        'isBenefactor': isBenefactor,
                      });
                      // Clear the fields for new entry
                      kinNameController.clear();
                      kinAddressController.clear();
                      kinPhoneController.clear();
                      allocationPercentageController.clear();
                      selectedRelationship = null;
                      isBenefactor = null;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('New row added')),
                    );
                  }
                },
                child: Text('Add New Row'),
              ),
              SizedBox(height: 20),
              ...rows.map((row) => Card(
                    child: ListTile(
                      title: Text('${row['kinName']} (${row['relationship']})'),
                      subtitle: Text(
                          'Phone: ${row['kinPhone']}, Allocation: ${row['allocationPercentage']}%'),
                    ),
                  )),
              SizedBox(height: 15),
              TextFormField(
                controller: kinNameController,
                decoration: InputDecoration(
                  labelText: 'Next of Kin Name *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the next of kin name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: kinAddressController,
                decoration: InputDecoration(
                  labelText: 'Next of Kin Address *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the next of kin address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: kinPhoneController,
                decoration: InputDecoration(
                  labelText: 'Next of Kin Phone Number *',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the next of kin phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: allocationPercentageController,
                decoration: InputDecoration(
                  labelText: 'Percentage(%) Of Allocation *',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the allocation percentage';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: selectedRelationship,
                decoration: InputDecoration(
                  labelText: 'Select Next of Kin Relationship *',
                  border: OutlineInputBorder(),
                ),
                items: relationshipOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedRelationship = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a relationship';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: isBenefactor,
                decoration: InputDecoration(
                  labelText: 'Is Next of Kin a Benefactor *',
                  border: OutlineInputBorder(),
                ),
                items: benefactorOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    isBenefactor = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an option';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText:
                      'File/Documentary Reference Providing Additional Background Information',
                  hintText: 'Choose File',
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
                onTap: () {
                  // Handle file picker
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('File picker not implemented')),
                  );
                },
              ),
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Save as draft logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Saved as Draft')),
                      );
                    },
                    child: Text('Save as Draft'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Submit for further processing logic
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('Submitted for Further Processing')),
                        );
                      }
                    },
                    child: Text('Send for Further Processing'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // View List logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('View List clicked')),
                      );
                    },
                    child: Text('View List'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        // Refresh page logic
                        setState(() {
                          // Clear all fields
                          kinNameController.clear();
                          kinAddressController.clear();
                          kinPhoneController.clear();
                          allocationPercentageController.clear();
                          selectedRelationship = null;
                          isBenefactor = null;
                        });
                      },
                      child: Text('Refresh Page'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue)),
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
    kinNameController.dispose();
    kinAddressController.dispose();
    kinPhoneController.dispose();
    allocationPercentageController.dispose();
    super.dispose();
  }
}
