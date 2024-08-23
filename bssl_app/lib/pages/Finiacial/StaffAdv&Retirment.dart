import 'package:bssl_app/components/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../components/my_button.dart';
import '../../components/my_data_table.dart';
import '../../components/my_label.dart';
import '../../components/my_textfieild.dart';

class StaffAdvanceRetirementPage extends StatelessWidget {
  final TextEditingController referenceController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController expenseDescriptionController = TextEditingController();
  final TextEditingController balanceRefundedByStaffController = TextEditingController();
  final TextEditingController balanceRefundedToStaffController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Staff Advance Retirement and Reimbursement"),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomLabel(text: "Reference No."),
            const SizedBox(height: 8),
            CustomTextField(label: "Enter reference number", controller: referenceController, maxLines: 2, inputFormatters: [],),
            const SizedBox(height: 16),
            CustomLabel(text: "Date"),
            const SizedBox(height: 8),
            CustomTextField(label: "Enter date", controller: dateController, maxLines: 2, inputFormatters: [],),
            const SizedBox(height: 16),
            CustomLabel(text: "Select Type of Retirement"),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              items: <String>['Type 1', 'Type 2', 'Type 3'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {},
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
            CustomLabel(text: "Upload Receipt"),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.attach_file),
              label: Text("Choose File"),
            ),
            const SizedBox(height: 8),
            Text(
              "Only PDF File accepted for upload: (not more than 5mb)",
              style: TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 16),
            MyDatatable(),
            const SizedBox(height: 16),
            CustomLabel(text: "Balance to be Refunded by Staff"),
            const SizedBox(height: 8),
            CustomTextField(
              label: "Enter amount",
              controller: balanceRefundedByStaffController,
              keyboardType: TextInputType.number, maxLines: 2, inputFormatters: [],
            ),
            const SizedBox(height: 16),
            CustomLabel(text: "Balance to be Refunded to Staff"),
            const SizedBox(height: 8),
            CustomTextField(
              label: "Enter amount",
              controller: balanceRefundedToStaffController,
              keyboardType: TextInputType.number, maxLines: 2, inputFormatters: [],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  text: "Save as Draft",
                  onPressed: () {
                    // Save as Draft functionality
                  },
                  color: Theme.of(context).colorScheme.background.withOpacity(0.009),
                ),
                CustomButton(
                  text: "Send for Further Processing",
                  onPressed: () {
                    // Send functionality
                  },
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
