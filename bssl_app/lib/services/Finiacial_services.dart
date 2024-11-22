import 'package:bssl_app/services/bssl_service.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String baseUrl = 'https://bsslapidemo.dcontroller.com';
// STAFF ADVANCE REQUEST AND REIMBURSEMENT
// Get reference number

Future<dynamic> getreferencenumber(String token) async {
  final url = Uri.https(
    'bsslapidemo.dcontroller.com',
    '/api/ExpenseStatements/NewRecord',
    {
      'staffcode': "10604",
    },
  );

  print('Request URL: $url');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      final decoded = jsonDecode(response.body);

      if (decoded is Map<String, dynamic>) {
        return decoded;
      } else if (decoded is List) {
        return decoded;
      } else {
        print('Unexpected response format.');
        return null;
      }
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
      return null;
    }
  } catch (e) {
    print('An error occurred: $e');
    return null;
  }
}

// Get saved expensesList
Future<dynamic> GetSavedExpensesList(String token) async {
  final url = Uri.https(
    'bsslapidemo.dcontroller.com',
    '/api//ExpenseStatements/GetSaveListExpen',
    {
      'staffid': "10604",

    },
  );

  print('Request URL: $url');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      final decoded = jsonDecode(response.body);

      if (decoded is Map<String, dynamic>) {
        return decoded;
      } else if (decoded is List) {
        return decoded;
      } else {
        print('Unexpected response format.');
        return null;
      }
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
      return null;
    }
  } catch (e) {
    print('An error occurred: $e');
    return null;
  }
}

// Get saved expenses
Future<dynamic> GetSavedExpenses(String token) async {
  final url = Uri.https(
    'bsslapidemo.dcontroller.com',
    '/api/ExpenseStatements/GetSaveExpenapi/api/',
    {
      'staffid': "10604",
      'refno': "11110",

    },
  );

  print('Request URL: $url');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      final decoded = jsonDecode(response.body);

      if (decoded is Map<String, dynamic>) {
        return decoded;
      } else if (decoded is List) {
        return decoded;
      } else {
        print('Unexpected response format.');
        return null;
      }
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
      return null;
    }
  } catch (e) {
    print('An error occurred: $e');
    return null;
  }
}

// Save Record
Future<dynamic> SaveStaffReimbusRecord(String token) async {
  final url = Uri.https('bsslapidemo.dcontroller.com',
      '/api//ExpenseStatements/SaveRecord', );

  final body = jsonEncode({
    "refrenceNo": "string",
    "date": "string",
    "staffNo": "string",
    "iniAdvance": 0,
    "balanceAmount": 0,
    "refundAmount": 0,
    "purpose": "string",
    "recieptId": "string",
    "expensesDEscription": "string",
    "amount": 0,
    "sentforApproval": "s",
    "fileId": "string",
    "whatselected": "s",
    "qty": "string",
    "filefullpath": "string",
    "issaReturn": "s",
    "senderkeyID": "string",
    "qaurantined": "s",
    "advrefrenceno": "string",
    "staffNames": "string",
    "position": "string",
    "department": "string",
    "expenceDetails": [
      {
        "id": 0,
        "expenseDescription": "string",
        "natureExpenses": "string",
        "quantity": "string",
        "code": "string",
        "recieptNo": "string",
        "amount": 0,
        "updated": true
      }
    ]
  });

  print('Request Body: $body');

  final response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
    body: body,
  );

  print('Status Code: ${response.statusCode}');

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print('Data: $data');
  } else {
    throw Exception(
        'Failed to save records. Status code: ${response.statusCode}');
  }
}




// STAFF ADVANCE REQUEST
// Get single save record
Future<dynamic> GetSingleSavedRecords(String token) async {
  final url = Uri.https(
    'bsslapidemo.dcontroller.com',
    '/api/StaffAdvanceRequests/GetStaffDefault',
    {
      'staffcode': "10604",
      'refno': "11110",
      'acyear':'2024'
    },
  );

  print('Request URL: $url');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      final decoded = jsonDecode(response.body);

      if (decoded is Map<String, dynamic>) {
        return decoded;
      } else if (decoded is List) {
        return decoded;
      } else {
        print('Unexpected response format.');
        return null;
      }
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
      return null;
    }
  } catch (e) {
    print('An error occurred: $e');
    return null;
  }
}

// Get list of Save Records
// api/StaffAdvanceRequests/GetListSaveStaffAdvance
Future<dynamic> GetListSavedRecords(String token) async {
  final url = Uri.https(
    'bsslapidemo.dcontroller.com',
    '/api/StaffAdvanceRequests/GetStaffDefault',
    {
      'staffcode': "10604",

    },
  );

  print('Request URL: $url');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      final decoded = jsonDecode(response.body);

      if (decoded is Map<String, dynamic>) {
        return decoded;
      } else if (decoded is List) {
        return decoded;
      } else {
        print('Unexpected response format.');
        return null;
      }
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
      return null;
    }
  } catch (e) {
    print('An error occurred: $e');
    return null;
  }
}

//Get chart of account
Future<dynamic> GetChartOfAccount(String token) async {
  final url = Uri.https(
    'bsslapidemo.dcontroller.com',
    '/api/eneralCode/Getchartofaccount/Getchartofaccount',
    {
      'staffcode': "10604",
      // whattoselect

    },
  );

  print('Request URL: $url');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      final decoded = jsonDecode(response.body);

      if (decoded is Map<String, dynamic>) {
        return decoded;
      } else if (decoded is List) {
        return decoded;
      } else {
        print('Unexpected response format.');
        return null;
      }
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
      return null;
    }
  } catch (e) {
    print('An error occurred: $e');
    return null;
  }
}
// Get Company Info
Future<dynamic> GetCompanyInfo(String token) async {
  final url = Uri.https(
    'bsslapidemo.dcontroller.com',
    '/api/GeneralCode/GetCompanyInfo/GetCompanyInfo',
    {
      'staffcode': "10604",

    },
  );

  print('Request URL: $url');

  try {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      final decoded = jsonDecode(response.body);

      if (decoded is Map<String, dynamic>) {
        return decoded;
      } else if (decoded is List) {
        return decoded;
      } else {
        print('Unexpected response format.');
        return null;
      }
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
      return null;
    }
  } catch (e) {
    print('An error occurred: $e');
    return null;
  }
}

// Save record
// api/StaffAdvanceRequests/SaveRecord
Future<dynamic> SaveStaffAdvancedRecord(String token) async {
  final url = Uri.https(
    'bsslapidemo.dcontroller.com',
    '/api/StaffAdvanceRequests/SaveRecord',
  );

  final body = jsonEncode({
    "referenceNo": "string",
    "staffId": "string",
    "staffName": "string",
    "department": "string",
    "advanceCode": "string",
    "date": "2024-11-21T14:17:26.249Z",
    "amount": 0, // Ensure this is greater than 0
    "description": "string",
    "destination": "string",
    "purposeOfJourney": "string",
    "purposeOfAdvance": "string",
    "departureDate": "2024-11-21T14:17:26.249Z",
    "arrivalDate": "2024-11-21T14:17:26.249Z",
    "duration": "string",
    "travelAdvance": true,
    "recordExist": 0,
    "officecode": "string",
    "companyCode": "string",
    "fileName": "string",
    "fileFullPath": "string",
    "sentToNextProceess": "string",
    "returnToPreviouseProcess": "string",
    "returnReason": "string",
    "quaratined": "string",
    "retired": "string"
  });

  print('Request Body: $body');

  final response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
    body: body,
  );

  print('Status Code: ${response.statusCode}');

  // Check if the response is valid JSON
  try {
    final contentType = response.headers['content-type'] ?? '';
    if (contentType.contains('application/json')) {
      final data = jsonDecode(response.body);
      print('Data: $data');
      return data;
    } else {
      // Handle plain text or other content types
      final data = response.body;
      print('Response: $data');
      return data;
    }
  } catch (e) {
    print('Error occurred: $e');
    return null;
  }
}
