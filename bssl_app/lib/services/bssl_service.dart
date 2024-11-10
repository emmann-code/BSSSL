import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String baseUrl = 'https://bsslapidemo.dcontroller.com';

// Retrieve token from SharedPreferences
Future<String> getAuthToken() async {
  final prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('authToken');
  if (token == null || token.isEmpty) {
    throw Exception('No auth token found');
  }
  return token;
}

// Function to Get Reference Number
Future<Map<String, dynamic>?> getReferenceNumber() async {
  try {
    String token = await getAuthToken();

    final response = await http.get(
      Uri.parse('$baseUrl/api/StaffAdvanceRequests/GetStaffDefault'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print('Reference Number: $data');
      return data;
    } else {
      print('Error: Status code ${response.statusCode}');
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
    String token = await getAuthToken();

    final response = await http.post(
      Uri.parse('$baseUrl/api/StaffAdvanceRequests/SaveRecord'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(recordData),
    );

    if (response.statusCode == 200) {
      print('Record saved successfully');
    } else {
      throw Exception('Failed to save record');
    }
  } catch (e) {
    print('Error in saveRecord: $e');
    throw Exception('Failed to save record');
  }
}

// Function to View Saved Records
Future<List<dynamic>> viewSavedRecords() async {
  try {
    String token = await getAuthToken();

    final response = await http.get(
      Uri.parse('$baseUrl/api/StaffAdvanceRequests/GetListSaveStaffAdvance'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data as List<dynamic>;
    } else {
      throw Exception('Failed to fetch saved records');
    }
  } catch (e) {
    throw Exception('Failed to fetch saved records');
  }
}

// Function to Authenticate and retrieve token
Future<Map<String, dynamic>> authenticate() async {
  final url = Uri.https('bsslapidemo.dcontroller.com', '/api/Account/Logindetails');

  final body = jsonEncode({
    "userCode": "Admin",
    "subsystem": "Unknown",
    "loginModule": "module001",
    "loginYear": "2024",
    "areaOffice": "Lekki",
    "systemName": "MSI",
    "systemtype": "c7vfkp",
    "systemOs": "windows_11",
    "locationState": "Lagos",
    "locationAddress": "Lekki",
    "locationCountry": "Nigeria",
    "password": "BSSL@TRAINING"
  });

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: body,
  );

  print('Authentication Response: ${response.body}');
  print('Status Code: ${response.statusCode}');

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print('Data: $data');

    if (data.containsKey('token')) {
      return {
        'token': data['token'],
        'userCode': data['userCode'],
        'loginYear': data['loginYear']
      };
    } else {
      throw Exception('Token not found in the response');
    }
  } else {
    throw Exception('Failed to authenticate. Status code: ${response.statusCode}');
  }
}

// Function to Fetch data using token and additional details
Future<void> getReferenceNumberWithParams(String token, String year, String staffCode) async {
  final url = Uri.https('bsslapidemo.dcontroller.com', '/api/StaffAdvanceRequests/GetStaffDefault', {
    'year': year,
    'staffCode': staffCode,
    'refno': ""
  });

  print('Request URL: $url');

  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    print('Response body: ${response.body}');
  } else {
    print('Failed to load data. Status code: ${response.statusCode}');
    print('Response: ${response.body}');
  }
}
