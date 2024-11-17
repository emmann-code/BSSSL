// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
//
// import 'package:bssl_app/Utils/file_Picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../../components/my_button.dart';
// import '../../components/my_data_table.dart';
// import '../../components/my_label.dart';
// import '../../components/my_customtextfieild.dart';
//
// class StaffAdvanceRetirementPage extends StatefulWidget {
//   @override
//   State<StaffAdvanceRetirementPage> createState() => _StaffAdvanceRetirementPageState();
// }
//
// class _StaffAdvanceRetirementPageState extends State<StaffAdvanceRetirementPage> {
//   final TextEditingController referenceController = TextEditingController();
//
//   final TextEditingController dateController = TextEditingController();
//
//   final TextEditingController expenseDescriptionController =
//       TextEditingController();
//
//   final TextEditingController balanceRefundedByStaffController =
//       TextEditingController();
//
//   final TextEditingController balanceRefundedToStaffController =
//       TextEditingController();
//
//       @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // viewSavedRecords();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Container(
//           padding: EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(25)
//           ),
//           child: Padding(
//             // padding: const EdgeInsets.all(8.0),
//             padding: const EdgeInsets.symmetric(vertical: 8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CustomLabel(text: "Reference No."),
//                 const SizedBox(height: 8),
//                 CustomTextField(
//                   label: "Enter reference number",
//                   controller: referenceController,
//                   maxLines: 2,
//                   inputFormatters: [],
//                 ),
//                 const SizedBox(height: 16),
//                 CustomLabel(text: "Date"),
//                 const SizedBox(height: 8),
//                 CustomTextField(
//                   label: "Enter date",
//                   controller: dateController,
//                   maxLines: 2,
//                   inputFormatters: [],
//                 ),
//                 const SizedBox(height: 16),
//                 CustomLabel(text: "Select Type of Retirement"),
//                 const SizedBox(height: 8),
//                 DropdownButtonFormField<String>(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                   ),
//                   items: <String>['Type 1', 'Type 2', 'Type 3']
//                       .map((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                   onChanged: (_) {},
//                 ),
//                 const SizedBox(height: 16),
//                 CustomLabel(text: "General Nature of Expenses"),
//                 const SizedBox(height: 8),
//                 CustomTextField(
//                   label: "Describe expenses",
//                   controller: expenseDescriptionController,
//                   keyboardType: TextInputType.multiline,
//                   maxLines: 3,
//                   inputFormatters: [],
//                 ),
//                 const SizedBox(height: 16),
//                 CustomLabel(text: "Upload Receipt"),
//                 const SizedBox(height: 8),
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     UploadFiles ups = UploadFiles();
//                     ups.addPdf();
//                   },
//                   icon: Icon(Icons.attach_file),
//                   label: Text("Choose File"),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   "Only PDF File accepted for upload: (not more than 5mb)",
//                   style: TextStyle(color: Colors.red),
//                 ),
//                 const SizedBox(height: 16),
//                 MyDatatable(),
//                 const SizedBox(height: 16),
//                 CustomLabel(text: "Balance to be Refunded by Staff"),
//                 const SizedBox(height: 8),
//                 CustomTextField(
//                   label: "Enter amount",
//                   controller: balanceRefundedByStaffController,
//                   keyboardType: TextInputType.number,
//                   maxLines: 2,
//                   inputFormatters: [],
//                 ),
//                 const SizedBox(height: 16),
//                 CustomLabel(text: "Balance to be Refunded to Staff"),
//                 const SizedBox(height: 8),
//                 CustomTextField(
//                   label: "Enter amount",
//                   controller: balanceRefundedToStaffController,
//                   keyboardType: TextInputType.number,
//                   maxLines: 2,
//                   inputFormatters: [],
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     CustomButton(
//                       text: "Save as draft",
//                       onPressed: () {
//                         // Save as Draft functionality
//                       },
//                       color: Theme.of(context)
//                           .colorScheme
//                           .background
//                           .withOpacity(0.009),
//                     ),
//                     CustomButton(
//                       text: "Send for further \n   processing",
//                       onPressed: () {
//                         // Send functionality
//                       },
//                       color: Theme.of(context).colorScheme.secondary,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../components/my_button.dart';
import '../../components/my_data_table.dart';
import '../../components/my_label.dart';
import '../../components/my_customtextfieild.dart';
import '../../services/bssl_service.dart';

class StaffAdvanceRetirementPage extends StatefulWidget {
  @override
  State<StaffAdvanceRetirementPage> createState() =>
      _StaffAdvanceRetirementPageState();
}

class _StaffAdvanceRetirementPageState
    extends State<StaffAdvanceRetirementPage> {
  final TextEditingController referenceController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController expenseDescriptionController =
  TextEditingController();
  final TextEditingController balanceRefundedByStaffController =
  TextEditingController();
  final TextEditingController balanceRefundedToStaffController =
  TextEditingController();

  List<dynamic> savedAdvances = []; // Store fetched advances

  @override
  void initState() {
    super.initState();
    fetchReferenceNumber();
    fetchSavedAdvances();
  }

  Future<void> fetchReferenceNumber() async {
    try {
      var referenceData = await gETrEFRENCEnUMBER();
      if (referenceData != null) {
        setState(() {
          referenceController.text = referenceData['referenceNumber'] ?? '';
        });
      }
    } catch (e) {
      print('Error fetching reference number: $e');
    }
  }

  Future<void> fetchSavedAdvances() async {
    try {
      List<dynamic> advances = await viewSavedAdvances();
      setState(() {
        savedAdvances = advances;
      });
    } catch (e) {
      print('Error fetching saved advances: $e');
    }
  }

  Future<void> saveRecord() async {
    try {
      Map<String, dynamic> recordData = {
        "referenceNumber": referenceController.text,
        "date": dateController.text,
        "expenseDescription": expenseDescriptionController.text,
        "balanceRefundedByStaff":
        double.tryParse(balanceRefundedByStaffController.text) ?? 0,
        "balanceRefundedToStaff":
        double.tryParse(balanceRefundedToStaffController.text) ?? 0,
      };
      await saveRECORD(recordData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Record saved successfully')),
      );
      fetchSavedAdvances(); // Refresh saved advances after saving
    } catch (e) {
      print('Error saving record: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving record')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomLabel(text: "Reference No."),
                const SizedBox(height: 8),
                CustomTextField(
                  label: "Enter reference number",
                  controller: referenceController,
                  maxLines: 1, inputFormatters: [],
                ),
                const SizedBox(height: 16),
                CustomLabel(text: "Date"),
                const SizedBox(height: 8),
                CustomTextField(
                  label: "Enter date",
                  controller: dateController,
                  maxLines: 1, inputFormatters: [],
                ),
                const SizedBox(height: 16),
                CustomLabel(text: "General Nature of Expenses"),
                const SizedBox(height: 8),
                CustomTextField(
                  label: "Describe expenses",
                  controller: expenseDescriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3, inputFormatters: [],
                ),
                const SizedBox(height: 16),
                MyDatatable(), // Existing data table component
                const SizedBox(height: 16),
                CustomLabel(text: "Balance to be Refunded by Staff"),
                const SizedBox(height: 8),
                CustomTextField(
                  label: "Enter amount",
                  controller: balanceRefundedByStaffController,
                  keyboardType: TextInputType.number,
                  maxLines: 1, inputFormatters: [],
                ),
                const SizedBox(height: 16),
                CustomLabel(text: "Balance to be Refunded to Staff"),
                const SizedBox(height: 8),
                CustomTextField(
                  label: "Enter amount",
                  controller: balanceRefundedToStaffController,
                  keyboardType: TextInputType.number,
                  maxLines: 1, inputFormatters: [],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      text: "Save as Draft",
                      onPressed: saveRecord,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    CustomButton(
                      text: "Send for Processing",
                      onPressed: saveRecord,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CustomLabel(text: "Saved Advances"),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: savedAdvances.length,
                  itemBuilder: (context, index) {
                    var advance = savedAdvances[index];
                    return ListTile(
                      title: Text(advance['description'] ?? 'No Description'),
                      subtitle: Text(
                          'Date: ${advance['date'] ?? 'No Date'} - Amount: ${advance['amount'] ?? 0}'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
