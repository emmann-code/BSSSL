import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://bsslapidemo.dcontroller.com';

// Function to Get Reference Number
Future<void> saveRecord(String token, Map<String, dynamic> recordData) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/api/StaffAdvanceRequests/SaveRecord'),
      headers: {
        'Authorization': 'Bearer $token', // Pass the token in the headers
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
Future<void> viewSavedRecords(String token) async {
  // Add query parameters if needed (e.g., 'year' and 'staffCode')
  final url = Uri.https('bsslapidemo.dcontroller.com',
      '/api/StaffAdvanceRequests/GetListSaveStaffAdvance', {
    'year': token, // Adding 'staffCode' as a query parameter
  });

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token', // Pass the token in the headers
        'Content-Type': 'application/json',
      },
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



  Future<Map<String, dynamic>> authenticate() async {
    final url =
        Uri.https('bsslapidemo.dcontroller.com', '/api/Account/Logindetails');

    // JSON payload as per the API documentation
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

    // Send POST request to authenticate
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );

    // Print the entire response for debugging
    print('Authentication Response: ${response.body}');
    print('Status Code: ${response.statusCode}');

    // Check if the authentication is successful
    if (response.statusCode == 200) {
      // Extract the bearer token and other details from the response
      final data = jsonDecode(response.body);
      // Print the data to see the structure of the response
      print('Data: $data');

      // Check what key contains the token
      if (data.containsKey('token')) {
        print(data['token']);
        print(data['userCode']);
        print(data['loginYear']);
        return {
          'token': data['token'],
          'userCode': data['userCode'],
          'loginYear': data['loginYear']
        }; // Return a map with multiple parameters
      } else {
        throw Exception('Token not found in the response');
      }
    } else {
      throw Exception(
          'Failed to authenticate. Status code: ${response.statusCode}');
    }
  }

  // Fetch data using the token and additional details
Future<void> getReferenceNumber(String token, String year, String staffCode) async {
  // Add the parameters as query parameters in the URL
  final url = Uri.https('bsslapidemo.dcontroller.com',
      '/api/StaffAdvanceRequests/GetStaffDefault', {
    'year': year,         // Adding 'year' as a query parameter
    'staffCode': staffCode, // Adding 'staffCode' as a query parameter
    'refno': ""
  });

  print('Request URL: $url');

  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $token', // Pass the token in the headers
      'Content-Type': 'application/json',
    },
  );

  // Check if the request is successful
  if (response.statusCode == 200) {
    print('Response body: ${response.body}');
  } else {
    print('Failed to load data. Status code: ${response.statusCode}');
    print('Response: ${response.body}'); // Print response to check error details
  }
}