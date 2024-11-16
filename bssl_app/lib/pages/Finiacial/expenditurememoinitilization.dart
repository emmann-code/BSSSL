import 'package:bssl_app/components/my_drawer.dart';
import 'package:flutter/material.dart';

class ExpenditureInitializationMemo extends StatefulWidget {
  @override
  _ExpenditureInitializationMemoState createState() =>
      _ExpenditureInitializationMemoState();
}

class _ExpenditureInitializationMemoState
    extends State<ExpenditureInitializationMemo> {
  final _referenceController = TextEditingController();
  final _subjectController = TextEditingController();
  final _amountController = TextEditingController();
  String _requestType = 'WAEC/YABA/IMC';
  String _processType = '-Select-';
  String _memoType = 'Upload';
  bool _isFileUploaded = false;
  bool _isAdditionalFileUploaded = false;

  @override
  void dispose() {
    _referenceController.dispose();
    _subjectController.dispose();
    _amountController.dispose();
    super.dispose();
  }

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
            child: Text(item,style: TextStyle(fontSize: 14),),
          );
        }).toList(),
      ),
    );
  }

  Widget buildFileUploadMemo(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'only pdf file accepted for upload: (not more than 5mb)',
          style: TextStyle(color: Colors.orange),
        ),
        SizedBox(height: 5),
        ElevatedButton(
          onPressed: () {
            // Handle file upload logic here
            setState(() {
              _isFileUploaded = true;
            });
          },
          child: Row(
            children: [
              Text(label),
              Icon(Icons.file_upload),
              SizedBox(width: 5),
              Text('Choose File'),
            ],
          ),
        ),
        Text(_isFileUploaded ? 'File uploaded successfully' : 'No file chosen'),
      ],
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
      appBar: AppBar(
        title: Text('Expenditure Initialization Memo'),
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDropdown(
                'Reference No *',
                _requestType,
                ['WAEC/YABA/IMC', 'Other'],
                    (String? newValue) {
                  setState(() {
                    _requestType = newValue!;
                  });
                },
              ),
              buildDropdown(
                'Request/Process Type',
                _processType,
                ['-Select-', 'Third Party Payment Request(Invoice)', 'Third Party Payment Request(Mobile/Advance)', 'Inter Office funding(Office/Branch)','Other Payment','Payment of Staff Loan'],
                    (String? newValue) {
                  setState(() {
                    _processType = newValue!;
                  });
                },
              ),
              buildTextInput('Enter Subject:', _subjectController),
              buildTextInput('Amount in Request:', _amountController),
              buildDropdown(
                'Memo Type',
                _memoType,
                ['Upload', 'Option 2', 'Option 3'],
                    (String? newValue) {
                  setState(() {
                    _memoType = newValue!;
                  });
                },
              ),
              SizedBox(height: 20),
              buildFileUploadMemo('Upload approved memo'),
              SizedBox(height: 20),
              buildFileUploadMemo('Upload additional file'),
              SizedBox(height: 20),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton('Save as Draft', Colors.teal, () {
                        // Save draft logic
                      }),
                      buildButton('Save & Send to Next Process', Colors.teal[700]!, () {
                        // Submit logic
                      }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton('Quarantine Request', Colors.red[300]!, () {
                        // Quarantine logic
                      }),
                      SizedBox(height: 10),
                      buildButton('Refresh Page', Colors.red, () {
                        // Refresh logic
                      }),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
