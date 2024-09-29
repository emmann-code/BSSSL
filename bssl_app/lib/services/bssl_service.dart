import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://bsslapidemo.dcontroller.com';

// Function to Get Reference Number
Future<void> getReferenceNumber() async {
  try {
    final response = await http.get(
      Uri.parse('$baseUrl/api/StaffAdvanceRequests/GetStaffDefault'),
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print('Reference Number: $data');
    } else {
      print('Error: Status code ${response.statusCode}');
      print('Response: ${response.body}');
      throw Exception('Failed to fetch reference number');
    }
  } catch (e) {
    print('Error in getReferenceNumber: $e');
    throw Exception('Failed to fetch reference number');
  }
}

// Function to Save Record (Post request)
Future<void> saveRecord(Map<String, dynamic> recordData) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/api/StaffAdvanceRequests/SaveRecord'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(recordData),
    );

    if (response.statusCode == 200) {
      print('Record saved successfully');
    } else {
      print('Error: Status code ${response.statusCode}');
      print('Response: ${response.body}');
      throw Exception('Failed to save record');
    }
  } catch (e) {
    print('Error in saveRecord: $e');
    throw Exception('Failed to save record');
  }
}

// Function to View Saved Records
Future<void> viewSavedRecords() async {
  try {
    final response = await http.get(
      Uri.parse('$baseUrl/api/StaffAdvanceRequests/GetListSaveStaffAdvance'),
    );

    if (response.statusCode == 200) {
      // Parse the JSON response if successful
      var data = json.decode(response.body);
      print('Saved Records: $data');
    } else {
      print('Error: Status code ${response.statusCode}');
      print('Response: ${response.body}');
      throw Exception('Failed to fetch saved records');
    }
  } catch (e) {
    print('Error in viewSavedRecords: $e');
    throw Exception('Failed to fetch saved records');
  }
}
