// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// const String baseUrl = 'https://bsslapidemo.dcontroller.com';
//
// // Function to Get Reference Number
// Future<void> getReferenceNumber() async {
//   try {
//     final response = await http.get(
//       Uri.parse('$baseUrl/api/StaffAdvanceRequests/GetStaffDefault'),
//     );
//
//     if (response.statusCode == 200) {
//       var data = json.decode(response.body);
//       print('Reference Number: $data');
//     } else {
//       print('Error: Status code ${response.statusCode}');
//       print('Response: ${response.body}');
//       throw Exception('Failed to fetch reference number');
//     }
//   } catch (e) {
//     print('Error in getReferenceNumber: $e');
//     throw Exception('Failed to fetch reference number');
//   }
// }
//
// // Function to Save Record (Post request)
// Future<void> saveRecord(Map<String, dynamic> recordData) async {
//   try {
//     final response = await http.post(
//       Uri.parse('$baseUrl/api/StaffAdvanceRequests/SaveRecord'),
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode(recordData),
//     );
//
//     if (response.statusCode == 200) {
//       print('Record saved successfully');
//     } else {
//       print('Error: Status code ${response.statusCode}');
//       print('Response: ${response.body}');
//       throw Exception('Failed to save record');
//     }
//   } catch (e) {
//     print('Error in saveRecord: $e');
//     throw Exception('Failed to save record');
//   }
// }
//
// // Function to View Saved Records
// Future<void> viewSavedRecords() async {
//   try {
//     final response = await http.get(
//       Uri.parse('$baseUrl/api/StaffAdvanceRequests/GetListSaveStaffAdvance'),
//     );
//
//     if (response.statusCode == 200) {
//       // Parse the JSON response if successful
//       var data = json.decode(response.body);
//       print('Saved Records: $data');
//     } else {
//       print('Error: Status code ${response.statusCode}');
//       print('Response: ${response.body}');
//       throw Exception('Failed to fetch saved records');
//     }
//   } catch (e) {
//     print('Error in viewSavedRecords: $e');
//     throw Exception('Failed to fetch saved records');
//   }
// }

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
        // 'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiZXJwQURNSU5AYnNzbC5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJlcnBBRE1JTkBic3NsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWVpZGVudGlmaWVyIjoiMjRiMjgxM2UtYzQ1NS00YTkyLWFlMTctZDE3OTMzZDQwOTVkIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9leHBpcmF0aW9uIjoiT2N0IFR1ZSAwMSAyMDI0IDAwOjAxOjA3IEFNIiwibmJmIjoxNzI3NjU0NDY3LCJleHAiOjE3Mjc3MzcyNjcsImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjcwNTAiLCJhdWQiOiJodHRwczovL2xvY2FsaG9zdDo3MDUwIn0.eUjgnew6TkY89nj89zj5mRQdPeBqXMabnsfSGjtVqD8',
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
