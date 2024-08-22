import 'package:bssl_app/components/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/my_button.dart';
import '../../components/my_label.dart';
import '../../components/my_textfieild.dart';

class StaffAdvanceRequestPage extends StatelessWidget {
  final TextEditingController referenceController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController purposeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Staff Advance Request"),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
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
            CustomLabel(text: "Type of Advance"),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              ),
              items: <String>['Travel', 'Miscellaneous', 'Medical'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ),
            const SizedBox(height: 16),
            CustomLabel(text: "Requesting Amount"),
            const SizedBox(height: 8),
            CustomTextField(
              label: "Enter amount",
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
              maxLines: 1,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(value: false, onChanged: (bool? value) {}),
                const SizedBox(width: 8),
                CustomLabel(text: "Travel Advance"),
              ],
            ),
            const SizedBox(height: 16),
            CustomLabel(text: "Purpose of Advance"),
            const SizedBox(height: 8),
            CustomTextField(
              label: "Enter purpose",
              controller: purposeController,
              maxLines: 4, inputFormatters: [],
            ),
            const SizedBox(height: 16),
            CustomLabel(text: "File/Documentary Reference Providing Additional Background Information"),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () {
                // Handle file selection
              },
              icon: Icon(Icons.attach_file),
              label: Text("Choose File"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Only PDF File accepted for upload: (not more than 5mb)",
              style: TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 16),
            Text(
              "Undertaking: I undertake to retire the advance within 14 days of completion of the purpose for the advance",
              style: TextStyle(color: Theme.of(context).textTheme.bodySmall!.color),
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
                  color: Theme.of(context).colorScheme.primary,
                ),
                CustomButton(
                  text: "Send for further processing",
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
