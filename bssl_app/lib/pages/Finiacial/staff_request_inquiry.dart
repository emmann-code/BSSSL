// ignore_for_file: prefer_const_constructors, unused_field

import 'package:flutter/material.dart';

import '../../components/my_drawer.dart';
class StaffrequestinquiryPage extends StatefulWidget {
  const StaffrequestinquiryPage({super.key});

  @override
  State<StaffrequestinquiryPage> createState() => _StaffrequestinquiryPageState();
}

class _StaffrequestinquiryPageState extends State<StaffrequestinquiryPage> {

  String _requestType = '--Select--';
  String _processType = '--Select--';


  Widget buildTextInput(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget buildDropdown(String label, String value, List<String> items, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: value,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item,style: TextStyle(fontSize: 10),),
          );
        }).toList(),
      ),
    );
  }

  Widget buildButton(String label, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Card(
          margin: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  'Request Inquiry',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                buildDropdown(
                    'What to Inquire',
                    _requestType,
                    ['--Select--','Expenditure Initialization Memo','Staff Advanced Request', 'Staff Advances Retirement and Reimbursement'],
                    (String? newvalue) {
                      setState(() {
                        _processType = newvalue!;
                      });
                    },
                ),
                SizedBox(height: 15,),
                buildDropdown(
                  'Year',
                  _requestType,
                  ['--Select--','Other'],
                      (String? newvalue) {
                    setState(() {
                      _processType = newvalue!;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton('Fetch Records', Colors.blue[300]!, () {
                      // Quarantine logic
                    }),
                    SizedBox(height: 10),
                    buildButton('Refresh Page', Colors.blueAccent, () {
                      // Refresh logic
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}