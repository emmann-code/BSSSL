import 'package:bssl_app/services/bssl_service.dart';
import 'package:flutter/material.dart';

class TestApi extends StatefulWidget {
  @override
  _TestApiState createState() => _TestApiState();
}

class _TestApiState extends State<TestApi> {
  Map<String, dynamic>? referenceNumber;
  List<dynamic> savedRecords = [];

  @override
  void initState() {
    super.initState();
    fetchReferenceNumber();
    fetchSavedRecords();
  }

  Future<void> fetchReferenceNumber() async {
    try {
      var result = await getReferenceNumber();
      if (result != null) {
        setState(() {
          referenceNumber = result;
        });
      }
    } catch (e) {
      print('Error while fetching reference number: $e');
      showError(context, 'Failed to fetch reference number');
    }
  }

  Future<void> fetchSavedRecords() async {
    try {
      var records = await viewSavedRecords();
      setState(() {
        savedRecords = records;
      });
    } catch (e) {
      print('Error while fetching saved records: $e');
      showError(context, 'Failed to fetch saved records');
    }
  }

  void showError(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Staff Advance Requests'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              referenceNumber != null
                  ? 'Reference Number: ${referenceNumber!['reference']}' // Example display
                  : 'Loading Reference Number...',
            ),
            SizedBox(height: 20),
            Expanded(
              child: savedRecords.isNotEmpty
                  ? ListView.builder(
                itemCount: savedRecords.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Record: ${savedRecords[index]['id']}'), // Example
                    subtitle: Text('Details: ${savedRecords[index]['details']}'),
                  );
                },
              )
                  : Center(child: Text('No saved records available')),
            ),
          ],
        ),
      ),
    );
  }
}
